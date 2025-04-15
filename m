Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987AA8981D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4632E10E2B1;
	Tue, 15 Apr 2025 09:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jHnPZFXz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D790A10E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bXI0CGuwtKUiPVMTH26nzJImIoDhwm67IsdqxPEF1Gmh3WPprqMkGmiACFt6yGcXh3x61bO5YCZY/XdNzDq99j7P29qzaPWv7MTsUeWj42fC3lWxHMyf8+MaXQtHg7pt43w+OF8PZ8Q6H9LTCko9/VLnL55Yk8qgb2zR6FfEwhiSCMyXDfy+R6jbdJXFQ5stLYYM+N3WgBXXkukhaIdStwEAav+BbtDbG5QL0rt5MLqSDBFakXTxHh+tBZmTeK15SO3tprPDqr9G4YMixwkjn8RZhEuTFLHpni/6nKTMZtoI4TMfgMV1yAelpMjaTZXG300QYIEXV4TuoZfug7ivuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXpr+1MBRgtJhKaHdzSxtvRVt0RJrlpE7uJrpt8dNdQ=;
 b=rzd9bW7zEMe/oDGM/5FDsOTMnXUbEX7jaeX8Jh5A7NKDvwm7Zof6jD1mskUu7uWxHE1TQrEoCB1a0RyvYaalrqtnhAtFOqGgFEg+NalHee/pLraFkMYqdzpPZRuWf2wPGeKTe14lFKsV2yoaaoFnUaMA4dYisosnQxFQckRu68t4B9QNXJG9f9wDPTl658D7SmLB57adSYYib8bDvmrc3QFZZQ8Eec1FBmIjbOMUbnZC9re33HuXaph9RwjbW0GbFAsrgMHdnPZKBrK0NUU2hT0NHB8Pb2omW+chW3BpbLcfUtCi41SS9y4Eapqfp2h4wy9DTlnEF/MmdUOB28FrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXpr+1MBRgtJhKaHdzSxtvRVt0RJrlpE7uJrpt8dNdQ=;
 b=jHnPZFXzl55mN9Xb3BvaIL1oXUtX988d3hd97SuFh9bMQSsZR70glrVSloQFIMUU6WHn73SRaXa1oQi+afjHj3DUm35Co5ABSdOM6fR/qb50FgFjgukt9Kk62LzAZs1FDczbuba4ljpnYgJRZR4pzg+tlr2YQORZKAd3M80Slwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 09:39:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Tue, 15 Apr 2025
 09:39:30 +0000
