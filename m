Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C28A8BDF6C
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 12:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0C971124D2;
	Tue,  7 May 2024 10:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KVuCKvFI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F7B10F34D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 10:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mhj5hA7iY/x/mP5N5V7Njlh+AkiRaKFwPWBbmDMFaKOY1W6Vu2qrHW32knw+i1weCRlr0A6OpgLwXixjPB6e8kuGDXO9Ugdq4Dt2TpTVNn1C/TiC+KU21P1E7uV5oJzSkoow7Hfuc6gH4ETvtybM6L2dPTpe0Io5w+1C8idDUT1p2oKE59KziqP5PSKTcHRzmhuujC2VkXzPYLHQWQH72wV5eALHxA5sO/hyfqUTmmchfhlYCa2k2WVrn2nZBejn63ecHNhcL2K6KhO2QrBEJ0tD4Z0k7SwxRlwxzIbiTaUQQh0738CEwBRBgW86w0daVAD+tNibdilVBp2xtCXqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlRLHdWEYeq286nTvaHkjbWHadntriI4JE8Oken86nA=;
 b=lKWhyzmeZKjdewcAKMLiziL/aZA13s0I3xFhAzf4CgAD9MFWhDxvOXCE4aW1/7EwuTY3CGJ5jDd2A3sGHYzxiBC5BB2Crmv3C6DLrnYP5+QlNZlayX829XE57o89dnIA11gUU8EYNlV+kzNmxm4fM1XBb5vTszVK18LEbEG1kpc/7DrK1f3bjGFw1izz/OUllnli9KBb8/H9vKoBMN23WMv0U+lD8KauZa9XP9xkqBuOenqkGD9qJaLmjhusZ/deA9Ue6rqKaNB1h/hYP9/apDvLdYD0mZNibDdBLG4QCER8sjrF9FHAM5DkybGokBvw1Z8MveBvzClROsRsRghw9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QlRLHdWEYeq286nTvaHkjbWHadntriI4JE8Oken86nA=;
 b=KVuCKvFIZVASMGjWh8TbzOZE0oxX6UJJ7zHP4/UM3Mo4qxDpeCt0iiBKm4Bt4gW4FPegpjJ4CEKLozxJwyHCx7JLV63nqXpRh8gtxtzD8TdbsnhN44ST8UIMRCOL4SfdFdYfiWjBkCMTlMQcUx2ulHm3MevUMBYDZkxSzhI2vbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 10:10:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 10:10:13 +0000
Message-ID: <8915fcc1-d8f1-48c2-9e51-65159aaa5a3b@amd.com>
Date: Tue, 7 May 2024 12:10:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: "T.J. Mercier" <tjmercier@google.com>,
 Charan Teja Kalla <quic_charante@quicinc.com>
