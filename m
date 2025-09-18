Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F1B86687
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 20:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EBA10E0C3;
	Thu, 18 Sep 2025 18:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GRQUpGdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012050.outbound.protection.outlook.com [52.101.43.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A110E0C3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 18:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5lXl+SsOAHIShsMlBuJ/KOJLWBvXg9h6D04v9givrDXe08FoiS+o4pNpvz6455vSBU6bcoPjLl4BWXMowY/oAmzSHaumQQmXSj6CJh8/z2ecXSNOb3cmjqNe2/Eb1tAGlZeWWg8bhyAHbO13RRK6sQ87atCW3Xz4n6v/JmQxnwHfyCrGIXWLkjXBJ7252gvpIsBk0TLzh7T9dr9y8sauf0CjEt86F6RQjV3SwMP8dbH9SvCtp1Osw+4uTyT4/udaD8OvH4/buughODQ0U8ihqQbvlgnw/qdCmepXt6Syl/6LUwjLYDQZ08sVoZisen04aPI2GfLO4ooYbZkrcy6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gztCfuq0h/8WGlN1atuokTDNJVGetCWGCoAVsjXypNE=;
 b=yNKiEE5hHhBAdDQeW+vjdrHBgtrh321uZDza2u7X2u2gK86F7PXSNasKoHsqcUnQhGxSfzUaYrDUFBY4sOQSgCRn/7DykmqUlo997SYAk61Fi9eW8UZ+7p25q60wPwpjrpyH7m5cMR21hhSYqGSwHbeP10VYCGfmlS1VTOV5buS/1m0FCisFPQYoAW5Xz33mBCD9m8UbEHshgK3AjkqDkqjmmajDBb8+7Pk3AvtzTG04umLSnLM3JqGJobgnZt+GAsq1wEy1zeQb/1YO1Ch2MUc5eN29TBMCzoCV2u/hn8kpUxmqZiBuBavGUOJ8G1zwzHa8Kp2uhEaiErnx2O89+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gztCfuq0h/8WGlN1atuokTDNJVGetCWGCoAVsjXypNE=;
 b=GRQUpGdJZfkNHSs9A6jGmdjVx70MPKvGYCmx1esplL2yEWJfxDSdWxb3IeVBlsb4lqrFuzMlOVLs+lk5DXD0wfpHhDQ/i6fXhffdZHlqfcfwpKErOfu/YRsITmhfTQry0rNhxbaNke9qp76oMF/gi73pA54BwPU3sU08yMeouHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8781.namprd12.prod.outlook.com (2603:10b6:a03:4d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 18:23:37 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9115.020; Thu, 18 Sep 2025
 18:23:37 +0000
Message-ID: <b8640908-cc98-4352-a06b-3cef90a44c5f@amd.com>
Date: Thu, 18 Sep 2025 13:23:34 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Enhance runtime power management
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20250918172439.428139-1-lizhi.hou@amd.com>
 <cc39e8ba-b465-4f4d-8642-884fda8738de@amd.com>
 <7cf39bc9-5081-7703-f712-3a49e08d9ff8@amd.com>
 <c751422a-722a-45e5-9d7d-08874f0bb534@amd.com>
 <1f2f8eae-f7be-f3c3-834b-418aae921a86@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <1f2f8eae-f7be-f3c3-834b-418aae921a86@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0009.namprd04.prod.outlook.com
 (2603:10b6:806:f2::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8781:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7222aa-e4c1-4583-7638-08ddf6e07c4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUJNb0xidEpxUDB6cnJIbnEyQ2R5dmNwSGY4YmljaVBaUStvanpub2VpMDdn?=
 =?utf-8?B?YUI3RFQvVjErOGo1VVE3Q0Y4T0JvWDZoVHlKRExzeE9ZMk1uQ0o4YjhaT3ky?=
 =?utf-8?B?QnNVUEFZYzFhSEFSeTdISG5KR2NrbjNURm5MY3J1NmRHdXJHcTNvY2xxbE4w?=
 =?utf-8?B?S2dpK0M4Szg5THBtYVFYWWhZeTMvc2k5Tng1Y2xkMUVMdEZYSUkwNUdJODYx?=
 =?utf-8?B?OCtrOWNRT3dtcmJsM0I2cWptd0YyL1MwQ1c3WUJmWTh6QkkrSVNvUHNuNXhC?=
 =?utf-8?B?dEJ1ZzN0OVk2dVBOd2xEcWd2QzF0VGhEVmJJcjFxZS9xcUx4MnY5RVFwYzdm?=
 =?utf-8?B?d3orV3I4c29BL0VHYnlkWkpGVDRIOTMzV3JCVlAzNlNwVWViZitrMndlcytr?=
 =?utf-8?B?eU9wM0daaGpQVmE5UTdKMWxVYWU2RFV6OWJYa09qQU0zOHBvOVR1Z2c4SWJw?=
 =?utf-8?B?elExUVgwd0dGN1hpb2psaHFWSHA3ZGsxZGFzdklWelU0bDExNWlVUlB1RFRJ?=
 =?utf-8?B?MXZUMVlHd2grN0ptVlgzMGhpb0pIdDRUdS9Eb0VsTndJVWwrYnBxRXlEdGht?=
 =?utf-8?B?OFIvYzh1K2lmYkNhaVpsSmFqdmpuSmdSYUNIeTB1anZWZ2NhcTQvRDhicHN5?=
 =?utf-8?B?TS9XdHNUNjdDV1NkdHNka2RVTC9HUUZIVHBwYWNpQ3A4N0swU29wdXZZYXNx?=
 =?utf-8?B?RStOTzJDTys2WndRTnhpMVZGVXNDSXJOVHk4dGd5c1h6aW1ObitSZXBQR1Fa?=
 =?utf-8?B?am85THlqaXIxQjA3djZFMnJjM2VGS3VmZlJ2enhCVEQ4b25BRE5MUmlESEZN?=
 =?utf-8?B?Mk82WC9iOUh3MGM3eTlJV29HV0RTUm5JS1lyYmM1L0RoaXF5NnBlaE96QjZZ?=
 =?utf-8?B?eW9WdkpwYy8vNVdoZk4weGlYUURQTnJkQ3hRMndTU2hCOE9TVnd5aXAzUmJM?=
 =?utf-8?B?bWtpOUhkZDVoWituc1dTSHlRNkVaUlQrOGlzUkpFZ2c5ajlNVmVmUDl5U01m?=
 =?utf-8?B?ZEV4d0hnMERBTVRSVktQbnE4M2RGVFFrcFh0UkU5Q3o1d3JUVEpoWGNlN0sy?=
 =?utf-8?B?UGQyaGRvVUZKci9sWjRRMUFPQWVweG5SYkVGcXZoc3pGamYwa2FmOTBHQ0E2?=
 =?utf-8?B?L3g1ckFwaGdGUS9VNFpheWJ1dDVteFdBVUN2cXdQSEJwVThKTWUrSXFkZldB?=
 =?utf-8?B?cG9GcDNsMlF3MVI2UXFNZ2hmZDI1ZEVCT3dSekdzTHF0ZmJpOTE0STlHdXds?=
 =?utf-8?B?S0pxOStxSkRtVjJybFBMaHRWZjZrWTdHdHA5bmtKeTZMV1Z0ZHhGOU5URDJr?=
 =?utf-8?B?Z2UrQnRGbGZiVzhxWkVZUXRxZURSS1ZTNWZOQXRRQUF2YTZtK0U4UVRCRGkz?=
 =?utf-8?B?aEt4Ty9vNGZwVllJbkVDWW4xMm5xUWpQT3A2eW5uS1J2QTByL1lna0NndjdN?=
 =?utf-8?B?N3MxVWZFeWptNThxcld5OEFFL2MzRVRuSDQ4Nmh5TmVwV2NXblY5SnJrTFh1?=
 =?utf-8?B?RlpLUTlDWHpoTThnbFk5Z05vaVJnQXhTM0MvUnBjTVBiZzQ1NDR1NEhIdjdC?=
 =?utf-8?B?eFN1bmM2QVRBS2NVZStlYmNaU2pzSXBDOCtBdmRQeVdIYU0wNmVYVGtKZzVh?=
 =?utf-8?B?QUpGNk45Z1VsYnJ5NTM1eWlSYXM5L0RibDJzUURWZWF1UnVybUQzbWQwSXJX?=
 =?utf-8?B?YTJXUVpmTEt5RElRUm5sSTFjcEJpYzRzRis5Z256ZGlYQzhteDZCTkFjM3hj?=
 =?utf-8?B?RkRUZWw5SWV2RUhtY0EzVExXcXNDQ1R2dWdzUjM5LzNxcnhNQzdYVEp6Y211?=
 =?utf-8?B?THZFYzdZS0JSYTlRcE5rbmh4Y0d4RTRyVmF6MWU0cWtwV3ZybVFNbGIvUDRE?=
 =?utf-8?B?VncvYnduQ1hjQStEeW5LZ2Z1TFJvUzNjMkRuaUJpc0tzMGlYY2V2UDBna0ZF?=
 =?utf-8?Q?qgqNOAtUEuk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODFVUW9OazdjUVpLUXpMZkkyRXNkMmM3VDhrak9UU0toNEFEcTlLWEtPN24v?=
 =?utf-8?B?WGhTdDkrM2ZBQy82VU8ybEF5eXIvMWlrdDNoUXl2VS8reXlPS0lVdjZtUi8z?=
 =?utf-8?B?RERlYlIxdWJ6YkRISjIvUTRMYkdxQ0xSbm9ZSHRNSTRaYlAwMm5obHZreERw?=
 =?utf-8?B?RWpxek56bWwxbEV6MVNxMXl1RDFaT2p2OU4vWlR0TWNQV0tYcUhkTlo1Vnl2?=
 =?utf-8?B?Uk1oRTBTUUZDSnVMWkNxM0hDaTZweHJidGsxZlRULzRuRnhjbXR2Z3U0Vmkz?=
 =?utf-8?B?Ym1EMUpZRDJnSHltRHp4eHdxRkZoSzQ0d2VwT1JOaFZBdU5lNVVsRVhuWHBx?=
 =?utf-8?B?c1Y2NDlqMUpLci82ZzFXZHhTRDlPU09hMHhaNmlmdkxDUm9OdFk2bFltaHBo?=
 =?utf-8?B?Z3RlK0ZqNHNvanM0Vi9MREM3L0JJVGQ1MnppeGs0Tk5nOXVFaFhySVpUOEo2?=
 =?utf-8?B?aVEzSENyUE54RDU2aDRNVWp0Mkd1Y3BmWEZBZ0ZTZWVOYmtvelJPcU82dnFD?=
 =?utf-8?B?R2Jrd1RFWFhBZDhBYkRCY2U4aSs3Tlc1NkUrNWlrdWVyY3NxbUIrNUk3THNj?=
 =?utf-8?B?YVg4L0NCY3N6bmNocFVFRjNQb2dxTVJlcUhxb3lORzZ2QnlZN25EejJPaHFx?=
 =?utf-8?B?OU5GMHpQWGluS2Y0dHZIOVErSUpJejFIREZZTVVDbjZ1dGtqMzB1eFdreWJi?=
 =?utf-8?B?VzNMbkdVWnlOQ2hJQ0lJZ0lCRUlKVUN6NldsT2tQbTBJY1pMYWVGaWljcjBk?=
 =?utf-8?B?RUR0ak0ralA0L1hkNFVuR0xsVjdFVGN2dEl5bUR2bk1MSk1OYWZNb2ZEV2pw?=
 =?utf-8?B?SzhKbldkWFczQ0ZhR2NhWEZxc2FReVkwU1ZINysrelUyKzBUM0VqVXBkQ2dV?=
 =?utf-8?B?Kytzc2ZWWDFNSGVCYXJyMyswYk9TcisySERaVk5GSlZqZnk3RkY3eUk1eVA0?=
 =?utf-8?B?VFdJSExMUmNZbmE4VDJ4TEc2ODF0QXJqOHZpUVNEWkdaeWZCTTUwcFpLS1l0?=
 =?utf-8?B?QzAwQmdVUTgxMkNEZzdWa1BibUM0cnZ1cis4UjJqcTFBSjFYUkVCa09MUmUy?=
 =?utf-8?B?Vkl0THhzazJuc2d0ZVBZYXd6NXJzWWJhaCtGQkFrdy9wQ2dYakFCZWgxYlhh?=
 =?utf-8?B?cVY2NEptMG92UXJycGMvSGhraFpsU0krNTZ6NVdOYkFTSkxqOUhWODBnMW9t?=
 =?utf-8?B?b0I2NzZzclk3bUJZaHh4WERWUERJbzlRREN6TnJmRHByMlY1dldRd0dHeXRk?=
 =?utf-8?B?aDRFa0ZKeDREaVBRT3BKSTZEMXVzL1FIMlFMbEJlRmhVTVlXRkNsdENTTkxJ?=
 =?utf-8?B?UFZXN1paRjhoVzFYcnM3NHY3cWJGTCtTdlZuSmxnQTlsdXZGZHJ2Z2cvbGZX?=
 =?utf-8?B?NFhaRTZyanQxN2pteWdRWjRIV1g1WWZJd3FMUWQ0UHJMb1Q2Rnp3cVRSb1dh?=
 =?utf-8?B?RzAyYzdNVE0wRWJOSjk5YmlRcjR1Yk5DWFNTODBUWTlaMHA2Q1QrdXdtWWhS?=
 =?utf-8?B?QzlKWHE4Rnp5MjNlWCtJRWFPcjZDNytGcll2dmtWc2JscmltMUVGZ0Zld2hJ?=
 =?utf-8?B?R0VNdG5UN3Q0UC9vUGttdHRIdlg4ZktiKzk4K2c1ZlJHd2lsdmExbXNlUWhI?=
 =?utf-8?B?Ni9VVW9zUE1wNTRMbElST05VR2laNWZNNmRNZXZUK2s2ckZsZ3g1UGhPaENq?=
 =?utf-8?B?RHNxUS81OXo0bDBtdC9sc2tERWV3Y2VPL1BMSmMwVXJXM3J1eVpvOHp5ampx?=
 =?utf-8?B?cHk5UHZmekVKeDY2Qk9oQVp0RStSTlFBTlhOVHZwMHFySzRmRFZ3amp1Vngr?=
 =?utf-8?B?bXZqWWFaWmxjcEo3dGFmSmxteDR3WFpUZzR4eWtaVTNZcnVuTlFTRTk5QjFk?=
 =?utf-8?B?VDNwdVJuZm1tdU1DRGNEU096a0ZaVHBwdUpld3IxczB5Rnp4eTI2eGNsWDly?=
 =?utf-8?B?RXZSYjlVSFJhR0xaaHNBb3lRZmxqQ2FBR1FONFEwNkVFTDdZUVRwdmthdFpz?=
 =?utf-8?B?b2l5OHhCNjFsUElpeG9GZUszYnoxU0czMzMyQi9VWi9sSVlCeExzRFMydTB6?=
 =?utf-8?B?ZTc1M09QQlZEQXZIZVpEcWkzMEQzQURWTVdobnJEancwb3lWeThqSVEwd1Ru?=
 =?utf-8?Q?WdqAZXGiZJqSSC4zlz/0T/IhQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7222aa-e4c1-4583-7638-08ddf6e07c4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 18:23:37.6490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc+uAvZFxLdGvNPKzDeDMSzT8CJejO7gQOH9weS9BHxQue1HpeZe+LYA1ApRPL/A1tKQFrJs5un+koyqvZpePA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8781
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



On 9/18/2025 1:05 PM, Lizhi Hou wrote:
> 
> On 9/18/25 10:43, Mario Limonciello wrote:
>>
>>
>> On 9/18/2025 12:41 PM, Lizhi Hou wrote:
>>>
>>> On 9/18/25 10:31, Mario Limonciello wrote:
>>>>
>>>>
>>>> On 9/18/2025 12:24 PM, Lizhi Hou wrote:
>>>>> Currently, pm_runtime_resume_and_get() is invoked in the driver's open
>>>>> callback, and pm_runtime_put_autosuspend() is called in the close
>>>>> callback. As a result, the device remains active whenever an 
>>>>> application
>>>>> opens it, even if no I/O is performed, leading to unnecessary power
>>>>> consumption.
>>>>>
>>>>> Move the runtime PM calls to the AIE2 callbacks that actually interact
>>>>> with the hardware. The device will automatically suspend after 5 
>>>>> seconds
>>>>> of inactivity (no hardware accesses and no pending commands), and 
>>>>> it will
>>>>> be resumed on the next hardware access.
>>>>>
>>>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>>>>> ---
>>>>>   drivers/accel/amdxdna/Makefile          |  1 +
>>>>>   drivers/accel/amdxdna/aie2_ctx.c        | 42 ++++++++---
>>>>>   drivers/accel/amdxdna/aie2_message.c    | 28 ++++----
>>>>>   drivers/accel/amdxdna/aie2_pci.c        | 79 ++++++++++----------
>>>>>   drivers/accel/amdxdna/aie2_pci.h        |  3 +-
>>>>>   drivers/accel/amdxdna/aie2_smu.c        | 28 ++++++--
>>>>>   drivers/accel/amdxdna/amdxdna_ctx.c     | 54 +++++++-------
>>>>>   drivers/accel/amdxdna/amdxdna_mailbox.c | 13 ++--
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.c | 56 ++-------------
>>>>>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  2 +
>>>>>   drivers/accel/amdxdna/amdxdna_pm.c      | 96 ++++++++++++++++++++ 
>>>>> +++++
>>>>>   drivers/accel/amdxdna/amdxdna_pm.h      | 18 +++++
>>>>>   12 files changed, 262 insertions(+), 158 deletions(-)
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pm.c
>>>>>   create mode 100644 drivers/accel/amdxdna/amdxdna_pm.h
>>>>>
>>>>> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/ 
>>>>> amdxdna/ Makefile
>>>>> index 6797dac65efa..6344aaf523fa 100644
>>>>> --- a/drivers/accel/amdxdna/Makefile
>>>>> +++ b/drivers/accel/amdxdna/Makefile
>>>>> @@ -14,6 +14,7 @@ amdxdna-y := \
>>>>>       amdxdna_mailbox.o \
>>>>>       amdxdna_mailbox_helper.o \
>>>>>       amdxdna_pci_drv.o \
>>>>> +    amdxdna_pm.o \
>>>>>       amdxdna_sysfs.o \
>>>>>       amdxdna_ubuf.o \
>>>>>       npu1_regs.o \
>>>>> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/ 
>>>>> amdxdna/aie2_ctx.c
>>>>> index e9f9b1fa5dc1..691fdb3b008f 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_ctx.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_ctx.c
>>>>> @@ -21,6 +21,7 @@
>>>>>   #include "amdxdna_gem.h"
>>>>>   #include "amdxdna_mailbox.h"
>>>>>   #include "amdxdna_pci_drv.h"
>>>>> +#include "amdxdna_pm.h"
>>>>>     static bool force_cmdlist;
>>>>>   module_param(force_cmdlist, bool, 0600);
>>>>> @@ -88,7 +89,7 @@ static int aie2_hwctx_restart(struct amdxdna_dev 
>>>>> *xdna, struct amdxdna_hwctx *hw
>>>>>           goto out;
>>>>>       }
>>>>>   -    ret = aie2_config_cu(hwctx);
>>>>> +    ret = aie2_config_cu(hwctx, NULL);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
>>>>>           goto out;
>>>>> @@ -167,14 +168,11 @@ static int aie2_hwctx_resume_cb(struct 
>>>>> amdxdna_hwctx *hwctx, void *arg)
>>>>>     int aie2_hwctx_resume(struct amdxdna_client *client)
>>>>>   {
>>>>> -    struct amdxdna_dev *xdna = client->xdna;
>>>>> -
>>>>>       /*
>>>>>        * The resume path cannot guarantee that mailbox channel can be
>>>>>        * regenerated. If this happen, when submit message to this
>>>>>        * mailbox channel, error will return.
>>>>>        */
>>>>> -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>>>       return amdxdna_hwctx_walk(client, NULL, aie2_hwctx_resume_cb);
>>>>>   }
>>>>>   @@ -184,6 +182,8 @@ aie2_sched_notify(struct amdxdna_sched_job *job)
>>>>>       struct dma_fence *fence = job->fence;
>>>>>         trace_xdna_job(&job->base, job->hwctx->name, "signaled 
>>>>> fence", job->seq);
>>>>> +
>>>>> + amdxdna_pm_suspend_put(job->hwctx->client->xdna);
>>>>>       job->hwctx->priv->completed++;
>>>>>       dma_fence_signal(fence);
>>>>>   @@ -531,7 +531,7 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>>>>>           .num_rqs = DRM_SCHED_PRIORITY_COUNT,
>>>>>           .credit_limit = HWCTX_MAX_CMDS,
>>>>>           .timeout = msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
>>>>> -        .name = hwctx->name,
>>>>> +        .name = "amdxdna_js",
>>>>>           .dev = xdna->ddev.dev,
>>>>>       };
>>>>>       struct drm_gpu_scheduler *sched;
>>>>> @@ -697,6 +697,14 @@ void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>>>>>       kfree(hwctx->cus);
>>>>>   }
>>>>>   +static int aie2_config_cu_resp_handler(void *handle, void 
>>>>> __iomem *data, size_t size)
>>>>> +{
>>>>> +    struct amdxdna_hwctx *hwctx = handle;
>>>>> +
>>>>> +    amdxdna_pm_suspend_put(hwctx->client->xdna);
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>>   static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void 
>>>>> *buf, u32 size)
>>>>>   {
>>>>>       struct amdxdna_hwctx_param_config_cu *config = buf;
>>>>> @@ -728,10 +736,14 @@ static int aie2_hwctx_cu_config(struct 
>>>>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>>>>       if (!hwctx->cus)
>>>>>           return -ENOMEM;
>>>>>   -    ret = aie2_config_cu(hwctx);
>>>>> +    ret = amdxdna_pm_resume_get(xdna);
>>>>> +    if (ret)
>>>>> +        goto free_cus;
>>>>> +
>>>>> +    ret = aie2_config_cu(hwctx, aie2_config_cu_resp_handler);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(xdna, "Config CU to firmware failed, ret %d", ret);
>>>>> -        goto free_cus;
>>>>> +        goto pm_suspend_put;
>>>>>       }
>>>>>         wmb(); /* To avoid locking in command submit when check 
>>>>> status */
>>>>> @@ -739,6 +751,8 @@ static int aie2_hwctx_cu_config(struct 
>>>>> amdxdna_hwctx *hwctx, void *buf, u32 size
>>>>>         return 0;
>>>>>   +pm_suspend_put:
>>>>> +    amdxdna_pm_suspend_put(xdna);
>>>>>   free_cus:
>>>>>       kfree(hwctx->cus);
>>>>>       hwctx->cus = NULL;
>>>>> @@ -862,11 +876,15 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>>>>> *hwctx, struct amdxdna_sched_job *job,
>>>>>           goto free_chain;
>>>>>       }
>>>>>   +    ret = amdxdna_pm_resume_get(xdna);
>>>>> +    if (ret)
>>>>> +        goto cleanup_job;
>>>>> +
>>>>>   retry:
>>>>>       ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, 
>>>>> &acquire_ctx);
>>>>>       if (ret) {
>>>>>           XDNA_WARN(xdna, "Failed to lock BOs, ret %d", ret);
>>>>> -        goto cleanup_job;
>>>>> +        goto suspend_put;
>>>>>       }
>>>>>         for (i = 0; i < job->bo_cnt; i++) {
>>>>> @@ -874,7 +892,7 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>>>>> *hwctx, struct amdxdna_sched_job *job,
>>>>>           if (ret) {
>>>>>               XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
>>>>>               drm_gem_unlock_reservations(job->bos, job->bo_cnt, 
>>>>> &acquire_ctx);
>>>>> -            goto cleanup_job;
>>>>> +            goto suspend_put;
>>>>>           }
>>>>>       }
>>>>>   @@ -889,12 +907,12 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>>>>> *hwctx, struct amdxdna_sched_job *job,
>>>>> msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>>>>>               } else if (time_after(jiffies, timeout)) {
>>>>>                   ret = -ETIME;
>>>>> -                goto cleanup_job;
>>>>> +                goto suspend_put;
>>>>>               }
>>>>>                 ret = aie2_populate_range(abo);
>>>>>               if (ret)
>>>>> -                goto cleanup_job;
>>>>> +                goto suspend_put;
>>>>>               goto retry;
>>>>>           }
>>>>>       }
>>>>> @@ -920,6 +938,8 @@ int aie2_cmd_submit(struct amdxdna_hwctx 
>>>>> *hwctx, struct amdxdna_sched_job *job,
>>>>>         return 0;
>>>>>   +suspend_put:
>>>>> +    amdxdna_pm_suspend_put(xdna);
>>>>>   cleanup_job:
>>>>>       drm_sched_job_cleanup(&job->base);
>>>>>   free_chain:
>>>>> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/ 
>>>>> amdxdna/aie2_message.c
>>>>> index 9caad083543d..4660e8297ed8 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_message.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_message.c
>>>>> @@ -37,7 +37,7 @@ static int aie2_send_mgmt_msg_wait(struct 
>>>>> amdxdna_dev_hdl *ndev,
>>>>>       if (!ndev->mgmt_chann)
>>>>>           return -ENODEV;
>>>>>   -    drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
>>>>> +    drm_WARN_ON(&xdna->ddev, xdna->rpm_on && ! 
>>>>> mutex_is_locked(&xdna- >dev_lock));
>>>>>       ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>>>>>       if (ret == -ETIME) {
>>>>>           xdna_mailbox_stop_channel(ndev->mgmt_chann);
>>>>> @@ -377,15 +377,17 @@ int aie2_register_asyn_event_msg(struct 
>>>>> amdxdna_dev_hdl *ndev, dma_addr_t addr,
>>>>>       return xdna_mailbox_send_msg(ndev->mgmt_chann, &msg, 
>>>>> TX_TIMEOUT);
>>>>>   }
>>>>>   -int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>>>>> +int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>>>>> +           int (*notify_cb)(void *, void __iomem *, size_t))
>>>>>   {
>>>>>       struct mailbox_channel *chann = hwctx->priv->mbox_chann;
>>>>>       struct amdxdna_dev *xdna = hwctx->client->xdna;
>>>>>       u32 shift = xdna->dev_info->dev_mem_buf_shift;
>>>>> -    DECLARE_AIE2_MSG(config_cu, MSG_OP_CONFIG_CU);
>>>>> +    struct config_cu_req req = { 0 };
>>>>> +    struct xdna_mailbox_msg msg;
>>>>>       struct drm_gem_object *gobj;
>>>>>       struct amdxdna_gem_obj *abo;
>>>>> -    int ret, i;
>>>>> +    int i;
>>>>>         if (!chann)
>>>>>           return -ENODEV;
>>>>> @@ -423,18 +425,12 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>>>>>       }
>>>>>       req.num_cus = hwctx->cus->num_cus;
>>>>>   -    ret = xdna_send_msg_wait(xdna, chann, &msg);
>>>>> -    if (ret == -ETIME)
>>>>> -        aie2_destroy_context(xdna->dev_handle, hwctx);
>>>>> -
>>>>> -    if (resp.status == AIE2_STATUS_SUCCESS) {
>>>>> -        XDNA_DBG(xdna, "Configure %d CUs, ret %d", req.num_cus, ret);
>>>>> -        return 0;
>>>>> -    }
>>>>> -
>>>>> -    XDNA_ERR(xdna, "Command opcode 0x%x failed, status 0x%x ret %d",
>>>>> -         msg.opcode, resp.status, ret);
>>>>> -    return ret;
>>>>> +    msg.send_data = (u8 *)&req;
>>>>> +    msg.send_size = sizeof(req);
>>>>> +    msg.handle = hwctx;
>>>>> +    msg.opcode = MSG_OP_CONFIG_CU;
>>>>> +    msg.notify_cb = notify_cb;
>>>>> +    return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
>>>>>   }
>>>>>     int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/ 
>>>>> amdxdna/aie2_pci.c
>>>>> index 6e39c769bb6d..f46a3dcd0580 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_pci.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.c
>>>>> @@ -25,6 +25,7 @@
>>>>>   #include "amdxdna_gem.h"
>>>>>   #include "amdxdna_mailbox.h"
>>>>>   #include "amdxdna_pci_drv.h"
>>>>> +#include "amdxdna_pm.h"
>>>>>     static int aie2_max_col = XRS_MAX_COL;
>>>>>   module_param(aie2_max_col, uint, 0600);
>>>>> @@ -223,15 +224,6 @@ static int aie2_mgmt_fw_init(struct 
>>>>> amdxdna_dev_hdl *ndev)
>>>>>           return ret;
>>>>>       }
>>>>>   -    if (!ndev->async_events)
>>>>> -        return 0;
>>>>> -
>>>>> -    ret = aie2_error_async_events_send(ndev);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(ndev->xdna, "Send async events failed");
>>>>> -        return ret;
>>>>> -    }
>>>>> -
>>>>>       return 0;
>>>>>   }
>>>>>   @@ -257,6 +249,8 @@ static int aie2_mgmt_fw_query(struct 
>>>>> amdxdna_dev_hdl *ndev)
>>>>>           return ret;
>>>>>       }
>>>>>   +    ndev->total_col = min(aie2_max_col, ndev->metadata.cols);
>>>>> +
>>>>>       return 0;
>>>>>   }
>>>>>   @@ -338,6 +332,7 @@ static void aie2_hw_stop(struct amdxdna_dev 
>>>>> *xdna)
>>>>>       ndev->mbox = NULL;
>>>>>       aie2_psp_stop(ndev->psp_hdl);
>>>>>       aie2_smu_fini(ndev);
>>>>> +    aie2_error_async_events_free(ndev);
>>>>>       pci_disable_device(pdev);
>>>>>         ndev->dev_status = AIE2_DEV_INIT;
>>>>> @@ -424,6 +419,18 @@ static int aie2_hw_start(struct amdxdna_dev 
>>>>> *xdna)
>>>>>           goto destroy_mgmt_chann;
>>>>>       }
>>>>>   +    ret = aie2_mgmt_fw_query(ndev);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "failed to query fw, ret %d", ret);
>>>>> +        goto destroy_mgmt_chann;
>>>>> +    }
>>>>> +
>>>>> +    ret = aie2_error_async_events_alloc(ndev);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Allocate async events failed, ret %d", ret);
>>>>> +        goto destroy_mgmt_chann;
>>>>> +    }
>>>>> +
>>>>>       ndev->dev_status = AIE2_DEV_START;
>>>>>         return 0;
>>>>> @@ -459,7 +466,6 @@ static int aie2_hw_resume(struct amdxdna_dev 
>>>>> *xdna)
>>>>>       struct amdxdna_client *client;
>>>>>       int ret;
>>>>>   -    guard(mutex)(&xdna->dev_lock);
>>>>>       ret = aie2_hw_start(xdna);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(xdna, "Start hardware failed, %d", ret);
>>>>> @@ -565,13 +571,6 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>>>>           goto release_fw;
>>>>>       }
>>>>>   -    ret = aie2_mgmt_fw_query(ndev);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(xdna, "Query firmware failed, ret %d", ret);
>>>>> -        goto stop_hw;
>>>>> -    }
>>>>> -    ndev->total_col = min(aie2_max_col, ndev->metadata.cols);
>>>>> -
>>>>>       xrs_cfg.clk_list.num_levels = ndev->max_dpm_level + 1;
>>>>>       for (i = 0; i < xrs_cfg.clk_list.num_levels; i++)
>>>>>           xrs_cfg.clk_list.cu_clk_list[i] = ndev->priv- 
>>>>> >dpm_clk_tbl[i].hclk;
>>>>> @@ -587,30 +586,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>>>>           goto stop_hw;
>>>>>       }
>>>>>   -    ret = aie2_error_async_events_alloc(ndev);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(xdna, "Allocate async events failed, ret %d", ret);
>>>>> -        goto stop_hw;
>>>>> -    }
>>>>> -
>>>>> -    ret = aie2_error_async_events_send(ndev);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(xdna, "Send async events failed, ret %d", ret);
>>>>> -        goto async_event_free;
>>>>> -    }
>>>>> -
>>>>> -    /* Issue a command to make sure firmware handled async events */
>>>>> -    ret = aie2_query_firmware_version(ndev, &ndev->xdna->fw_ver);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(xdna, "Re-query firmware version failed");
>>>>> -        goto async_event_free;
>>>>> -    }
>>>>> -
>>>>>       release_firmware(fw);
>>>>> +    amdxdna_rpm_init(xdna);
>>>>>       return 0;
>>>>>   -async_event_free:
>>>>> -    aie2_error_async_events_free(ndev);
>>>>>   stop_hw:
>>>>>       aie2_hw_stop(xdna);
>>>>>   release_fw:
>>>>> @@ -621,10 +600,8 @@ static int aie2_init(struct amdxdna_dev *xdna)
>>>>>     static void aie2_fini(struct amdxdna_dev *xdna)
>>>>>   {
>>>>> -    struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
>>>>> -
>>>>> +    amdxdna_rpm_fini(xdna);
>>>>>       aie2_hw_stop(xdna);
>>>>> -    aie2_error_async_events_free(ndev);
>>>>>   }
>>>>>     static int aie2_get_aie_status(struct amdxdna_client *client,
>>>>> @@ -856,6 +833,10 @@ static int aie2_get_info(struct amdxdna_client 
>>>>> *client, struct amdxdna_drm_get_i
>>>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>>>           return -ENODEV;
>>>>>   +    ret = amdxdna_pm_resume_get(xdna);
>>>>> +    if (ret)
>>>>> +        goto dev_exit;
>>>>> +
>>>>>       switch (args->param) {
>>>>>       case DRM_AMDXDNA_QUERY_AIE_STATUS:
>>>>>           ret = aie2_get_aie_status(client, args);
>>>>> @@ -882,8 +863,11 @@ static int aie2_get_info(struct amdxdna_client 
>>>>> *client, struct amdxdna_drm_get_i
>>>>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>>>>> args- >param);
>>>>>           ret = -EOPNOTSUPP;
>>>>>       }
>>>>> +
>>>>> +    amdxdna_pm_suspend_put(xdna);
>>>>>       XDNA_DBG(xdna, "Got param %d", args->param);
>>>>>   +dev_exit:
>>>>>       drm_dev_exit(idx);
>>>>>       return ret;
>>>>>   }
>>>>> @@ -932,6 +916,10 @@ static int aie2_get_array(struct 
>>>>> amdxdna_client *client,
>>>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>>>           return -ENODEV;
>>>>>   +    ret = amdxdna_pm_resume_get(xdna);
>>>>> +    if (ret)
>>>>> +        goto dev_exit;
>>>>> +
>>>>>       switch (args->param) {
>>>>>       case DRM_AMDXDNA_HW_CONTEXT_ALL:
>>>>>           ret = aie2_query_ctx_status_array(client, args);
>>>>> @@ -940,8 +928,11 @@ static int aie2_get_array(struct 
>>>>> amdxdna_client *client,
>>>>>           XDNA_ERR(xdna, "Not supported request parameter %u", 
>>>>> args- >param);
>>>>>           ret = -EOPNOTSUPP;
>>>>>       }
>>>>> +
>>>>> +    amdxdna_pm_suspend_put(xdna);
>>>>>       XDNA_DBG(xdna, "Got param %d", args->param);
>>>>>   +dev_exit:
>>>>>       drm_dev_exit(idx);
>>>>>       return ret;
>>>>>   }
>>>>> @@ -980,6 +971,10 @@ static int aie2_set_state(struct 
>>>>> amdxdna_client *client,
>>>>>       if (!drm_dev_enter(&xdna->ddev, &idx))
>>>>>           return -ENODEV;
>>>>>   +    ret = amdxdna_pm_resume_get(xdna);
>>>>> +    if (ret)
>>>>> +        goto dev_exit;
>>>>> +
>>>>>       switch (args->param) {
>>>>>       case DRM_AMDXDNA_SET_POWER_MODE:
>>>>>           ret = aie2_set_power_mode(client, args);
>>>>> @@ -990,6 +985,8 @@ static int aie2_set_state(struct amdxdna_client 
>>>>> *client,
>>>>>           break;
>>>>>       }
>>>>>   +    amdxdna_pm_suspend_put(xdna);
>>>>> +dev_exit:
>>>>>       drm_dev_exit(idx);
>>>>>       return ret;
>>>>>   }
>>>>> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/ 
>>>>> amdxdna/aie2_pci.h
>>>>> index 91a8e948f82a..289a23ecd5f1 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_pci.h
>>>>> +++ b/drivers/accel/amdxdna/aie2_pci.h
>>>>> @@ -272,7 +272,8 @@ int aie2_map_host_buf(struct amdxdna_dev_hdl 
>>>>> *ndev, u32 context_id, u64 addr, u6
>>>>>   int aie2_query_status(struct amdxdna_dev_hdl *ndev, char __user 
>>>>> *buf, u32 size, u32 *cols_filled);
>>>>>   int aie2_register_asyn_event_msg(struct amdxdna_dev_hdl *ndev, 
>>>>> dma_addr_t addr, u32 size,
>>>>>                    void *handle, int (*cb)(void*, void __iomem *, 
>>>>> size_t));
>>>>> -int aie2_config_cu(struct amdxdna_hwctx *hwctx);
>>>>> +int aie2_config_cu(struct amdxdna_hwctx *hwctx,
>>>>> +           int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>   int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct 
>>>>> amdxdna_sched_job *job,
>>>>>            int (*notify_cb)(void *, void __iomem *, size_t));
>>>>>   int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
>>>>> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/ 
>>>>> amdxdna/aie2_smu.c
>>>>> index d303701b0ded..7f292a615ed8 100644
>>>>> --- a/drivers/accel/amdxdna/aie2_smu.c
>>>>> +++ b/drivers/accel/amdxdna/aie2_smu.c
>>>>> @@ -11,6 +11,7 @@
>>>>>     #include "aie2_pci.h"
>>>>>   #include "amdxdna_pci_drv.h"
>>>>> +#include "amdxdna_pm.h"
>>>>>     #define SMU_RESULT_OK        1
>>>>>   @@ -59,12 +60,16 @@ int npu1_set_dpm(struct amdxdna_dev_hdl 
>>>>> *ndev, u32 dpm_level)
>>>>>       u32 freq;
>>>>>       int ret;
>>>>>   +    ret = amdxdna_pm_resume_get(ndev->xdna);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>>       ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
>>>>> ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>>>>> ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
>>>>> -        return ret;
>>>>> +        goto suspend_put;
>>>>>       }
>>>>>       ndev->npuclk_freq = freq;
>>>>>   @@ -73,8 +78,10 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, 
>>>>> u32 dpm_level)
>>>>>       if (ret) {
>>>>>           XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>>>>> ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
>>>>> -        return ret;
>>>>> +        goto suspend_put;
>>>>>       }
>>>>> +
>>>>> +    amdxdna_pm_suspend_put(ndev->xdna);
>>>>>       ndev->hclk_freq = freq;
>>>>>       ndev->dpm_level = dpm_level;
>>>>>   @@ -82,26 +89,35 @@ int npu1_set_dpm(struct amdxdna_dev_hdl 
>>>>> *ndev, u32 dpm_level)
>>>>>            ndev->npuclk_freq, ndev->hclk_freq);
>>>>>         return 0;
>>>>> +
>>>>> +suspend_put:
>>>>> +    amdxdna_pm_suspend_put(ndev->xdna);
>>>>> +    return ret;
>>>>>   }
>>>>>     int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>>>>>   {
>>>>>       int ret;
>>>>>   +    ret = amdxdna_pm_resume_get(ndev->xdna);
>>>>> +    if (ret)
>>>>> +        return ret;
>>>>> +
>>>>>       ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, 
>>>>> dpm_level, NULL);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret 
>>>>> %d ",
>>>>>                dpm_level, ret);
>>>>> -        return ret;
>>>>> +        goto suspend_put;
>>>>>       }
>>>>>         ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, 
>>>>> dpm_level, NULL);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
>>>>>                dpm_level, ret);
>>>>> -        return ret;
>>>>> +        goto suspend_put;
>>>>>       }
>>>>>   +    amdxdna_pm_suspend_put(ndev->xdna);
>>>>>       ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>>>>>       ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>>>>>       ndev->dpm_level = dpm_level;
>>>>> @@ -110,6 +126,10 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, 
>>>>> u32 dpm_level)
>>>>>            ndev->npuclk_freq, ndev->hclk_freq);
>>>>>         return 0;
>>>>> +
>>>>> +suspend_put:
>>>>> +    amdxdna_pm_suspend_put(ndev->xdna);
>>>>> +    return ret;
>>>>>   }
>>>>>     int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/ 
>>>>> amdxdna/amdxdna_ctx.c
>>>>> index 4bfe4ef20550..c3300eff7460 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
>>>>> @@ -161,14 +161,9 @@ int amdxdna_drm_create_hwctx_ioctl(struct 
>>>>> drm_device *dev, void *data, struct dr
>>>>>       if (args->ext || args->ext_flags)
>>>>>           return -EINVAL;
>>>>>   -    if (!drm_dev_enter(dev, &idx))
>>>>> -        return -ENODEV;
>>>>> -
>>>>>       hwctx = kzalloc(sizeof(*hwctx), GFP_KERNEL);
>>>>> -    if (!hwctx) {
>>>>> -        ret = -ENOMEM;
>>>>> -        goto exit;
>>>>> -    }
>>>>> +    if (!hwctx)
>>>>> +        return -ENOMEM;
>>>>>         if (copy_from_user(&hwctx->qos, u64_to_user_ptr(args- 
>>>>> >qos_p), sizeof(hwctx->qos))) {
>>>>>           XDNA_ERR(xdna, "Access QoS info failed");
>>>>> @@ -181,30 +176,36 @@ int amdxdna_drm_create_hwctx_ioctl(struct 
>>>>> drm_device *dev, void *data, struct dr
>>>>>       hwctx->num_tiles = args->num_tiles;
>>>>>       hwctx->mem_size = args->mem_size;
>>>>>       hwctx->max_opc = args->max_opc;
>>>>> -    ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
>>>>> -                  XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, 
>>>>> MAX_HWCTX_ID),
>>>>> -                  &client->next_hwctxid, GFP_KERNEL);
>>>>> -    if (ret < 0) {
>>>>> -        XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
>>>>> +
>>>>> +    guard(mutex)(&xdna->dev_lock);
>>>>> +
>>>>> +    if (!drm_dev_enter(dev, &idx)) {
>>>>> +        ret = -ENODEV;
>>>>>           goto free_hwctx;
>>>>>       }
>>>>>   -    hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client- 
>>>>> >pid, hwctx->id);
>>>>> +    ret = xdna->dev_info->ops->hwctx_init(hwctx);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Init hwctx failed, ret %d", ret);
>>>>> +        goto dev_exit;
>>>>> +    }
>>>>> +
>>>>> +    hwctx->name = kasprintf(GFP_KERNEL, "hwctx.%d.%d", client- 
>>>>> >pid, hwctx->fw_ctx_id);
>>>>>       if (!hwctx->name) {
>>>>>           ret = -ENOMEM;
>>>>> -        goto rm_id;
>>>>> +        goto fini_hwctx;
>>>>>       }
>>>>>   -    mutex_lock(&xdna->dev_lock);
>>>>> -    ret = xdna->dev_info->ops->hwctx_init(hwctx);
>>>>> -    if (ret) {
>>>>> -        mutex_unlock(&xdna->dev_lock);
>>>>> -        XDNA_ERR(xdna, "Init hwctx failed, ret %d", ret);
>>>>> +    ret = xa_alloc_cyclic(&client->hwctx_xa, &hwctx->id, hwctx,
>>>>> +                  XA_LIMIT(AMDXDNA_INVALID_CTX_HANDLE + 1, 
>>>>> MAX_HWCTX_ID),
>>>>> +                  &client->next_hwctxid, GFP_KERNEL);
>>>>> +    if (ret < 0) {
>>>>> +        XDNA_ERR(xdna, "Allocate hwctx ID failed, ret %d", ret);
>>>>>           goto free_name;
>>>>>       }
>>>>> +
>>>>>       args->handle = hwctx->id;
>>>>>       args->syncobj_handle = hwctx->syncobj_hdl;
>>>>> -    mutex_unlock(&xdna->dev_lock);
>>>>>         atomic64_set(&hwctx->job_submit_cnt, 0);
>>>>>       atomic64_set(&hwctx->job_free_cnt, 0);
>>>>> @@ -214,12 +215,12 @@ int amdxdna_drm_create_hwctx_ioctl(struct 
>>>>> drm_device *dev, void *data, struct dr
>>>>>     free_name:
>>>>>       kfree(hwctx->name);
>>>>> -rm_id:
>>>>> -    xa_erase(&client->hwctx_xa, hwctx->id);
>>>>> +fini_hwctx:
>>>>> +    xdna->dev_info->ops->hwctx_fini(hwctx);
>>>>> +dev_exit:
>>>>> +    drm_dev_exit(idx);
>>>>>   free_hwctx:
>>>>>       kfree(hwctx);
>>>>> -exit:
>>>>> -    drm_dev_exit(idx);
>>>>>       return ret;
>>>>>   }
>>>>>   @@ -431,11 +432,6 @@ int amdxdna_cmd_submit(struct amdxdna_client 
>>>>> *client,
>>>>>           goto unlock_srcu;
>>>>>       }
>>>>>   -    if (hwctx->status != HWCTX_STAT_READY) {
>>>>> -        XDNA_ERR(xdna, "HW Context is not ready");
>>>>> -        ret = -EINVAL;
>>>>> -        goto unlock_srcu;
>>>>> -    }
>>>>>         job->hwctx = hwctx;
>>>>>       job->mm = current->mm;
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/ 
>>>>> accel/ amdxdna/amdxdna_mailbox.c
>>>>> index da1ac89bb78f..24258dcc18eb 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
>>>>> @@ -194,7 +194,8 @@ static void mailbox_release_msg(struct 
>>>>> mailbox_channel *mb_chann,
>>>>>   {
>>>>>       MB_DBG(mb_chann, "msg_id 0x%x msg opcode 0x%x",
>>>>>              mb_msg->pkg.header.id, mb_msg->pkg.header.opcode);
>>>>> -    mb_msg->notify_cb(mb_msg->handle, NULL, 0);
>>>>> +    if (mb_msg->notify_cb)
>>>>> +        mb_msg->notify_cb(mb_msg->handle, NULL, 0);
>>>>>       kfree(mb_msg);
>>>>>   }
>>>>>   @@ -248,7 +249,7 @@ mailbox_get_resp(struct mailbox_channel 
>>>>> *mb_chann, struct xdna_msg_header *heade
>>>>>   {
>>>>>       struct mailbox_msg *mb_msg;
>>>>>       int msg_id;
>>>>> -    int ret;
>>>>> +    int ret = 0;
>>>>>         msg_id = header->id;
>>>>>       if (!mailbox_validate_msgid(msg_id)) {
>>>>> @@ -265,9 +266,11 @@ mailbox_get_resp(struct mailbox_channel 
>>>>> *mb_chann, struct xdna_msg_header *heade
>>>>>         MB_DBG(mb_chann, "opcode 0x%x size %d id 0x%x",
>>>>>              header->opcode, header->total_size, header->id);
>>>>> -    ret = mb_msg->notify_cb(mb_msg->handle, data, header- 
>>>>> >total_size);
>>>>> -    if (unlikely(ret))
>>>>> -        MB_ERR(mb_chann, "Message callback ret %d", ret);
>>>>> +    if (mb_msg->notify_cb) {
>>>>> +        ret = mb_msg->notify_cb(mb_msg->handle, data, header- 
>>>>> >total_size);
>>>>> +        if (unlikely(ret))
>>>>> +            MB_ERR(mb_chann, "Message callback ret %d", ret);
>>>>> +    }
>>>>>         kfree(mb_msg);
>>>>>       return ret;
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/ 
>>>>> accel/ amdxdna/amdxdna_pci_drv.c
>>>>> index 569cd703729d..aa04452310e5 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
>>>>> @@ -13,13 +13,11 @@
>>>>>   #include <drm/gpu_scheduler.h>
>>>>>   #include <linux/iommu.h>
>>>>>   #include <linux/pci.h>
>>>>> -#include <linux/pm_runtime.h>
>>>>>     #include "amdxdna_ctx.h"
>>>>>   #include "amdxdna_gem.h"
>>>>>   #include "amdxdna_pci_drv.h"
>>>>> -
>>>>> -#define AMDXDNA_AUTOSUSPEND_DELAY    5000 /* milliseconds */
>>>>> +#include "amdxdna_pm.h"
>>>>>     MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>>>>>   MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>>>>> @@ -61,17 +59,9 @@ static int amdxdna_drm_open(struct drm_device 
>>>>> *ddev, struct drm_file *filp)
>>>>>       struct amdxdna_client *client;
>>>>>       int ret;
>>>>>   -    ret = pm_runtime_resume_and_get(ddev->dev);
>>>>> -    if (ret) {
>>>>> -        XDNA_ERR(xdna, "Failed to get rpm, ret %d", ret);
>>>>> -        return ret;
>>>>> -    }
>>>>> -
>>>>>       client = kzalloc(sizeof(*client), GFP_KERNEL);
>>>>> -    if (!client) {
>>>>> -        ret = -ENOMEM;
>>>>> -        goto put_rpm;
>>>>> -    }
>>>>> +    if (!client)
>>>>> +        return -ENOMEM;
>>>>>         client->pid = pid_nr(rcu_access_pointer(filp->pid));
>>>>>       client->xdna = xdna;
>>>>> @@ -106,9 +96,6 @@ static int amdxdna_drm_open(struct drm_device 
>>>>> *ddev, struct drm_file *filp)
>>>>>       iommu_sva_unbind_device(client->sva);
>>>>>   failed:
>>>>>       kfree(client);
>>>>> -put_rpm:
>>>>> -    pm_runtime_mark_last_busy(ddev->dev);
>>>>> -    pm_runtime_put_autosuspend(ddev->dev);
>>>>>         return ret;
>>>>>   }
>>>>> @@ -130,8 +117,6 @@ static void amdxdna_drm_close(struct drm_device 
>>>>> *ddev, struct drm_file *filp)
>>>>>         XDNA_DBG(xdna, "pid %d closed", client->pid);
>>>>>       kfree(client);
>>>>> -    pm_runtime_mark_last_busy(ddev->dev);
>>>>> -    pm_runtime_put_autosuspend(ddev->dev);
>>>>>   }
>>>>>     static int amdxdna_flush(struct file *f, fl_owner_t id)
>>>>> @@ -310,19 +295,12 @@ static int amdxdna_probe(struct pci_dev 
>>>>> *pdev, const struct pci_device_id *id)
>>>>>           goto failed_dev_fini;
>>>>>       }
>>>>>   -    pm_runtime_set_autosuspend_delay(dev, 
>>>>> AMDXDNA_AUTOSUSPEND_DELAY);
>>>>> -    pm_runtime_use_autosuspend(dev);
>>>>> -    pm_runtime_allow(dev);
>>>>> -
>>>>>       ret = drm_dev_register(&xdna->ddev, 0);
>>>>>       if (ret) {
>>>>>           XDNA_ERR(xdna, "DRM register failed, ret %d", ret);
>>>>> -        pm_runtime_forbid(dev);
>>>>>           goto failed_sysfs_fini;
>>>>>       }
>>>>>   -    pm_runtime_mark_last_busy(dev);
>>>>> -    pm_runtime_put_autosuspend(dev);
>>>>>       return 0;
>>>>>     failed_sysfs_fini:
>>>>> @@ -339,14 +317,10 @@ static int amdxdna_probe(struct pci_dev 
>>>>> *pdev, const struct pci_device_id *id)
>>>>>   static void amdxdna_remove(struct pci_dev *pdev)
>>>>>   {
>>>>>       struct amdxdna_dev *xdna = pci_get_drvdata(pdev);
>>>>> -    struct device *dev = &pdev->dev;
>>>>>       struct amdxdna_client *client;
>>>>>         destroy_workqueue(xdna->notifier_wq);
>>>>>   -    pm_runtime_get_noresume(dev);
>>>>> -    pm_runtime_forbid(dev);
>>>>> -
>>>>>       drm_dev_unplug(&xdna->ddev);
>>>>>       amdxdna_sysfs_fini(xdna);
>>>>>   @@ -365,29 +339,9 @@ static void amdxdna_remove(struct pci_dev 
>>>>> *pdev)
>>>>>       mutex_unlock(&xdna->dev_lock);
>>>>>   }
>>>>>   -static int amdxdna_pmops_suspend(struct device *dev)
>>>>> -{
>>>>> -    struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>>>>> -
>>>>> -    if (!xdna->dev_info->ops->suspend)
>>>>> -        return -EOPNOTSUPP;
>>>>> -
>>>>> -    return xdna->dev_info->ops->suspend(xdna);
>>>>> -}
>>>>> -
>>>>> -static int amdxdna_pmops_resume(struct device *dev)
>>>>> -{
>>>>> -    struct amdxdna_dev *xdna = pci_get_drvdata(to_pci_dev(dev));
>>>>> -
>>>>> -    if (!xdna->dev_info->ops->resume)
>>>>> -        return -EOPNOTSUPP;
>>>>> -
>>>>> -    return xdna->dev_info->ops->resume(xdna);
>>>>> -}
>>>>> -
>>>>>   static const struct dev_pm_ops amdxdna_pm_ops = {
>>>>> -    SYSTEM_SLEEP_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume)
>>>>> -    RUNTIME_PM_OPS(amdxdna_pmops_suspend, amdxdna_pmops_resume, NULL)
>>>>> +    SYSTEM_SLEEP_PM_OPS(amdxdna_pm_suspend, amdxdna_pm_resume)
>>>>> +    RUNTIME_PM_OPS(amdxdna_pm_suspend, amdxdna_pm_resume, NULL)
>>>>>   };
>>>>>     static struct pci_driver amdxdna_pci_driver = {
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/ 
>>>>> accel/ amdxdna/amdxdna_pci_drv.h
>>>>> index 72d6696d49da..626beebf730e 100644
>>>>> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
>>>>> @@ -6,6 +6,7 @@
>>>>>   #ifndef _AMDXDNA_PCI_DRV_H_
>>>>>   #define _AMDXDNA_PCI_DRV_H_
>>>>>   +#include <drm/drm_print.h>
>>>>
>>>> This seems like a spurious header inclusion.  It shouldn't be needed 
>>>> for adding a bool to the struct.
>>>>
>>>>
>>>>>   #include <linux/workqueue.h>
>>>>>   #include <linux/xarray.h>
>>>>>   @@ -99,6 +100,7 @@ struct amdxdna_dev {
>>>>>       struct amdxdna_fw_ver        fw_ver;
>>>>>       struct rw_semaphore        notifier_lock; /* for mmu notifier*/
>>>>>       struct workqueue_struct        *notifier_wq;
>>>>> +    bool                rpm_on;
>>>>
>>>> I'm wondering do you really need a new variable to track the runtime 
>>>> PM status?  Can't you just use pm_runtime_active() and the 
>>>> appropriate locking when checking it?
>>>>
>>
>> Just make sure you didn't miss the two above comments when scanning 
>> the email response since you didn't reply them.
> 
> Sorry, I indeed missed this question. Thanks for your reminding.
> 
> rpm_on is used to check if suspend/resume is in-progress. So it will not 
> recursively call into suspend and resume. I did not see any function to 
> check if suspend/resume is in-progress.

Ah yes there are RPM_SUSPENDING and RPM_RESUMING.  You could do 
something like this:

dev->power.runtime_status == RPM_SUSPENDING ||
dev->power.runtime_status == RPM_RESUMING ||
pm_suspend_in_progress();

But used without locking it could be a bit inconsistent.  Your variable 
approach probably is better.

> 
> 
> Thanks,
> 
> Lizhi
> 
>>
>>>>>   };
>>>>>     /*
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/ 
>>>>> amdxdna/amdxdna_pm.c
>>>>> new file mode 100644
>>>>> index 000000000000..fad14f60b99b
>>>>> --- /dev/null
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
>>>>> @@ -0,0 +1,96 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>> +/*
>>>>> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
>>>>> + */
>>>>> +
>>>>> +#include <drm/amdxdna_accel.h>
>>>>> +#include <drm/drm_drv.h>
>>>>> +#include <linux/pm_runtime.h>
>>>>> +
>>>>> +#include "amdxdna_pm.h"
>>>>> +
>>>>> +#define AMDXDNA_AUTOSUSPEND_DELAY    5000 /* milliseconds */
>>>>> +
>>>>> +int amdxdna_pm_suspend(struct device *dev)
>>>>> +{
>>>>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>>>> +    int ret = -EOPNOTSUPP;
>>>>> +    bool rpm;
>>>>> +
>>>>> +    if (xdna->dev_info->ops->suspend) {
>>>>> +        rpm = xdna->rpm_on;
>>>>> +        xdna->rpm_on = false;
>>>>> +        ret = xdna->dev_info->ops->suspend(xdna);
>>>>> +        xdna->rpm_on = rpm;
>>>>> +    }
>>>>> +
>>>>> +    XDNA_DBG(xdna, "Suspend done ret %d", ret);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +int amdxdna_pm_resume(struct device *dev)
>>>>> +{
>>>>> +    struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>>>>> +    int ret = -EOPNOTSUPP;
>>>>> +    bool rpm;
>>>>> +
>>>>> +    if (xdna->dev_info->ops->resume) {
>>>>> +        rpm = xdna->rpm_on;
>>>>> +        xdna->rpm_on = false;
>>>>> +        ret = xdna->dev_info->ops->resume(xdna);
>>>>> +        xdna->rpm_on = rpm;
>>>>> +    }
>>>>> +
>>>>> +    XDNA_DBG(xdna, "Resume done ret %d", ret);
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +int amdxdna_pm_resume_get(struct amdxdna_dev *xdna)
>>>>> +{
>>>>> +    struct device *dev = xdna->ddev.dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!xdna->rpm_on)
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = pm_runtime_resume_and_get(dev);
>>>>> +    if (ret) {
>>>>> +        XDNA_ERR(xdna, "Resume failed: %d", ret);
>>>>> +        pm_runtime_set_suspended(dev);
>>>>> +    }
>>>>> +
>>>>> +    return ret;
>>>>> +}
>>>>> +
>>>>> +void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna)
>>>>> +{
>>>>> +    struct device *dev = xdna->ddev.dev;
>>>>> +
>>>>> +    if (!xdna->rpm_on)
>>>>> +        return;
>>>>> +
>>>>> +    pm_runtime_mark_last_busy(dev);
>>>>> +    pm_runtime_put_autosuspend(dev);
>>>>> +}
>>>>> +
>>>>> +void amdxdna_rpm_init(struct amdxdna_dev *xdna)
>>>>> +{
>>>>> +    struct device *dev = xdna->ddev.dev;
>>>>> +
>>>>> +    pm_runtime_set_active(dev);
>>>>> +    pm_runtime_set_autosuspend_delay(dev, AMDXDNA_AUTOSUSPEND_DELAY);
>>>>> +    pm_runtime_use_autosuspend(dev);
>>>>> +    pm_runtime_allow(dev);
>>>>> +    pm_runtime_mark_last_busy(dev);
>>>>> +    pm_runtime_put_autosuspend(dev);
>>>>> +    xdna->rpm_on = true;
>>>>> +}
>>>>> +
>>>>> +void amdxdna_rpm_fini(struct amdxdna_dev *xdna)
>>>>> +{
>>>>> +    struct device *dev = xdna->ddev.dev;
>>>>> +
>>>>> +    xdna->rpm_on = false;
>>>>> +    pm_runtime_get_noresume(dev);
>>>>> +    pm_runtime_forbid(dev);
>>>>> +}
>>>>> diff --git a/drivers/accel/amdxdna/amdxdna_pm.h b/drivers/accel/ 
>>>>> amdxdna/amdxdna_pm.h
>>>>> new file mode 100644
>>>>> index 000000000000..11c295b6d64a
>>>>> --- /dev/null
>>>>> +++ b/drivers/accel/amdxdna/amdxdna_pm.h
>>>>> @@ -0,0 +1,18 @@
>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> +/*
>>>>> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
>>>>> + */
>>>>> +
>>>>> +#ifndef _AMDXDNA_PM_H_
>>>>> +#define _AMDXDNA_PM_H_
>>>>> +
>>>>> +#include "amdxdna_pci_drv.h"
>>>>> +
>>>>> +int amdxdna_pm_suspend(struct device *dev);
>>>>> +int amdxdna_pm_resume(struct device  *dev);
>>>>> +int amdxdna_pm_resume_get(struct amdxdna_dev *xdna);
>>>>> +void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna);
>>>>> +void amdxdna_rpm_init(struct amdxdna_dev *xdna);
>>>>> +void amdxdna_rpm_fini(struct amdxdna_dev *xdna);
>>>>
>>>> Nit: Why rpm for init/fini and pm for all the others? Wouldn't it 
>>>> make sense to pick one or the other?
>>>
>>> Sure. I will change to _pm_init and _pm_fini.
>>>
>>> Thanks,
>>>
>>> Lizhi
>>>
>>>>
>>>>> +
>>>>> +#endif /* _AMDXDNA_PM_H_ */
>>>>
>>