Message-ID: <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
Date: Tue, 15 Apr 2025 11:39:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250415092057.63172-1-tzimmermann@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250415092057.63172-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e1c4caa-d3fc-4f38-dc94-08dd7c016bb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGNHMGZtT21JbVk1d2tBWktYQnlKZnRqbFRxVFljdE1QQ0tnUkpKcTFqUTNm?=
 =?utf-8?B?SXh1Z2NralJmci96eERQZXd2eHNwRDFjSHFPV3NZajdDSkU1Y1VTbG1kWXcz?=
 =?utf-8?B?MkFYUEN6TFc3ZnZ6SXFNRkl6dmZGdmRCNy95MmhITnJHS3BZYlF5SHl0MzQz?=
 =?utf-8?B?azJIMEpwbVk2RDQ1V2lzNVUwSFFKSEdHTXc3KzVjRUFsZk1hckxRTDU3NHdp?=
 =?utf-8?B?aDloUTUzTkNKZm9lZU1tTjk3aTRvQ21sbEhkVEdEUTVQNmR5UEhwK2NPZ0Zy?=
 =?utf-8?B?ZEV1STRPR21OZkhMR2kyNzNBRkdQN3o0clRzYVR1c3lUVGZmeTBTZFVZM3ZK?=
 =?utf-8?B?V1hWbWhFWFdOd0FKbmhlSGt6K09ybUI0eVVCMDhMR3BsdmNHQnlNOTRvOGNk?=
 =?utf-8?B?bHZETGx0c1hpTWVqaFViWE5XbHF5N2RiTGl5Q0o2N3pBS2xCMTROV2tBMGN6?=
 =?utf-8?B?ODBBVU9NcGtlbzhpMDZvTDVUTmpabHF6TU9VQVJPVmNHZXU1eGpLZndZNWht?=
 =?utf-8?B?NjV1aGgwZ2lmRFp0aVFXaDBKK3JjbllVRE9kTzE0ZUxPVE9oOTdLdjBpNkZm?=
 =?utf-8?B?bjdzRTg5UXZ5VVBLTC9Ca3N0SVRWZ3NwWjFBSzFKOHYwSkJDRFdPenUxVExa?=
 =?utf-8?B?bEwzOHdKYWo0RUdZMms2WXlJMDdMVGs0MXovaWd5Z2FZMmFWM2VSTktOQ2Yw?=
 =?utf-8?B?b0o5TzZCalVrYUdFV28weVd6MkdIWTRKVFAyeDRmYTJiQldPdnZXWU00d0ox?=
 =?utf-8?B?Y3hqWElmcFV4RzRVdHJOSWdhMXpramlJM3E4M2RFbno1enVJT1JXZVgwMUZq?=
 =?utf-8?B?YzVpR2doVndFalRJRXBVUGZPOXJXRHhMZDh1aVZ5OTBtcmh1Z2xEbHE1anY4?=
 =?utf-8?B?dG9kL2d5dG9QVGQ2UU5DMnBNdkZUOTllWlN2RkxycUtBU2tMZXduY2IxODA5?=
 =?utf-8?B?QWxjUVE3MWFueVFqZTdYYUkwMEVuYk1weWRMUFNqTWdOeFZhZkgwVDA5S0F0?=
 =?utf-8?B?R0x0c3REcHZqa0x1UHAyTmRPWmgrNXFEbjZ0NTlTUFpOUGxGV0tCa3dDNWxZ?=
 =?utf-8?B?SnBqdXRhcWxHTmRDVU0xRW11aUVYRXVlOEJHU0JyaU9MVzNIOFFQeTRrRGJD?=
 =?utf-8?B?TWdiRk5YUGNqTk8zU0ZrWHYxS2NKRFllOEJvK2t6a2U3SHRwYnpvL0EwZ3lH?=
 =?utf-8?B?Sk52NjdCZWFiYzh6b0lXYm12bGdUd05MN2dib1o2QTFxNXhpZ2h6WkNTYWdo?=
 =?utf-8?B?Q2paZ2NyS05XLy82ektGbjdhRWNFd2tuTU1RclhZd01WMjQrY3k0emZtaFlB?=
 =?utf-8?B?YXl0ZTdaWVBSMWVlTmlqMEY3TTlQczVwcFN4aEd5UEFDQmM1UVlJa2VibDF6?=
 =?utf-8?B?V1dJUHd0amRnK2ppRlY3TDZZTXNQNm1obkdWaDdhVk14bW42dnhlRHNLd25Q?=
 =?utf-8?B?ejAzdGdFNDRKV1oxYktRZjJmSyt6U3RiamVtdW9yd0UwOXBzQXRURmIvRkcy?=
 =?utf-8?B?cGgrNE90UENhM0dwckpwbXZWUE10bVRoajdNQi8zejRWbFZaR0hyRVhlQ0lx?=
 =?utf-8?B?YmRSMVRBMmkzYnE1Ky9aV3g5WldDMlRDSVo0MXJoRmxzcFlSajBva2FLVmlh?=
 =?utf-8?B?eHR1bnY2VHc1cmg0bEYxMTdiZnN5RVVSN1NkdGQ0b3dQa3FHdDRCYkZ2d1hP?=
 =?utf-8?B?R0dPcDRtTkNTQWFlNW1taGpuMFgwZkF0TnZOOWdXZlVjSDhDaHVSM0J6a21M?=
 =?utf-8?B?TGlTYWFjUnBSQTNvenRwZFpleFVpMkV6OXo2RWV5MjBVdSsrTWVsQjJkazg0?=
 =?utf-8?B?MjJ2RURBS2I0c3BNdkwrNFIvVEZKUGhNL3JLQjZjdi9YOXdZeWM0Y2ROaTZv?=
 =?utf-8?B?aDJnQzBIMURRbGVseTFMQkhFVXRpMjM0d3I2YmZ0WXQ2Zk1ab0F6aEltdzJo?=
 =?utf-8?Q?kfFHyLxMIUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmprbFB3ZXk3SDlCaWJNaTh5dE9Xa3hDSmZLK2hYQ2Q2WWtKYWFBaVAveTMr?=
 =?utf-8?B?Z3I3UDBXak8waWhVejNXMjBoU2lBZUFXZmkzSExLRldhVk9Rb2Q5RzlNbWhY?=
 =?utf-8?B?d04zbHF1eGJmTjNzczZlRTR4ZW9XZEc0eXFadkY1dk8vM1NzTkc5aVdJNjBk?=
 =?utf-8?B?bUVwSFE0cWZXTE9WY2ZzT2I0YndZclJ6Rzg2WHJWY0ZJKzRiSytNcDFKMTRq?=
 =?utf-8?B?QzhRTytJUVhUQ2srcFUrSUhvWHM0RjdrKy9XcVovN2FLNm02dUx3R1hIbU9p?=
 =?utf-8?B?NFMzU21YRUhvRGFPVTRCc0d2WDFPRTRnbTBxa1VVL0MxMGFQZDlZNU5XNlBt?=
 =?utf-8?B?akx5N24yemVKOGx2b1QvTnF3MlNwRHdWdDNhU3c5SFpZU0lidGZqdmxjdkxF?=
 =?utf-8?B?cHN3Y1hUZkFZT1hnbTV1Wmhyc1lUK1FpdFJndEFEKzJRMjV1aUNQaGxjRTlp?=
 =?utf-8?B?WVNTbm5JMGlReHVyYkdmamxUTTB3bk4rMUJjRXIrdnp0NmdFcmMrTTQyUlBG?=
 =?utf-8?B?TkVtbXMzZ0U1VStuTG1yNUZZVU0weGJxcEFIWlZMdlUwSlc3NVpZT0xRcHNR?=
 =?utf-8?B?T251citNZGVQSWJvamFzdDQ1ejZvZ053TmFMa2pxbzV0MitRWWtmRU0wekRo?=
 =?utf-8?B?REdHMGVNcVpYWDg3S21Jd0Yza3dFTXZ3TjlFMGN1b1R3dDU3YlBkUGRsMHF4?=
 =?utf-8?B?MWZnREZVeERCWjcvelhDbFFyMzdWNXdtN2F1UEJEVkVweXBSeDU4VFpFSkhE?=
 =?utf-8?B?L2lidGFxRzk0VDhXNGkrWmNNMlFVNWRYVjJMN3BvdnhUL1hqQWRxWGJWekJo?=
 =?utf-8?B?YS9OV3ZGcnEzUnlBc3VKeHRWam40eUV3K1VLc3UvYTI5K1VaODhsL2dYcUlN?=
 =?utf-8?B?bVdJaHB6SnFFUU52SlUzanZuS25wLzNpWWJlMkFGVzlramhPS1BVYml3MGR2?=
 =?utf-8?B?bHlJTkpsSFR2dzF6bkxkcSs0K0xnNlgwWUZxWHVOS1J4VDg3WlMzWVB5UVRp?=
 =?utf-8?B?Z3o2ZkVsbStrU0pkWmppcG1jYkRCVmpWNlplSUltM291N0tEU0RhTUFwaTRy?=
 =?utf-8?B?ZkJIRHlFcWN6RnFWWkF1aHd4TFlrQkR4OGl3bExNNXp3bktmZW04bUl1WWZi?=
 =?utf-8?B?NUpyQUpneXZtb0k3cUdJZVp4MVJidkR3QWZjUFBvSjNzK2ZPSFVZMzJYeVFr?=
 =?utf-8?B?anhWdkEzbVVMbUxnb2w5Uk9LRjU5OEdiTGp5b2V2bkJ3UXdITzU0SHZFd1pE?=
 =?utf-8?B?UUI0NXExc3oyLzBrOEJRcnpwR3NKc1JnQ1hHTmNPKzRwWW0vakNIbGd5NXZ0?=
 =?utf-8?B?U3pEdlhGUWhoajhzdFpoeU5QRnRwYzRhY0VnYWMyOVQ5Ri9za1pBTUtLY1Bp?=
 =?utf-8?B?N1FxK2NRTzNFVENDMlFSZndEejcrQUg3SUlmNkp3b3YwcitGaXhZZzhwTHg5?=
 =?utf-8?B?SzY0aGZKbDlWeWFsMUVueWM2dXl0N0dqbXJHVFJHanRQaDRqU0lnZmJDTWlC?=
 =?utf-8?B?M2svc2R3REJuWUxqTzVPV3Zpdk1CeGdjNjVEN08rc0NPZlNyTmdBcGFDWmJC?=
 =?utf-8?B?UUlMNDNkWFhiZGdPSmwwd3JBbHRVdzIzMjZXS2ZEVm1ubm9ETCt0RTZtaU9D?=
 =?utf-8?B?Z0ZDeEVWQ0VzT0h3QVlzQTl4VnBMeE5NWllFYU1sRU1Kb001elU3SXdwOEVZ?=
 =?utf-8?B?cU5BVktKTjFwbDArVEhtc3MybUNKRy9CWGdOS3pEM2d2eEFOREsyNWJKa0l0?=
 =?utf-8?B?MDVDMHYwNllUbFM0L1ozbGRyRnN2bkNTSjdPZDYrVVppajluY2lnajA1M2xq?=
 =?utf-8?B?UFhxUC9zV2lzZkNMSUJlSDA3VU1iNENQdHFDYnhaTWtqNlRzVXpxbko5RjJi?=
 =?utf-8?B?aTZ5RUwwOUhKZ1ROZjQyWGZpM1pDRys5a0VhVkJpcVdQckpPWC90ZkUvcDE2?=
 =?utf-8?B?RkMxck1sTnJqMVNsOWlRQmJpcEt6bTJaTEMycy9ZNlNhVkV4NDVVUHRTSTIy?=
 =?utf-8?B?V3JJQ2dBaTdXaTMyb2xXYWEvNFZzYUpSS0s3eUt4QW9BWS9hV3YwdmNlTDVO?=
 =?utf-8?B?WklzMlhaWVlsN2RuQlEwcVVtcEhzMlVnWndEZ1h2cXUya1ExbjBpWHFFUjc5?=
 =?utf-8?Q?9NbfqohTldEU3KpA6v3Bg7npf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e1c4caa-d3fc-4f38-dc94-08dd7c016bb1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 09:39:30.1231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDEF7pWokltRW0OQ75CugFaDxSxuRcj7Z4+vA/1GT90BZJl9DafhGtZzeBtFArVL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
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

