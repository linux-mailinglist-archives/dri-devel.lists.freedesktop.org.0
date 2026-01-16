Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D86D2DAAC
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:05:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF1010E818;
	Fri, 16 Jan 2026 08:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="GuD55PPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011049.outbound.protection.outlook.com
 [40.107.130.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAE310E804
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 07:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GFcgN+8OFIDdnkzZ7wQzwjlts06STN4veXPKTiW0lvpxY8tuS0TToXHld5+sn6+LpfTGCO2kNstBGOTJrbl9v3Vic4ij2bJVY0uFJmp2R8aygsKt3Zfb9rrnKJmF0JnLG9y45L66/Qp9B8E2iNoN/Jf2LrlBd2Lt9AaqeQDCfr5pZigFtITLiTVwOAthd1vST0ihAacKPqbonnp5ihjYd/1t95qtCeDmBxY1BkqzWc3NHpJx6z9BInXITJELSWaiaE0S7lh38FQ9Qfg3njoItFIvrLQLycRvpRcmpC8K32LzMIrN8ts8H2DoCakbiDvxWkagENwddJ8QWXK3z8Bhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2h2LZlfN7vjkZboDsVIJWl6KLggmhxwSPVWEU8NPpI=;
 b=X0sBJiMkpjLfKryKro97kCxQNNv+BLpnylbKpEG5Ldpk1G7Qe0o8Bjq93ZWbeVwghZPIcWbbh8pFhUyprtSdJD7Jt77sKzPVnGwXadysoE0BqaGvE+3bgNiY9qllVikYkGYLwdwl3YkUneyXxSKrkacf6YR8+2CCOixmwmwn4kZg3G3VVOGIKlrxemQnB0XHIqJAuz7ssrzjCkBeOuLwsRYO+t9Wix46yL/AZpjHrCtvYiNeHqi6WLrAamwPeQHBzRdfZZAgMfMna+0rl20/QIWjGXl/DZdNYOAwwXvcr9nIE5nyabJXZGVuQpcNAkpny37q9j9eNIrDqjV208jj4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=gmail.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2h2LZlfN7vjkZboDsVIJWl6KLggmhxwSPVWEU8NPpI=;
 b=GuD55PPXC0fYSjQRYo+p9lmgpTMvEQ6IeblZBAnfWQBChsZMCI7SGNrRDcObpPUepA+A3EmrDNNZ0POINCZ+BHxs0I8XZtLRps6j44KhgEU1B+kNIzAXtcY2CUGVT+W5+4dBrhHGdwW8NVRM0GqkdUgW5RzNpf3t2juPgeKo4DGw/Siw7mdtJIKjFCgilmTUfLOkqNPpxpeTQ899vMpcRyc2fPsayqTlNiK2dEuqCh/Y0HQLNyArUuZRVE9TEtA/e/KzG3mBZnKGFZH5vDr5/1jDPx9WZzFGCoouKcibSK0isYfq67p/mDs0bJsjIZNbKJeBIqq1K+qOnl6bVRECTg==
Received: from AM8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::26)
 by GVXPR10MB8358.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 07:10:51 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::dd) by AM8P191CA0021.outlook.office365.com
 (2603:10a6:20b:21a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.7 via Frontend Transport; Fri,
 16 Jan 2026 07:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 07:10:50 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 08:10:43 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 08:10:42 +0100
Message-ID: <fdc39008-ba4a-4170-b7ce-cca2deda5652@de.bosch.com>
Date: Fri, 16 Jan 2026 08:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
To: Dirk Behme <dirk.behme@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Steven Price <steven.price@arm.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|GVXPR10MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: 462a294f-c5c1-4092-1ac1-08de54ce6187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|13003099007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGpkR1hMUnFtdTFWVUwrVk5TOGYwd1NnakIrZWFWYmU2QzYxenNuM3A5OGQx?=
 =?utf-8?B?c2RHcDQ3b0U2S3FnUVRwa1FodVU5M2Z3SDJEdjl0RlQyT1QvbGJyUTJ3eEFq?=
 =?utf-8?B?WGowdXYvYkJPdXlVR0JxdnBvSnorbWVZN3NiY0FTUE9kM1VNVlhRTUJ3dU12?=
 =?utf-8?B?Zm9MeVNxL2t1T2thNjFWS1hGZGNnaDZ2ckZNakp5S2IzRTZQZ2g3Q0pubVNw?=
 =?utf-8?B?VVg4MVNrcE5Pb08wNmNSRThtL01wOVdTQ29UbjF5RmltUVhhU0xMRVFGRlJk?=
 =?utf-8?B?SE1BdWZXK2cvRXdDMHM3Qkx4Um9OZGQwOUt3MGxFYXhxeHR6WVFJV25VWmdW?=
 =?utf-8?B?UXQxUUFicDBSNzVRYlROYzZzbkZuTUw5LzBLNmgydzc4emtsdEd3eDZXK1Nn?=
 =?utf-8?B?Z1ZPdlpyeW5nVStpZW1Sa25jeHFIRE10TWt2cjRJNWc0eXNXbGcvcTROdzZQ?=
 =?utf-8?B?VGxhWVRCdERJZTJxaFdXc3k4RVRaUjVhaWJRR0F4R1JIRlIxSUhwTVB6U0oy?=
 =?utf-8?B?V3NQYnRuWlNJWmJ4a20yOUxaaWxNTyt5citxZUtYM0lLajAyS0MvZUI1bmZh?=
 =?utf-8?B?Mzh1OUlvVHhvRGptcWVadWM1NjJ0dENnd3RxMHBMQloxeE0vdFZnVmRCYnpU?=
 =?utf-8?B?VDJwSGFtVEJhODN2aGdBM0FVeUxWLzhlYWVDRXVHUVljbEIyU00rRi9LUWY4?=
 =?utf-8?B?WktDbU9wMW5uNHVXdzFON3RUdUlsQ0xZdUlXVnhrWW13dTE0U0VONVFNVjdo?=
 =?utf-8?B?bFNaaDQvQ2hhaDZTNjRPSklDZGZDQ0hMSUU1NmhmYTRWeEdZdXBiVXFRQkhi?=
 =?utf-8?B?Q2t6UzUrWTJDYVVkWlU1L2JWLzhXOEZiYzhBWDJiQWlORThETnZDQ2RBZXFz?=
 =?utf-8?B?c3F3NVcrNHZtdG1XUFFaMTZRb0tNd1p3UjlDWjZTU3FCNHhNM0k0YjdIaDIv?=
 =?utf-8?B?b0tVRGg0MFlhTDdXUklpWGE1QVpIUnhVV0JzMjdVaS92L1hPd25iZDB0MTZR?=
 =?utf-8?B?YmduRmR4VGVsakUxSDUrRk56QzVqd3E5dkY5dVYwcjdmS2d4aklENWVwc3l5?=
 =?utf-8?B?d0Z6THZrekpjOWtTWFVOb1FIa3ZVMU05dHdqVVJvTnMwdHFDOXoyT1laUHE2?=
 =?utf-8?B?Q0hIbCs2V0pyZldwN3VNWnhyN0dSWXp4MVJyUzh6eXhQajIzcXRGL1pxMXY2?=
 =?utf-8?B?azRQVVBKcE84eSszR2xTQmxMTnQyN3NtNDRRS3BIaDFSZ045clJxR1kvWFVn?=
 =?utf-8?B?Vy92Rm1kcndIaEpPenJNeHZubUpMYjFDRTNiLzVnN2tKdjd5NGhBQjIrNldY?=
 =?utf-8?B?NW9OdVNzTFIvaGpFS3A0aWJVTDBwT0d5cHV0OWw2RU9abDFRanlscU81cnhF?=
 =?utf-8?B?TW9EWFo1ZE9nWjcvYmllNnBCVGhGdGgxSmkyOURYTGlTVVZtUjQvZkExcFNR?=
 =?utf-8?B?RUVPZlY0eGtSVmcyVDRhdGpSa0w0bEswRDI2M1VOa0FNREtxRmJ1N29pSmlq?=
 =?utf-8?B?d2Z6dmg1RURqSFZNVENwM00rRzVaMWkxNTNRV1I1S1Q2VDZrV29TL3JTeHoz?=
 =?utf-8?B?MUJjTkV5OCs2cWJLazA4anRyTGVuWkFkTmdWd0JLdktlZUU2MThDRXJnNUww?=
 =?utf-8?B?ZGkyMTJycUg2U0lxZVpWZ0ZUMnFmMHNBQlNPVDYxRmE4TGcyVlc1T1Fic2NJ?=
 =?utf-8?B?RGRaamtpVWlreitjWFpScEZKS0tEZmhNbld1SU1aTlBGLzl5S3VTS3l3Y1pK?=
 =?utf-8?B?dWVLZnp3ck51enZLRjN4TE1ud1dFSUlQcThGdFNXeDI5NDI0OVUxbEFYQTZo?=
 =?utf-8?B?bk1yMUFuWFI3WDROMGxTbUVuK1E2MDJ1bG41VkFuNEtQOUxoR2lnZ0Z4azU1?=
 =?utf-8?B?TkErUGhqNXNhVi9pR21pYjh1R2RKS3ltMzMweFNUcGh3WklYTXFjc3pQdkN0?=
 =?utf-8?B?R2M3dXlTMXFYVjdpcWVxUDNOYkpneEJkN2xFMitxWDFzUnBzdDVrRmMwcmFo?=
 =?utf-8?B?S1JOSDBvbFkxQXZCcXNsREpZeTAzdmc1VzdvT2tVT29lbWllaWNPQzVKQ3NX?=
 =?utf-8?B?UTFqUDc1THYxNEZsUXhndDlObkdlMm1OWDJoTWphekhZK1ZyZFFSdmM4K2tP?=
 =?utf-8?B?RlJGM2NlMlBsODMrSitsS0habnNraWJLTUV4OWxqTzNBak9zaUpRNHVGdHlq?=
 =?utf-8?B?cllmMXhlYTYzZm1Zd1JLZ3NwUG1EeUFHTU1odTFEVXQ3RDQwQVhXN0VaNDJt?=
 =?utf-8?Q?mYIduM9uCVt6rQytJ1eXem3kYShyJu/9PZY3ci0L2Y=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.205; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(13003099007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 07:10:50.8619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 462a294f-c5c1-4092-1ac1-08de54ce6187
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.205];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8358
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:05:22 +0000
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

On 15/01/2026 18:05, Dirk Behme wrote:
> Hi Daniel,
> 
> On 14.01.26 23:53, Daniel Almeida wrote:
>> Replace regs::Register with kernel::register. This allow us to more
>> succinctly express the register set by introducing the ability to describe
>> fields and their documentation and to auto-generate the accessors. In
>> particular, this is very helpful as it does away with a lot of manual masks
>> and shifts.
> 
> 
> As mentioned somewhere else already I really like switching to
> register!(). Thanks!
> 
> Some coments below:
> 
> 
>> A future commit will eliminate HI/LO pairs once there is support for 64bit
>> reads and writes in kernel::register.
>>
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>> Note that this patch depends on a rebased version of Joel's patch at [0].
>>
>> That version is stale, so I ended up rebasing it locally myself for the
>> purpose of developing this patch and gathering some reviews on the list. In
>> other words, the current patch does not apply for the time being, but will
>> once a v7 for Joel's series is out.
>>
>> [0]: https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
>> ---
>>   drivers/gpu/drm/tyr/driver.rs |  15 ++-
>>   drivers/gpu/drm/tyr/gpu.rs    |  55 ++++----
>>   drivers/gpu/drm/tyr/regs.rs   | 302 ++++++++++++++++++++++++++++++++----------
>>   3 files changed, 267 insertions(+), 105 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
>> index 0389c558c036..8e06db5320bf 100644
>> --- a/drivers/gpu/drm/tyr/driver.rs
>> +++ b/drivers/gpu/drm/tyr/driver.rs
>> @@ -66,19 +66,20 @@ unsafe impl Send for TyrData {}
>>   unsafe impl Sync for TyrData {}
>>   
>>   fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
>> -    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
>> +    let io = iomem.access(dev)?;
>> +
>> +    regs::GpuCommand::default()
>> +        .set_command(regs::GPU_CMD_SOFT_RESET)
>> +        .write(io);
>>   
>>       // TODO: We cannot poll, as there is no support in Rust currently, so we
>>       // sleep. Change this when read_poll_timeout() is implemented in Rust.
>>       kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>   
>> -    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
>> +    let rawstat = regs::GpuIrqRawstat::read(io);
>> +    if !rawstat.reset_completed() {
>>           dev_err!(dev, "GPU reset failed with errno\n");
>> -        dev_err!(
>> -            dev,
>> -            "GPU_INT_RAWSTAT is {}\n",
>> -            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>> -        );
>> +        dev_err!(dev, "GPU_INT_RAWSTAT is {}\n", u32::from(rawstat));
> 
> 
> This is pre-existing, but printing `... INT ...` for `...IRQ...`
> register looks confusing (wrong?).
> 
> 
>>           return Err(EIO);
>>       }
>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>> index 6c582910dd5d..7c698fb1e36a 100644
>> --- a/drivers/gpu/drm/tyr/gpu.rs
>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>> @@ -44,34 +44,36 @@ pub(crate) struct GpuInfo {
>>   
>>   impl GpuInfo {
>>       pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>> -        let gpu_id = regs::GPU_ID.read(dev, iomem)?;
>> -        let csf_id = regs::GPU_CSF_ID.read(dev, iomem)?;
>> -        let gpu_rev = regs::GPU_REVID.read(dev, iomem)?;
>> -        let core_features = regs::GPU_CORE_FEATURES.read(dev, iomem)?;
>> -        let l2_features = regs::GPU_L2_FEATURES.read(dev, iomem)?;
>> -        let tiler_features = regs::GPU_TILER_FEATURES.read(dev, iomem)?;
>> -        let mem_features = regs::GPU_MEM_FEATURES.read(dev, iomem)?;
>> -        let mmu_features = regs::GPU_MMU_FEATURES.read(dev, iomem)?;
>> -        let thread_features = regs::GPU_THREAD_FEATURES.read(dev, iomem)?;
>> -        let max_threads = regs::GPU_THREAD_MAX_THREADS.read(dev, iomem)?;
>> -        let thread_max_workgroup_size = regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
>> -        let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
>> -        let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
>> -
>> -        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
>> -
>> -        let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
>> -
>> -        let shader_present = u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
>> +        let io = (*iomem).access(dev)?;
>> +
>> +        let gpu_id = regs::GpuId::read(io).into();
>> +        let csf_id = regs::CsfId::read(io).into();
>> +        let gpu_rev = regs::RevIdr::read(io).into();
>> +        let core_features = regs::CoreFeatures::read(io).into();
>> +        let l2_features = regs::L2Features::read(io).into();
>> +        let tiler_features = regs::TilerFeatures::read(io).into();
>> +        let mem_features = regs::MemFeatures::read(io).into();
>> +        let mmu_features = regs::MmuFeatures::read(io).into();
>> +        let thread_features = regs::ThreadFeatures::read(io).into();
>> +        let max_threads = regs::ThreadMaxThreads::read(io).into();
>> +        let thread_max_workgroup_size = regs::ThreadMaxWorkgroupSize::read(io).into();
>> +        let thread_max_barrier_size = regs::ThreadMaxBarrierSize::read(io).into();
>> +        let coherency_features = regs::CoherencyFeatures::read(io).into();
> 
> 
> Is there any reason why you replace the UPPERCASE register names with
> CamelCase ones?
> 
> I was under the impression that we want to use UPPERCASE for register
> names. Like in nova
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/nova-core/regs.rs
> 
> 
> 
>> +        let texture_features = regs::TextureFeatures::read(io, 0).into();
>> +
>> +        let as_present = regs::AsPresent::read(io).into();
>> +
>> +        let shader_present = u64::from(u32::from(regs::ShaderPresentLo::read(io)));
>>           let shader_present =
>> -            shader_present | u64::from(regs::GPU_SHADER_PRESENT_HI.read(dev, iomem)?) << 32;
>> +            shader_present | u64::from(u32::from(regs::ShaderPresentHi::read(io))) << 32;
>>   
>> -        let tiler_present = u64::from(regs::GPU_TILER_PRESENT_LO.read(dev, iomem)?);
>> +        let tiler_present = u64::from(u32::from(regs::TilerPresentLo::read(io)));
>>           let tiler_present =
>> -            tiler_present | u64::from(regs::GPU_TILER_PRESENT_HI.read(dev, iomem)?) << 32;
>> +            tiler_present | u64::from(u32::from(regs::TilerPresentHi::read(io))) << 32;
>>   
>> -        let l2_present = u64::from(regs::GPU_L2_PRESENT_LO.read(dev, iomem)?);
>> -        let l2_present = l2_present | u64::from(regs::GPU_L2_PRESENT_HI.read(dev, iomem)?) << 32;
>> +        let l2_present = u64::from(u32::from(regs::L2PresentLo::read(io)));
>> +        let l2_present = l2_present | u64::from(u32::from(regs::L2PresentHi::read(io))) << 32;
>>   
>>           Ok(Self {
>>               gpu_id,
>> @@ -204,13 +206,14 @@ fn from(value: u32) -> Self {
>>   
>>   /// Powers on the l2 block.
>>   pub(crate) fn l2_power_on(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
>> -    regs::L2_PWRON_LO.write(dev, iomem, 1)?;
>> +    let io = (*iomem).access(dev)?;
>> +    regs::L2PwrOnLo::default().set_l2_pwron_lo(1).write(io);
>>   
>>       // TODO: We cannot poll, as there is no support in Rust currently, so we
>>       // sleep. Change this when read_poll_timeout() is implemented in Rust.
>>       kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>   
>> -    if regs::L2_READY_LO.read(dev, iomem)? != 1 {
>> +    if regs::L2ReadyLo::read(io).l2_ready_lo() != 1 {
>>           dev_err!(dev, "Failed to power on the GPU\n");
>>           return Err(EIO);
>>       }
>> diff --git a/drivers/gpu/drm/tyr/regs.rs b/drivers/gpu/drm/tyr/regs.rs
>> index f46933aaa221..a4e05ff463c0 100644
>> --- a/drivers/gpu/drm/tyr/regs.rs
>> +++ b/drivers/gpu/drm/tyr/regs.rs
>> @@ -8,44 +8,62 @@
>>   #![allow(dead_code)]
>>   
>>   use kernel::bits::bit_u32;
>> -use kernel::device::Bound;
>> -use kernel::device::Device;
>> -use kernel::devres::Devres;
>>   use kernel::prelude::*;
>> +use kernel::register;
>>   
>> -use crate::driver::IoMem;
>> -
>> -/// Represents a register in the Register Set
>> -///
>> -/// TODO: Replace this with the Nova `register!()` macro when it is available.
>> -/// In particular, this will automatically give us 64bit register reads and
>> -/// writes.
>> -pub(crate) struct Register<const OFFSET: usize>;
>> -
>> -impl<const OFFSET: usize> Register<OFFSET> {
>> -    #[inline]
>> -    pub(crate) fn read(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<u32> {
>> -        let value = (*iomem).access(dev)?.read32(OFFSET);
>> -        Ok(value)
>> -    }
>> -
>> -    #[inline]
>> -    pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u32) -> Result {
>> -        (*iomem).access(dev)?.write32(value, OFFSET);
>> -        Ok(())
>> -    }
>> -}
>> -
>> -pub(crate) const GPU_ID: Register<0x0> = Register;
>> -pub(crate) const GPU_L2_FEATURES: Register<0x4> = Register;
>> -pub(crate) const GPU_CORE_FEATURES: Register<0x8> = Register;
>> -pub(crate) const GPU_CSF_ID: Register<0x1c> = Register;
>> -pub(crate) const GPU_REVID: Register<0x280> = Register;
>> -pub(crate) const GPU_TILER_FEATURES: Register<0xc> = Register;
>> -pub(crate) const GPU_MEM_FEATURES: Register<0x10> = Register;
>> -pub(crate) const GPU_MMU_FEATURES: Register<0x14> = Register;
>> -pub(crate) const GPU_AS_PRESENT: Register<0x18> = Register;
>> -pub(crate) const GPU_IRQ_RAWSTAT: Register<0x20> = Register;
>> +register!(GpuId @ 0x0, "Information about the GPU architecture and release version" {
>> +    3:0     version_status as u32, "Status of the GPU release";
>> +    11:4    version_minor as u32, "Minor release version number";
>> +    15:12   version_major as u32, "Major release version number";
>> +    19:16   product_major as u32, "Product identifier";
>> +    23:20   arch_rev as u32, "Architecture patch revision";
>> +    27:24   arch_minor as u32, "Architecture minor revision";
>> +    31:28   arch_major as u32, "Architecture major revision";
>> +});
>> +
>> +register!(L2Features @ 0x4, "Level 2 cache features" {
>> +    7:0     line_size as u32, "L2 cache line size";
>> +    15:8    associativity as u32, "L2 cache associativity";
>> +    23:16   cache_size as u32, "L2 cache slice size";
>> +    31:24   bus_width as u32, "L2 cache bus width";
>> +});
>> +
>> +register!(CoreFeatures @ 0x8, "Information about the features of a shader core" {
>> +    7:0     core_variant as u32, "Shader core variant";
>> +});
>> +
>> +register!(CsfId @ 0x1c, "Version of the CSF hardware and MMU subsystem" {
>> +    3:0     mcu_rev as u32, "MCU revision ID";
>> +    9:4     mcu_minor as u32, "MCU minor revision number";
>> +    15:10   mcu_major as u32, "MCU major revision number";
>> +    19:16   cshw_rev as u32, "CSHW revision ID";
>> +    25:20   cshw_minor as u32, "CSHW minor revision number";
>> +    31:26   cshw_major as u32, "CSHW major revision number";
>> +});
>> +
>> +register!(RevIdr @ 0x280, "Extra revision information" {
>> +    31:0    revision as u32, "Revision information";
>> +});
>> +
>> +register!(TilerFeatures @ 0xc, "Tiler features" {
>> +    5:0     bin_size as u32, "Log of the tiler's bin size";
>> +    11:8    max_levels as u32, "Maximum number of available levels";
>> +});
>> +
>> +register!(MemFeatures @ 0x10, "Memory features" {
>> +    0:0     coherent_core_group as bool, "Core group is coherent";
>> +    1:1     coherent_super_group as bool, "Core supergroup is coherent";
>> +    11:8    l2_slices as u32, "L2 slice count";
>> +});
>> +
>> +register!(MmuFeatures @ 0x14, "MMU features" {
>> +    7:0     va_bits as u32, "Number of bits supported in virtual addresses";
>> +    15:8    pa_bits as u32, "Number of bits supported in physical addresses";
>> +});
>> +
>> +register!(AsPresent @ 0x18, "Address spaces present" {
>> +    31:0    as_present as u32, "Bitmask of present address spaces";
>> +});
>>   
>>   pub(crate) const GPU_IRQ_RAWSTAT_FAULT: u32 = bit_u32(0);
>>   pub(crate) const GPU_IRQ_RAWSTAT_PROTECTED_FAULT: u32 = bit_u32(1);
>> @@ -56,53 +74,193 @@ pub(crate) fn write(&self, dev: &Device<Bound>, iomem: &Devres<IoMem>, value: u3
>>   pub(crate) const GPU_IRQ_RAWSTAT_DOORBELL_STATUS: u32 = bit_u32(18);
>>   pub(crate) const GPU_IRQ_RAWSTAT_MCU_STATUS: u32 = bit_u32(19);
>>   
>> -pub(crate) const GPU_IRQ_CLEAR: Register<0x24> = Register;
>> -pub(crate) const GPU_IRQ_MASK: Register<0x28> = Register;
>> -pub(crate) const GPU_IRQ_STAT: Register<0x2c> = Register;
>> -pub(crate) const GPU_CMD: Register<0x30> = Register;
>> +register!(GpuIrqRawstat @ 0x20, "Raw unmasked interrupt status for the GPU" {
>> +    0:0     fault as bool, "A GPU fault has occourred";
>> +    1:1     protected_fault as bool, "Indicates a protected memory fault has occurred";
>> +    8:8     reset_completed as bool, "Indicates that a GPU reset has completed";
>> +    9:9     power_changed_single as bool, "Set when a single power domain has powered up or down";
>> +    10:10   power_changed_all as bool, "Set when all pending power domain changes are completed ";
>> +    17:17   clean_caches_completed as bool, "Indicates that a cache clean operation has completed";
>> +    18:18   doorbell_status as bool, "Mirrors the doorbell interrupt line to the CPU";
>> +    19:19   mcu_status as bool, "The MCU requires attention";
>> +});
>> +
>> +register!(GpuIrqClear @ 0x24, "Clears pending GPU interrupts" {
>> +    0:0     fault as bool, "Clear the fault interrupt";
>> +    1:1     protected_fault as bool, "Clear the protected_fault interrupt";
>> +    8:8     reset_completed as bool, "Clear the reset_completed interrupt";
>> +    9:9     power_changed_single as bool, "Clear the power_changed_single interrupt";
>> +    10:10   power_changed_all as bool, "Clear the power_changed_all interrupt";
>> +    17:17   clean_caches_completed as bool, "Clear the clean_caches_completed interrupt";
>> +    18:18   doorbell_status as bool, "Clear the doorbell_status interrupt";
>> +    19:19   mcu_status as bool, "Clear the mcu_status interrupt";
>> +});
>> +
>> +register!(GpuIrqMask @ 0x28, "Enabled GPU interrupts" {
>> +    0:0     fault as bool, "Enable the fault interrupt";
>> +    1:1     protected_fault as bool, "Enable the protected_fault interrupt";
>> +    8:8     reset_completed as bool, "Enable the reset_completed interrupt";
>> +    9:9     power_changed_single as bool, "Enable the power_changed_single interrupt";
>> +    10:10   power_changed_all as bool, "Enable the power_changed_all interrupt";
>> +    17:17   clean_caches_completed as bool, "Enable the clean_caches_completed interrupt";
>> +    18:18   doorbell_status as bool, "Enable the doorbell_status interrupt";
>> +    19:19   mcu_status as bool, "Enable the mcu_status interrupt";
>> +});
>> +
>> +register!(GpuIrqStatus @ 0x2c, "Masked GPU interrupt status" {
>> +    0:0     fault as bool, "The fault interrupt is pending";
>> +    1:1     protected_fault as bool, "The protected_fault interrupt is pending";
>> +    8:8     reset_completed as bool, "The reset_completed interrupt is pending";
>> +    9:9     power_changed_single as bool, "The power_changed_single interrupt is pending";
>> +    10:10   power_changed_all as bool, "The power_changed_all interrupt is pending";
>> +    17:17   clean_caches_completed as bool, "The clean_caches_completed interrupt is pending";
>> +    18:18   doorbell_status as bool, "The doorbell_status interrupt is pending";
>> +    19:19   mcu_status as bool, "The mcu_status interrupt is pending";
>> +});
>> +
>>   pub(crate) const GPU_CMD_SOFT_RESET: u32 = 1 | (1 << 8);
>>   pub(crate) const GPU_CMD_HARD_RESET: u32 = 1 | (2 << 8);
>> -pub(crate) const GPU_THREAD_FEATURES: Register<0xac> = Register;
>> -pub(crate) const GPU_THREAD_MAX_THREADS: Register<0xa0> = Register;
>> -pub(crate) const GPU_THREAD_MAX_WORKGROUP_SIZE: Register<0xa4> = Register;
>> -pub(crate) const GPU_THREAD_MAX_BARRIER_SIZE: Register<0xa8> = Register;
>> -pub(crate) const GPU_TEXTURE_FEATURES0: Register<0xb0> = Register;
>> -pub(crate) const GPU_SHADER_PRESENT_LO: Register<0x100> = Register;
>> -pub(crate) const GPU_SHADER_PRESENT_HI: Register<0x104> = Register;
>> -pub(crate) const GPU_TILER_PRESENT_LO: Register<0x110> = Register;
>> -pub(crate) const GPU_TILER_PRESENT_HI: Register<0x114> = Register;
>> -pub(crate) const GPU_L2_PRESENT_LO: Register<0x120> = Register;
>> -pub(crate) const GPU_L2_PRESENT_HI: Register<0x124> = Register;
>> -pub(crate) const L2_READY_LO: Register<0x160> = Register;
>> -pub(crate) const L2_READY_HI: Register<0x164> = Register;
>> -pub(crate) const L2_PWRON_LO: Register<0x1a0> = Register;
>> -pub(crate) const L2_PWRON_HI: Register<0x1a4> = Register;
>> -pub(crate) const L2_PWRTRANS_LO: Register<0x220> = Register;
>> -pub(crate) const L2_PWRTRANS_HI: Register<0x204> = Register;
>> -pub(crate) const L2_PWRACTIVE_LO: Register<0x260> = Register;
>> -pub(crate) const L2_PWRACTIVE_HI: Register<0x264> = Register;
>> -
>> -pub(crate) const MCU_CONTROL: Register<0x700> = Register;
>> +
>> +register!(GpuCommand @ 0x30, "GPU command register" {
>> +    7:0     command as u32, "GPU-specific command to execute";
>> +    31:8    payload as u32, "Payload for the command";
>> +});
>> +
>> +register!(ThreadFeatures @ 0xac, "Thread features of the GPU's threading system" {
>> +    21:0    max_registers as u32, "Total number of registers per core";
>> +    23:22   implementation_technology as u32;
>> +    31:24   max_task_queue as u32, "Maximum number of compute tasks waiting";
>> +
>> +});
>> +
>> +register!(ThreadMaxThreads @ 0xa0, "Maximum number of threads per core" {
>> +    31:0    max_threads as u32, "Maximum number of threads per core";
>> +});
>> +
>> +register!(ThreadMaxWorkgroupSize @ 0xa4, "Maximum number of threads per workgroup" {
>> +    31:0    max_workgroup_size as u32, "Maximum number of threads per workgroup";
>> +});
>> +
>> +register!(ThreadMaxBarrierSize @ 0xa8, "Maximum number of threads per barrier" {
>> +    31:0    max_barrier_size as u32, "Maximum number of threads per barrier";
>> +});
>> +
>> +register!(TextureFeatures @ 0xb0 [4], "Bitmap of supported texture formats" {});
>> +
>> +register!(ShaderPresentLo @ 0x100, "Bitmap of shader cores present in the hardware (lower 32 bits)" {
>> +    31:0    shader_present_lo as u32, "Bitmap of shader cores present in the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(ShaderPresentHi @ 0x104, "Bitmap of shader cores present in the hardware (higher 32 bits)" {
>> +    31:0    shader_present_hi as u32, "Bitmap of shader cores present in the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(TilerPresentLo @ 0x110, "Bitmap of tiler cores present in the hardware (lower 32 bits)" {
>> +    31:0    tiler_present_lo as u32, "Bitmap of tiler cores present in the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(TilerPresentHi @ 0x114, "Bitmap of tiler cores present in the hardware (higher 32 bits)" {
>> +    31:0    tiler_present_hi as u32, "Bitmap of tiler cores present in the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(L2PresentLo @ 0x120, "Bitmap of L2 caches present in the hardware (lower 32 bits)" {
>> +    31:0    l2_present_lo as u32, "Bitmap of L2 caches present in the hardware (lower 32 bits)";
>> +});
>> +
>> +register!(L2PresentHi @ 0x124, "Bitmap of L2 caches present in the hardware (higher 32 bits)" {
>> +    31:0    l2_present_hi as u32, "Bitmap of L2 caches present in the hardware (higher 32 bits)";
>> +});
>> +
>> +register!(L2ReadyLo @ 0x160, "Bitmap of L2 caches ready (lower 32 bits)" {
>> +    31:0    l2_ready_lo as u32, "Bitmap of L2 caches ready (lower 32 bits)";
>> +});
>> +
>> +register!(L2ReadyHi @ 0x164, "Bitmap of L2 caches ready (higher 32 bits)" {
>> +    31:0    l2_ready_hi as u32, "Bitmap of L2 caches ready (higher 32 bits)";
>> +});
>> +
>> +register!(L2PwrOnLo @ 0x1a0, "Bitmap of L2 caches power on requests (lower 32 bits)" {
>> +    31:0    l2_pwron_lo as u32, "Bitmap of L2 caches power on requests (lower 32 bits)";
>> +});
>> +
>> +register!(L2PwrOnHi @ 0x1a4, "Bitmap of L2 caches power on requests (higher 32 bits)" {
>> +    31:0    l2_pwron_hi as u32, "Bitmap of L2 caches power on requests (higher 32 bits)";
>> +});
>> +
>> +register!(L2PwrTransLo @ 0x200, "Bitmap of L2 caches in power transition (lower 32 bits)" {
>> +    31:0    l2_pwrtrans_lo as u32, "Bitmap of L2 caches in power transition (lower 32 bits)";
>> +});
>> +
>> +register!(L2PwrTransHi @ 0x204, "Bitmap of L2 caches in power transition (higher 32 bits)" {
>> +    31:0    l2_pwrtrans_hi as u32, "Bitmap of L2 caches in power transition (higher 32 bits)";
>> +});
>> +
>> +register!(L2PowerActiveLo @ 0x260, "Bitmap of L2 caches active (lower 32 bits)" {
>> +    31:0    l2_pwractive_lo as u32, "Bitmap of L2 caches active (lower 32 bits)";
>> +});
>> +
>> +register!(L2PowerActiveHi @ 0x264, "Bitmap of L2 caches active (higher 32 bits)" {
>> +    31:0    l2_pwractive_hi as u32, "Bitmap of L2 caches active (higher 32 bits)";
>> +});
>> +
>>   pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
>>   pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
>>   pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
>>   
>> -pub(crate) const MCU_STATUS: Register<0x704> = Register;
>> +register!(McuControl @ 0x700, "Controls the execution state of the MCU subsystem" {
>> +    1:0     req as u32, "Request state change";
>> +});
> 
> 
> Any reason why req is a u32 and not a u8? Same for some other places.
> 
> And would it be an option to move the const MCU_CONTROL* to an ìmpl
> McuControl Same for STATUS below.

Just fyi something like [1] builds for me.

This is inspired by

https://lore.kernel.org/rust-for-linux/20251003154748.1687160-6-joelagnelf@nvidia.com/

Best regards

Dirk

[1]

#[repr(u32)]
#[derive(Debug, Default, Clone, Copy, PartialEq)]
enum McuControl {
     #[default]
     Disable = 0,
     Enable = 1,
     Auto = 2,
}

impl From<McuControl> for u8 {
     fn from(ctrl: McuControl) -> Self {
         ctrl as u8
     }
}

impl From<u8> for McuControl {
     fn from(req: u8) -> Self {
         match req & 0x3 {
             0 => McuControl::Disable,
             1 => McuControl::Enable,
             2 => McuControl::Auto,
             _ => McuControl::Disable,
         }
     }
}

register!(MCUCONTROL @ 0x700, "Controls the execution state of the MCU 
subsystem" {
     1:0     req as u8 => McuControl, "Request state change";
});
