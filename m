Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5758C8528
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 13:00:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C63CE10E2D3;
	Fri, 17 May 2024 11:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nnROvL0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2080.outbound.protection.outlook.com [40.107.236.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B906310E2D3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 11:00:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQqMA7EY4D6WBM80NhNNYHXSKmjOwHiYS9vdpR5zFvAMY5KOp7MnFbhvT3E43G2a4ACzpHR//qMFBTi0EU9mhbYs7zESu3lELtHmBD+RwU/GpfIp1t2dDMlO1IDxKgGhw85ZcT2bKBhQjf6cdrIlZmxxyPzMILPCmAVkuq0RYFMMvPX+aMb5XHv8Kr5KNWAh4DgjahQqIH4pk5Z0cG8vT1pvitZY5p+0coeyD4RXvAiKRTzxIuB7SOdFofycdagdseKKvzgZskiSGGyhhRxiHYpKwByGW1EykWXm8u+P8TMQYh+YxW39fTq5BsKHdcWxGr7VYcToqJlwAgRM6KQdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=negoCUBwPPkFff23+INx4p6AqJkvnzqKz+WlKdUSKII=;
 b=oZNB4P1EdW7bjPHgiSjVsMBAdIih/jjn6YtfHn5Vr2Vrv8cHMbHxnZRkbtfJ/buLsAxdBqHJNLdcdw7xulWyFT3d5tJ1uNp4EybBfi1a9uZCYTyn1UIdQRw7v/CGMh3vgXPLARm9N08Hnb11Py4aCeP8Hgh0BwDEVuEk5h4WCMfK1Uf89pZHYmbLS/YcCh4MfLjW50uFK0OdfvE6tcKKOhWG1oOpvrJdRBan/xk3FN7fxlvfJ04heEtH+lbXfePEKbMkUfHheUog5jJL9USQ1fGvkLd2lqVl/29zYj45HSoJGEf2WzDLUnRfldzd6vwu6uSKfhI0/+7cuvF1YrD7Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=negoCUBwPPkFff23+INx4p6AqJkvnzqKz+WlKdUSKII=;
 b=nnROvL0LKhSwPlrMHF7IQ9BQnz2V2nfHujdSUpU6LL0goTISNBv52DlukXDNd1NVLRKN+UjH/GLBMKOvx77WfMdEaTOVUD4HWD1TTczp4Iy8PLYYjGIAN/O5dKk9Rjp0RNYSskJGJVDJhNRP+yl0bYlX4FMxM85pKhdD+F1iEBM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7740.namprd12.prod.outlook.com (2603:10b6:610:145::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Fri, 17 May
 2024 11:00:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Fri, 17 May 2024
 11:00:23 +0000
Message-ID: <2a6ea297-167f-4b0c-8aba-a4c1430f0e92@amd.com>
Date: Fri, 17 May 2024 13:00:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: stop using PAGE_SIZE
To: Matthew Auld <matthew.auld@intel.com>, Dave Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
References: <20240229105112.250077-3-matthew.auld@intel.com>
 <06841e76-0a6d-4cbb-a903-1f2e5dfbaf46@app.fastmail.com>
 <CAPM=9tyNrCsT27bvAVUcee-UME7568hZvU18m0k3OSopzUGaCA@mail.gmail.com>
 <3ef0fe56-f488-452a-9d35-dc081bf59816@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3ef0fe56-f488-452a-9d35-dc081bf59816@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f996cd-6505-4e88-17da-08dc76608cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlUzdFJXcGJBTEJvaUMxa1gra0l4RDR6REhnWjUxektiY1Z6MW44QzE1K0JW?=
 =?utf-8?B?ckd2OExNOGNJcUw3Mk1mRGhZQjBmdUtSK1ZqRE5pSEFiRk90SkxnTFZLWFNO?=
 =?utf-8?B?R3NjQ3I0U3U3TStKME8vT1NJUy9kd0M5VzR3cVNiYllaMUVBTGl6WDRLdjFl?=
 =?utf-8?B?ZG1PNTU2UUF4akRtMzFiRFRBUlFmWW1vR25DaDRaQy9ZdUpZZEt6UE16Q2xk?=
 =?utf-8?B?SDhkUzZnK2VBU1diK0EwSFROcVRmTGd5KzZOWjBaS003aVZ2SmVMejl1N2pH?=
 =?utf-8?B?NlU2WEFPOG9xY2UwUy9oTDNLZzN0UFA2UVNteXZsc2lTS3JsL1hsMkY2TU5V?=
 =?utf-8?B?NjM4NmRBY3hJWmVSYllIQkk4V2ErN1RWMTVtYzByZmtsOVMxUFZwTTJXV3VQ?=
 =?utf-8?B?S21yZlNKdGs1aERUZUNZa2Y2STJzbW82M0lGQUY5cU9VQWJFclNxQ2t3QVRG?=
 =?utf-8?B?ZGhWaXZVZENBUDg0Y3ZlNytKU002YkJ4WnYzT0lQVGVEVmZLeVZKVkorSXNB?=
 =?utf-8?B?NWorZnk2OGZKVWh4c3EwZXBjbDB2aXhIYmVJOTRwaVF4QTl3K1dOYVJUcVBJ?=
 =?utf-8?B?SVR2dnJDSFNvdDIzekEvWG1wTUx3Vld1MjVCdHFiSWRTbTk4K3VISlZRb2t6?=
 =?utf-8?B?ekhqTmlqREtkRlp3WXhDWUhWQTdVVGcvTktkVnJCL2ZkVDJTQlJxbTk2YWlK?=
 =?utf-8?B?Smhrc0ZNYW00OFNHN0gzTTBnU0FISThManR1cGMvSElvN1kwM1FSN0VpczFO?=
 =?utf-8?B?VStWLzRlYUJUM09mY0xaVTRaT3B1Z0VhQm1aNnViNHU5R0FQYi8vdmNWY0w4?=
 =?utf-8?B?bTM4KytkcXVnYlFIOTRKWEVyQ0QyVEFUL0UybWk2aFplQWZmcEJzanlxNG9U?=
 =?utf-8?B?TDZ5allBWVBnQW03MC9FNG42NjRuQTEzMUFFWCtKRG1IalJXWnkxbTNTUSto?=
 =?utf-8?B?R1pYNjc2QUVzb2VRaUM0R3VqR0lObzJZZjB1cmd4NjM1VVJ4UDZFMURJaGZI?=
 =?utf-8?B?VmFRTG94YVcyaHZ3cUlRNDV2czB2UGZwTmhxQjJTTzFEejF2dUVxSTZmV1lh?=
 =?utf-8?B?VjJmc0RSY3BZaENOanB4N3Z4UEovT1lZSVhqUUErckN0U04wS3hKNGJMb1NN?=
 =?utf-8?B?Zys5YWg3UWs2TlpFa1hHSURXeWZ6ZGQ0cEFyUWRxZnhvZ1U3eDNPTHdiUjQ5?=
 =?utf-8?B?VkVHdG9pL25GRi9zZWhsUzlMbDRpUUMvSVk0YU5QSGJ0Ym9xM0dVYXJ2WWxw?=
 =?utf-8?B?Rnlvai92ZGd4RWF1ZUJPKzVWVnBRNUdCZnI4RDU5czJZWHJ6K2hpYjRwcmFs?=
 =?utf-8?B?ZWR3WFIzZTRQR0d1VlpNd1BKYW9WUjFvSm1uUHVZMHhRb2dvV0ZPR3VwNkdu?=
 =?utf-8?B?MXVZSzRKbkZITWJwY2RUclh1U3dUU2M0WWQ3c3BCQWN1VStRQzlIeHNYVEpj?=
 =?utf-8?B?SDJpOWlMZE1DZEtKRGhOOURkSkprVUVXYVZPNDBFUUhCZWM1TmwyVU05aitW?=
 =?utf-8?B?ZFpmdFdxWWhGT3NKaXAycURSVDV4S09kaFZkYXNtOTNQWUFpMWZobksweFlI?=
 =?utf-8?B?aWVYTHZjMzU2K3c2QUZRQ0lFRlA3OWZ3QjJqWDFENGQwcmJVeGxtTUtTV2Fk?=
 =?utf-8?B?V21jbzdzQmwrVG5WMmNvK2lWNURHTkZGZXh1SU81bkFnQzZ4M3hhQTZXVHZY?=
 =?utf-8?B?RnVHZG95UUV4MVc3a0dPdFViWnY4ZkZ4bENLMk5PbC9DRlNCeE1XR1VnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTZGUFVJN045YVd4VGxvVXhxb3RpWHdEZ2NVRVBTSWtDSUk4b2NrVCt3cEZp?=
 =?utf-8?B?eDg5TjFyYzN4a0IxcCtmTEJQT2VXQjdnVWVHWGJUQlBqK2k2LzZWYlkxLzI5?=
 =?utf-8?B?M2Z5c1JUOGF0Y3FNVEppRnlKSFV3YjlpY01QeHdZMy83NTVMZ0x5WGk1NnhN?=
 =?utf-8?B?dmJzU09Fa2RyeDFReVJlUHJpTTRmZERyTkh3dlhSaDRMU2s2MzBPQ3NqSG5t?=
 =?utf-8?B?UVJ0Z2p0RVU4S1Q0S1c3YktLeWNQZTg1YnAzNmozb1VBcmFpMFNkOUVDSWtC?=
 =?utf-8?B?M3phQ1FBeUl1Qlg1L0FmallrTW5XRVFwTUhacG9Od2t0TjhZVDNIM2d0NlhK?=
 =?utf-8?B?cmFLdzNCaFgrTGdLRTQyci82aG81NXdROC9XQ3VLTkVjc3FRMDk4US9CYnJq?=
 =?utf-8?B?TmVVMFJZRlpNczQyUDNNSFplZlN4eWJPOXVPdWtIZlBtZUx1RU93NTR2aVdz?=
 =?utf-8?B?YkYxVFdub0phS0ZkRldtLzNVaVpTSjIrVjd5ODhWaVFUdk1kZjhsbmZIZ2oy?=
 =?utf-8?B?OGJMQjJWN2tHc3ZDY3FCSFR4N2hNdXdkWU9yWmU2azBKNllMYnk0cURJYk5u?=
 =?utf-8?B?UE80QUppcGJoNUczNFNOaDA1YTNNdlNrcHRQVThHYU5wVmx3T2QxaUhsZ2lp?=
 =?utf-8?B?UnlTalRYUDJnR1FjWWpzTkRTK2hEOGc3MlMxM2EvYzY1M3pLTmNNOTgzL00v?=
 =?utf-8?B?SWZtbDJ6S1dXRXp2M1JaUnVSWmhCbk5RdmVUdXlJVm5qQVdlY2JJNCtWOEs0?=
 =?utf-8?B?MUxJd3NOckJuRFdHVkR1Ymdmak1NS1N1cnR4TTlQZHRYRG1ZbFltc2Q4L0hm?=
 =?utf-8?B?b213Tlh5eWl4aG9VRUM3S0p6WWMyRDc4R2J0bisxbWZzdlYvVENucTNoVk9o?=
 =?utf-8?B?LzBKbFdUemhSNzFyeFZqcTlpMmZnMERMbjZ5QW9FdURDOGI5WmsxSmU0blQr?=
 =?utf-8?B?WHNPa2Z5WFRzUnBDOFJLWm9sVUErUEZBOS82Y1dCTUZFZ3BUU0FtejVUUWVq?=
 =?utf-8?B?eHRNZ3lpMWdhQmJkcEtVSjExeGYrZlc4dGI4ZlFLbnRkMzI1c1diUnU0eE9I?=
 =?utf-8?B?dmFvK3B0T0FKL2tndTBDSEtBT3k2Z24xZUhDSXl5alRvbUIwa0tCWVZSWDlZ?=
 =?utf-8?B?K0VHMDF1T1M3K1c3MWI0RW5DNjNwOWlmaldjWDhMb1RWZllNamswZVR0YlpJ?=
 =?utf-8?B?VkRoRkF0VFZjZWxTYlZ6VkdqbjNkRHVPeG11cmxRaEdwdE9CaWNESHdnWTU3?=
 =?utf-8?B?YlBCREZjYzFaby9WN3FOVktLbndhWVJ0cGdxSE5FVGd1Z3I5eTA0cU9adFJt?=
 =?utf-8?B?SVRKdDk2RHNFZThSTmU2K3BRbG53eWJqRGtjYlZCc0loQ2NCT1BMT3BvNkgy?=
 =?utf-8?B?MGRxKzZBaGJ3WmVBWVBnR0RmNzBZV21mSmY2NXJuUnZ2T3RoUEVZSUJXeGlT?=
 =?utf-8?B?MlFhRE1jamVjWlE3dGkwNGN6NVk2bktla3lVcEUxWG5FNHBPdTlDUGZrRTBi?=
 =?utf-8?B?eUpHeGdiQ2VpamR4dHdtaUsrT1RIdC9Na1A2SmlVL1BUZTBvK0o3RVZHbTRS?=
 =?utf-8?B?b2xPL1dobk8vU2FwdmNXNC9hSzRva2pBYlpGVVNtb3R2QkdnNUdIT2l3TWdi?=
 =?utf-8?B?VEh1OW8rN1FmRXQvcWJreHJsOTEzNFlhVHVQMFZqRnM0ek9MZXNIY3VONlI3?=
 =?utf-8?B?NVhmTjRFSm41YXJSNmEvc0lpR0t3V2dMUW03UWVIeGJqZ1RWYkY3eFp2YUlp?=
 =?utf-8?B?NWlDd2VCaEliU3pLZUIxL0QzdFZOUHFMZndnQXZYUUJIR2xObUIyM0VNR2Jw?=
 =?utf-8?B?M0dJYlc0V0VLNnNvMHFkY3UxSkZOdlNXRW5Jd0dQTENwTFJzaUxKd1VKeCsr?=
 =?utf-8?B?QlpYWGRrTi9ibTRha0VRaDBRTThJbHVLcnMrK2RmNWVKcVdqMDQwREYxZGRH?=
 =?utf-8?B?OW1ySURJaWVrRktzRkYybWZjaHJRMEZ6U2VJanVaajY1Zk1tMzZxaXJLUWJQ?=
 =?utf-8?B?dGN5L2ExNFhXTklxalFIam9mR1NmZXlqNkREN21kcGpxcGdES1p1dkllWnVu?=
 =?utf-8?B?ZVA2Q0xRa2g5MEwxT3ZXNWdZaWFLTnJ5TmRicUpnU3NzZ0dsY0xLUmc3eEhM?=
 =?utf-8?Q?dmYujNtx/vbTaqLMcvGSddGVC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f996cd-6505-4e88-17da-08dc76608cb5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 11:00:23.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEBakd00egMEMR8ZTAKs4XYR9q0a+P8i5mODKk/+sMRsb0lis+MqY/xAkD1WTS++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7740
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

Am 17.05.24 um 10:53 schrieb Matthew Auld:
> On 17/05/2024 02:11, Dave Airlie wrote:
>> On Thu, 29 Feb 2024 at 23:48, Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Thu, Feb 29, 2024, at 11:51, Matthew Auld wrote:
>>>> The drm_buddy minimum page-size requirements should be distinct 
>>>> from the
>>>> CPU PAGE_SIZE. Only restriction is that the minimum page-size is at
>>>> least 4K.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>
>> Has this landed anywhere yet?
>
> Looks like it fell through the cracks. I think it still applies, so 
> just needs someone with commit rights to push it.

Pushed to drm-misc-fixes.

Regards,
Christian.

>
>>
>> I'm been testing 6.9 on 64K pages and the buddy tests are exploding so
>> I wanted to pull this in.
>>
>> Dave.