Am 15.04.25 um 11:20 schrieb Thomas Zimmermann:
> Test struct drm_gem_object.import_attach to detect imported objects
> during cleanup. At that point, the imported DMA buffer might have
> already been released and the dma_buf field is NULL. The object's
> free callback then does a cleanup as for native objects.

I don't think that this is a good idea.

The DMA-buf is separately reference counted through the import attachment.

> Happens for calls to drm_mode_destroy_dumb_ioctl() that eventually
> clear the dma_buf field in drm_gem_object_exported_dma_buf_free().

That is for exported DMA-buf and should *NEVER* be used for imported ones.

Regards,
Christian.

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
> Reported-by: Andy Yan <andyshrk@163.com>
> Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
> Tested-by: Andy Yan <andyshrk@163.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Anusha Srivatsa <asrivats@redhat.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  include/drm/drm_gem.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9b71f7a9f3f8..f09b8afcf86d 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -589,7 +589,13 @@ static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_obje
>  static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
>  {
>  	/* The dma-buf's priv field points to the original GEM object. */
> -	return obj->dma_buf && (obj->dma_buf->priv != obj);
> +	return (obj->dma_buf && (obj->dma_buf->priv != obj)) ||
> +	       /*
> +		* TODO: During object release, the dma-buf might already
> +		*       be gone. For now keep testing import_attach, but
> +		*       this should be removed at some point.
> +		*/
> +	       obj->import_attach;
>  }
>  
>  #ifdef CONFIG_LOCKDEP