Cc: zhiguojiang <justinjiang@vivo.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
 <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
 <4fedd80c-d5b6-4478-bfd3-02d1ee1a26e5@vivo.com>
 <aab5ec51-fcff-44f2-a4f5-2979bd776a03@amd.com>
 <2ebca2fd-9465-4e64-b3cc-ffb88ef87800@vivo.com>
 <d4209754-5f26-422d-aca0-45cccbc44ad0@amd.com>
 <289b9ad6-58a3-aa39-48ae-a244fe108354@quicinc.com>
 <CABdmKX3Zu8LihAFjMuUHx4xzZoqgmY7OKdyVz-D26gM-LECn6A@mail.gmail.com>
 <8ca45837-cbed-28da-4a6f-0dcec8294f51@quicinc.com>
 <83605228-92ee-b666-d894-1c145af2e5ab@quicinc.com>
 <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX2MWU9-9YN46PXx-Jy-O9CHMv8hCkvArd7BbWUBs=GPnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a0800a4-c938-4a5a-a324-08dc6e7de2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGoxSlN1NEh0SUhPVllxbk1TS1dTZERneE5PWjVxdkt4WUc5RTJXdHV5RGp1?=
 =?utf-8?B?aXFtbTBxaE9KeTN5Vlh3REJld1AzMnBQM2t6V2hLcW93aDlpeXhtSGpGVm1x?=
 =?utf-8?B?Ky8xN2poNlVpWDlYUFd0Q2hMQ2Foc3FDNG9RaEdLL3J0a00rQ3RxVWRCUUpL?=
 =?utf-8?B?REJiemFwM0lNd00wMzRmdytrVWxnZVdtd2xzWVdlYXJmWDB2cHN4b3dUdUsr?=
 =?utf-8?B?NEg0QWplZVBYZ05XcFVBV2ZNcmdRV2x1WjFjRFNZbUlGamhta21ibi9NSGU5?=
 =?utf-8?B?T3IyQjNJbmkzL2paNHZiVkRCOTlvT2JRbWROeG1tbVBMNCtBQzJ0NnZRSFV5?=
 =?utf-8?B?Z2h1azBscTBYWVdEbnVCMXhIdDh2TTZnSlVpS2NzVzFZdlNRa296TklBRks4?=
 =?utf-8?B?Sk15bFRZMGFsUUU0NzZPUWRocTloMXErdmJybGZ3a0hVeTNDQWw1aGRiR2RC?=
 =?utf-8?B?NFpCQkt2NTdHTWxnWURIcytQZERVQ1lvMGFSZnF1Sms5YlJGMjhqQ3JhcFdv?=
 =?utf-8?B?TkFhNkcvSmUrTkVPMzNya2xtT2ovbS9rRkpBSW8rRUMrT0Q4SXNzR3FSYVJy?=
 =?utf-8?B?Q0V2UlQ4Zmttd3ErclhOcWs3dmJlV2xlUjMwR3FldzhVQ1R6azZ6M2FVNVlF?=
 =?utf-8?B?cTdQK05oUUlBa2NoeCttQmZEaVNLMEhoa2VFWFl4aFRodGFCTHJjMEJldkZX?=
 =?utf-8?B?d1pUWlZWT0FVcFVqUXRrWkNSWXJKZXk4TGxHc29Wd3BRMVNOZEVuOTFEVGVk?=
 =?utf-8?B?QzBCTmxiRVh5SXVQRkxHdlFaNTMwQ2tjTDF1OE80QzcrZERSZWJDMk1FOFll?=
 =?utf-8?B?Y2FkbmlPUG9nNGdRUXVjZG9Kd2Zud1FxSGd2bjV2aFczTjVlSzIyRHU4aVJt?=
 =?utf-8?B?RWF3eHdOT1poK3dBTFhUVlhqKzMrMGg1VVNtMzlJMFRtRE5MSjRCbWFGdkl4?=
 =?utf-8?B?b2hKVnBxWWdya2hmZ0pMNnAxMm9UalZZYmQ1ZmFEL3ViWTViaXJ5bFNWdjA1?=
 =?utf-8?B?NnFqcWZjUkZwc2pRVzltc01rQ0NyMlhRdW83Z0srSWUrdzlPVjAxUE1oQWYz?=
 =?utf-8?B?NGRHbjN1aHVRMzhTcmkycVR4UFNOWGJHNCtlOFJ3KzdNMS91SXVPK3JYZDZL?=
 =?utf-8?B?TXRKL2tLTndlczhIVU1ueWZxMmVhRGpVak1oL0R6WXZOM0tXeGpWalN3NGNt?=
 =?utf-8?B?TjB0NkQxL1NNUDBDSjd3eGY1NVV1bTRxZkZkbElYV0RQUExTeFJuSjJhbTVU?=
 =?utf-8?B?ZHd4aVJBemlDVHZoZTNKeTZnUkhycHhhY3NMbGp2MlR3L1NMSUFYejZvMTlV?=
 =?utf-8?B?RENMRjRNOGN5VHZQVW0zQ0M0SDdDOXhaVkR5R1d6emYxNjNvcGVxbUd3c0hr?=
 =?utf-8?B?MWdWL0NKeGYwRlJvSmhVZ2RBWkx4bzNOaGV2WkNYV0NCM05vMFpHbW5CTEFh?=
 =?utf-8?B?S1lrZWYvcDlTaHBMV1F0N3B2ZmhNUFdTS3NGWTJnOU1kbkx5SGk3UXRLeVRj?=
 =?utf-8?B?SWNoUU1sSmhHRkNUcWpPWVhqQS8rUkFYYm5vRlJPQkd0cWcwUTNCdlhnaHRa?=
 =?utf-8?B?MXlEZU5IWUpYMU9MbEhGQzNhWCtQM2xtTFV4d09Lck1CcUc3RXV2R1NIa28v?=
 =?utf-8?Q?qy36Zn2hPRRWbhZggDkfu4+eJ0Llp9fmoa0RAG1H64l8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm53ZWdiM2hITWJSQnJCeU1GYXg1SnVyV1hLaEFzbi95bkRXS001TzlCWFND?=
 =?utf-8?B?dHowS2g5SWg5Z2ExZUdaVm96Mzc3SDlCZm8yTlM0ckRFeU5uaGd3dXV6Q2FY?=
 =?utf-8?B?K1pyUmpiNXBXTFd6ZzNyVThjN0FKd1k0ZjdjQ25JRlc5WDVBb1QzOW1KY0Z6?=
 =?utf-8?B?U0NqcXVBQzB0L3pvbXBQakxlUmpmVmNwUWg4bXRXTWhvaktPY0Yzc2RGNjVx?=
 =?utf-8?B?dmZlV1d4YlFFbU1XU2F6aE4vcVJDcEhTeGNlV2lmKzVndkc0NDB1R2gxTFNR?=
 =?utf-8?B?VStaK3YrTlNxZnlxQzZqcnhYYXFyOWJoN2dORlNubXR2amJUd2ZEck1tZWs2?=
 =?utf-8?B?Q2ZnREY5OEhqVUdJYUxOYnNIdy9WQVc2YnhUaEliL21Gc0tzZzd5ZFdNTjhP?=
 =?utf-8?B?eFFKci9pd09YSmFiN3FNZ2ZHUW1vUEhteGJBRjV6c2p6c3R1MUlSYXh4SXNh?=
 =?utf-8?B?OTdGeUdTM2ZKSmx1WnI0YzVaYTkyL1B1UE9SNzRPQkZSUkd6RGFvQ01lYnFL?=
 =?utf-8?B?TlkyVTBxZ1pzenI0amZkV3g5bVNDOWl5THk2OTYvcEhyMDU1VHUxQ3FLVHYx?=
 =?utf-8?B?Nlk2ekNBbkM4UkdTS2dZT2Q4ZlZLZnBZdzUrY0Y2M2JGbEFpckdHKzh6OTJp?=
 =?utf-8?B?QUlCcmFIYVhRcWFic3lqeGcxS1dqRkhpVHNvTTN3Wm5FY1VuTms0Sy8zbjVm?=
 =?utf-8?B?TUZsbWlVQ3hjbzNxVnk3aitJclJHVW1GMitMRUEvaTNrRk0rMEtwU2p1d0xl?=
 =?utf-8?B?NHRCcCt6WFZkZGZ5TjBLQ3FmU2JPMGhoQjNhRXlOVVRPa1JlSnJrRzhCVGpR?=
 =?utf-8?B?Z05xT0tQdFVpTjROcDlRSTQxeitHeEFhTDU1eENnY01LYkw5c3FBczRkc3NE?=
 =?utf-8?B?SkNLem1reENqWld6b0p0N2cydGlvSE5xclNTWXBySzlKcTRFR3hKL1QvVkZH?=
 =?utf-8?B?S0hZTmM0ZzM5Q09BcU1JYUFpTEY2VEJuZlovTXNmejUwL0IyZ2JKRngxSlVk?=
 =?utf-8?B?bTFlWUNRU21rdzh0M281bFRHTVFIMndHb0t5SW5EYzgzaGxiZTAzd3YxcVo4?=
 =?utf-8?B?enFRVWxjMDVLTVpVTFh1bmtncllES2pOZW5ib1M1YlpKbmhUZTRBMHhrUTFY?=
 =?utf-8?B?dmFnMU5kdzJDUWFlOFpqTkkxQ1ZseDVvQjFaL3dmejFDZjczZHVmUzh4WlZJ?=
 =?utf-8?B?MEhUbnpya1k0OC9TWEpuVE5XNXc3T2FVbmh6RktJMm00d3k2MnN2V25hQnJ5?=
 =?utf-8?B?Q1pnZlJSa0plMXRJV1VqcTlUeHlwTU1MN1l2RjZnQVE4ZDNnQ0JxQ2NIOEth?=
 =?utf-8?B?bG5ESStOczdNa0dRMEJOY2FGNS9lOW5CcW12NjdPTXpzbHJuMm1NczVuZWV6?=
 =?utf-8?B?c3VIMmJVQXpWQ0dRWDVjYllMekw4MERQWHNLOHJjejYvcEp2aEhLVS83T1VD?=
 =?utf-8?B?czV2T2dpN0Vqbmo1b1BQRzRxTTZUSXcvUlB3WDNzVXlBL2JXYllteUVRL3VQ?=
 =?utf-8?B?V1NRQW9JR1hzSDB1cGdpYmZLTGhsdDFwYTMzSnJWL0pGRGFEZFM5RmNwZk42?=
 =?utf-8?B?RXNaUkhYLzk2Rm5nMDNOWUtZUWN2TWg4TFZ6VmlLeW84Q1lxS0w1RGN1SGVi?=
 =?utf-8?B?NVNVTERjRW1Ed09WdlFmaVBWQzVscVZsdWh2b3VKMVEySlArc25ZSFVCN21o?=
 =?utf-8?B?ZEhuVWhzQUpCUVFmWTVOalhOSXNrVTJVdUlaZDk0QzNhajNoWmo3Z1Uyd3dz?=
 =?utf-8?B?VGJSbkQ5V2dYc1h3Q3drWDd0RmxWLzRpaGQ2c1dUL0ZzNnlFeU1CcFlKT2Q4?=
 =?utf-8?B?SjBuRGJRS2xUUnhXZTNmTVBBQ3RzeW00STVQZUZPMmdUak1WREIzbndMSyt6?=
 =?utf-8?B?NVg5bndIYk1ZMS9mdDRkaVpwZCs0VlNOU0xjdnNNQ1kvemJwZmw0SDlHN1B6?=
 =?utf-8?B?T3hTLzltNGd2QkYySExvemFLTnRCYVh0Zngra2lsc0FhR1Bzcm1LK3kxakVl?=
 =?utf-8?B?L1Y1ZTNUSWREalJtZitGVDlsZ1pUYzEwcjVseVgzSVkzd0U3c2hpc0ZUTnRr?=
 =?utf-8?B?aEttcVNxMys3TVNkN3Z2a1YydE4vNmtGcHNQeGcrNWFSQVlER0dPZ1crd29k?=
 =?utf-8?Q?KzJ1dMTjBDGJjZDi8zhvsi9AE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0800a4-c938-4a5a-a324-08dc6e7de2b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 10:10:13.5565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ekPxnk4+TbKm1ot4/t6MM3XiR5ehHyYThvvbcGVVAxFIpO8Qddja/0TjFHjSkRe5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.05.24 um 21:04 schrieb T.J. Mercier:
> On Mon, May 6, 2024 at 2:30 AM Charan Teja Kalla
> <quic_charante@quicinc.com> wrote:
>> Hi TJ,
>>
>> Seems I have got answers from [1], where it is agreed upon epoll() is
>> the source of issue.
>>
>> Thanks a lot for the discussion.
>>
>> [1] https://lore.kernel.org/lkml/0000000000002d631f0615918f1e@google.com/
>>
>> Thanks
>> Charan
> Oh man, quite a set of threads on this over the weekend. Thanks for the link.

Yeah and it also has some interesting side conclusion: We should 
probably tell people to stop using DMA-buf with epoll.

The background is that the mutex approach epoll uses to make files 
disappear from the interest list on close results in the fact that each 
file can only be part of a single epoll at a time.

Now since DMA-buf is build around the idea that we share the buffer 
representation as file between processes it means that only one process 
at a time can use epoll with each DMA-buf.

So for example if a window manager uses epoll everything is fine. If a 
client is using epoll everything is fine as well. But if *both* use 
epoll at the same time it won't work.

This can lead to rather funny and hard to debug combinations of failures 
and I think we need to document this limitation and explicitly point it out.

Regards,
Christian.
