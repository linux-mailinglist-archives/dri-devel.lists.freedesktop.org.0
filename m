Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6CD32F0F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEF010E8BB;
	Fri, 16 Jan 2026 14:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="GGvuf/Rv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C17710E899
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 13:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfjbjvXCaByqF7EJvm5WYVkxmdvlZhHbF77mL3X67nSJGnI1d2Hgez6bltqB2NiI2LZaLpDsLYZEmghyWo9RLmBjPh2E9GHEISjvLmxNSFbk/0Ks3+UUJyEGvzZuTxV72IlZHXTpUCOZGnDI4NilC6Uas/kgxR3+C+UVN3PNCc9uuyIdroTf2+wh0qWhoItd0syFnnuCEidTdzktxVtbIYbfr2Nk1Vf3ZGq9kMcV9wrKh4hFhjQr7/Zun3pTnPi4DrHVKF3nlcX9oWeRhsZeTKcvCPPGLt8K3m5QQpHlD7xLe1XUCa6yoyZa8MuJcxpmHEv9ySBSaqmMb4rmiqvqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AW76cf1Dg71zs+R2Hey9cmUFO3dSxbJWYz4m42ONmhs=;
 b=TPw4LGwJIuYCUfOERYTWtRuhYNGD9rhr/f6K80wepj1P/irfTFazkonz7ooFwxznLKVOtGjrNxAicoxkSz2q3G2itX++LjFgpecWAVK1BkCw4XEIWyw+ftcu+caoncxSrJ9Wxy0JNhkHrIVvSvsUvYcS+Zxdu60A2EA/DQYZEG77bNnRMWPyRVut5k6aGMCA9NPlb/2veE7N7p4KGOpFWIBRQpOFKlYPSxr+C0TmyizSHw8ZlkmVfXZ2RK6E/mOPtS5FL80eaVX277m/24R8qeaEIo4b8se0eplBVWjR1mFM7dzEr2f9G2mgVQBaA5hv8LA/Msg84WwbDZPXxZQnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=collabora.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AW76cf1Dg71zs+R2Hey9cmUFO3dSxbJWYz4m42ONmhs=;
 b=GGvuf/RvJw9HOqdtv2UuAXJwmce+uT0a9s9L5dMpgxWQNei3D8cKpQc91DNU2FAMpbxum+h8hCT6STGBNfSTXQ40tp3CZle9gntKzjInh86I5v+44ac3TfX1yLXi+a1p2S6hdbLL2wqa78bjfb6Cx02+0xA8VHjyQauutMDidI8IA0gKh8qKxatwR0d+XNXtaq8Z97oxpKpCRIwwGzzfbgZXB8baF/tspBYcdc2yYOYU9vVEVvCRT+zPzDih21XjZdhH+2fwUxgS4i6sCXiYj5DYXp2bKUWMOB+quHM+NHtjlHomNOGVya9lkq3Nuod7F0DaIInqF+2P42p9QRBsDQ==
Received: from DU7P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::18)
 by AS8PR10MB6889.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 13:01:19 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::bf) by DU7P251CA0012.outlook.office365.com
 (2603:10a6:10:551::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 13:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 13:01:19 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 14:01:01 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 16 Jan
 2026 14:01:00 +0100
Message-ID: <cc73ce51-39c1-4f2d-8bcb-99fd220fd34c@de.bosch.com>
Date: Fri, 16 Jan 2026 14:00:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] rust/drm: tyr: Convert to the register!() macro
To: Daniel Almeida <daniel.almeida@collabora.com>, Dirk Behme
 <dirk.behme@gmail.com>
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, "Steven
 Price" <steven.price@arm.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
References: <20260114-tyr-register-v1-1-7deb1b33627a@collabora.com>
 <f7ff8b11-b1a5-4537-9227-e42a3a40aa96@gmail.com>
 <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <A04F0357-896E-4ACC-BC0E-DEE8608CE518@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|AS8PR10MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: e149276d-b391-440b-f6f0-08de54ff5768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXBzVjFWYXBzOFZHejZseTdLcWVwSGUwQUpVVXhVSjZTSHlHNVNOWTdDWUYv?=
 =?utf-8?B?c1Y1K0NyWjFudDRKd09QVXNBVTRPNllHVktDUUV2VWY3d0Y5bzMyTVkyTWFT?=
 =?utf-8?B?MW5DN3pjZU91WGdQcUh4UGFDbksyb1FISG9NclV4VzNEa3ZITDR3THZraTk3?=
 =?utf-8?B?VlhKeGtpekhzWXNNV3BPNEpPUDA2dTV4aUIrbUh5TGUxRkp3MG5BZWd5Qzh0?=
 =?utf-8?B?Y3A4bTVnZ3dlVWk1VTUxZjY4cmdFWXd4eC9TV2ROYkF1ZjRNeHM2dSs1ZTJE?=
 =?utf-8?B?Y3VudEZxaXVwUC9SSFVsdVFVOWdtNmRrbkpNNS9BbkFjb2dHcFAwV0Y0SUdR?=
 =?utf-8?B?WEQ3Mlo1UkI2b3JBeGg5SkhEN0VuZ3FYdnc4NGVneEhGbzBTTUZlSUk1YnRu?=
 =?utf-8?B?cDJEazdkVjhXalpzRzJBdXZ3cUNIYVFUdGI4dnlwQzY2UE96SFk0dEhpRENr?=
 =?utf-8?B?NlRBdUV6SHVrZkUySSsvMmt6VzJkVjFpZE5NSWlnNGtCTDdUZkFoMVpJdys4?=
 =?utf-8?B?YWc5aGw2bkZnN0x1Rk5CUEsrVjFHQVV4eWFPTmI1eFhJbnhmL0Zyalhyd0ZW?=
 =?utf-8?B?V2tGVlU0alYySDM3WVNvQmlHVzJwRGlWTTlkcFp3dWdjemM4NTR4WjNMODdR?=
 =?utf-8?B?K1ArNFNoMlRTK2g0cUV3SWdkRkRUT3VoTE5xalFOQWNTZUhzODQxOElRV3BS?=
 =?utf-8?B?MzkwY0s2MWw4b1MzS2FLZHNaMzNaTEFEbVJSMGtpdHRGQy92OHhFbm93ck1D?=
 =?utf-8?B?R0kwWS9vbXNDcUVWemhGbS9WUUYrYXVvVDhqQkt4amhiVnNTd0NFemJTclY1?=
 =?utf-8?B?Tld2cjFXRVRKSk5ZcHdROVF5OWROQVRoRk5BaWdRMXZyT3Npc3FIazlsbTJO?=
 =?utf-8?B?NGlpYko2UFFJQWpmVkdKR01iK2k2RGVQMkZxUm92QndieWhoQmhCeXV1ZGdq?=
 =?utf-8?B?K0RFT3dtRDFKQjJtcTQ1aXg5YkMxSVBqSlJWNElVSnNZUlJ1ZERFamp5R1Mz?=
 =?utf-8?B?Qmc4SkhPK3BUWmROM0c3d3BCTHYzbWk0WTVVeE9yNTI2UmRTRmxtRXNzUzUv?=
 =?utf-8?B?TitTa3YxYTJVck05YUhPN2REa2tiMDZLMGl5Q2dSNG9LQkhkVCthYVl0UjBZ?=
 =?utf-8?B?REU3SWo2U3VyNFlGcXBUU3hsV1cvY3R0bU9DcnppVUthK2JwMHVUaDYydVhy?=
 =?utf-8?B?WGNna1JqdG9Gcm5kWVZ4b0xnK0M5Nm1DRXJzdWtOQ0o4bzJLTFYxV1hYTnRQ?=
 =?utf-8?B?QW5hQ3pacU1tYm1scFp0L0lESUthSGV3T0FiM1h2OUdadnpveVJHZWNJa3hV?=
 =?utf-8?B?Q3pYR2FGMFVvejhCYVNYajVSeXpBVjk3QTlNbjNidE81R1kvNlBWYVFMSTJl?=
 =?utf-8?B?Z3UwZXZ4YkhWQk4zaFZJV3h5Z2RYV2dJdUkzU3VoQlZQanNyZDFPOXBPUlZG?=
 =?utf-8?B?d0xFRHVhNHprRkI5RjB4K29PVEFteERSb1VUOCt2QU1zN0hCT09CMmJ3ZDFa?=
 =?utf-8?B?SHhzeWR3QWRyV3VXcEZUSEMwd21JeEk5aCtKT0dLU0ZFK0RLVXk5MlhiR0c5?=
 =?utf-8?B?Q245akV6Ri85cmFWbC9pcFM3L0FkdTBDMlJOZUhaZmF1bHRFdlp5TkRNb2Ev?=
 =?utf-8?B?cUl0bzRyVThsVkJXdzB6b3cyWWNnYXBkUnhFV3RPc09WTFFBUmRjajBWdlA0?=
 =?utf-8?B?K3h4Sk9OMEVoRGRTUFQzOCszc0k2bG0rcUtsdkdGa3lxYW9SMm1EcDRCOUpM?=
 =?utf-8?B?K2gvOHhtSHc0bzBHWENXbW4vWTM3WHUxTndWZFMvYmVjYmczUzJkQWRqS3ha?=
 =?utf-8?B?STJtVVNEZkpUbGkwMy9WTUdUWnJRVGpPSWhoOU1aS0o4eXoyYVJJRTlMTUZs?=
 =?utf-8?B?dVdhallZQ1c2Ukt1V2s1OTlSY2dhdFJrS01jSkdBTUV2dzVsWmdocThPRDNk?=
 =?utf-8?B?cjlZZXNpTkJwYm5IM0JaNHJmcXRaU29PcVN5SFRheUhYamxzNU9SMnJUOTVk?=
 =?utf-8?B?djBVWTJuSHd0eTN4RlEzVktaUStVbjhURFlsMkpYaExEQllPUUNCS01YT2RO?=
 =?utf-8?B?QUIyQlVTZkk1ZGxKeW5lcmlvWWhCVEszdkZQUmlnK2pUQlF5Qmo0bzhuSXlE?=
 =?utf-8?B?Z0ZwTGNVWTBTc3l1bjloRHMva0tXMXQ3YkU2bUtsMkRvVUNZUjAyeGFqSUdB?=
 =?utf-8?B?eWRkOWtpL0NOS2tRQmZaUHc2QkszRDVpMEVlSUR4azhqTzZrdUkxZ2NUVFgx?=
 =?utf-8?B?M01OV1lPS05MSG9GWXF3WXI0aVhBPT0=?=
X-Forefront-Antispam-Report: CIP:139.15.153.205; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 13:01:19.2056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e149276d-b391-440b-f6f0-08de54ff5768
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.205];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6889
X-Mailman-Approved-At: Fri, 16 Jan 2026 14:55:55 +0000
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

Hi Daniel,

On 16/01/2026 13:23, Daniel Almeida wrote:
> Hi Dirk, thanks for the review!
> 
>> On 15 Jan 2026, at 14:05, Dirk Behme <dirk.behme@gmail.com> wrote:
>>
>> Hi Daniel,
>>
>> On 14.01.26 23:53, Daniel Almeida wrote:
>>> Replace regs::Register with kernel::register. This allow us to more
>>> succinctly express the register set by introducing the ability to describe
>>> fields and their documentation and to auto-generate the accessors. In
>>> particular, this is very helpful as it does away with a lot of manual masks
>>> and shifts.
>>
>>
>> As mentioned somewhere else already I really like switching to
>> register!(). Thanks!
>>
>> Some coments below:
>>
>>
>>> A future commit will eliminate HI/LO pairs once there is support for 64bit
>>> reads and writes in kernel::register.
>>>
>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>> ---
>>> Note that this patch depends on a rebased version of Joel's patch at [0].
>>>
>>> That version is stale, so I ended up rebasing it locally myself for the
>>> purpose of developing this patch and gathering some reviews on the list. In
>>> other words, the current patch does not apply for the time being, but will
>>> once a v7 for Joel's series is out.
>>>
>>> [0]: https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
>>> ---
>>> drivers/gpu/drm/tyr/driver.rs |  15 ++-
>>> drivers/gpu/drm/tyr/gpu.rs    |  55 ++++----
>>> drivers/gpu/drm/tyr/regs.rs   | 302 ++++++++++++++++++++++++++++++++----------
>>> 3 files changed, 267 insertions(+), 105 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/tyr/driver.rs b/drivers/gpu/drm/tyr/driver.rs
>>> index 0389c558c036..8e06db5320bf 100644
>>> --- a/drivers/gpu/drm/tyr/driver.rs
>>> +++ b/drivers/gpu/drm/tyr/driver.rs
>>> @@ -66,19 +66,20 @@ unsafe impl Send for TyrData {}
>>> unsafe impl Sync for TyrData {}
>>>
>>> fn issue_soft_reset(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result {
>>> -    regs::GPU_CMD.write(dev, iomem, regs::GPU_CMD_SOFT_RESET)?;
>>> +    let io = iomem.access(dev)?;
>>> +
>>> +    regs::GpuCommand::default()
>>> +        .set_command(regs::GPU_CMD_SOFT_RESET)
>>> +        .write(io);
>>>
>>>      // TODO: We cannot poll, as there is no support in Rust currently, so we
>>>      // sleep. Change this when read_poll_timeout() is implemented in Rust.
>>>      kernel::time::delay::fsleep(time::Delta::from_millis(100));
>>>
>>> -    if regs::GPU_IRQ_RAWSTAT.read(dev, iomem)? & regs::GPU_IRQ_RAWSTAT_RESET_COMPLETED == 0 {
>>> +    let rawstat = regs::GpuIrqRawstat::read(io);
>>> +    if !rawstat.reset_completed() {
>>>          dev_err!(dev, "GPU reset failed with errno\n");
>>> -        dev_err!(
>>> -            dev,
>>> -            "GPU_INT_RAWSTAT is {}\n",
>>> -            regs::GPU_IRQ_RAWSTAT.read(dev, iomem)?
>>> -        );
>>> +        dev_err!(dev, "GPU_INT_RAWSTAT is {}\n", u32::from(rawstat));
>>
>>
>> This is pre-existing, but printing `... INT ...` for `...IRQ...`
>> register looks confusing (wrong?).
> 
> Yeah, this needs to change indeed.
> 
>>
>>
>>>          return Err(EIO);
>>>      }
>>> diff --git a/drivers/gpu/drm/tyr/gpu.rs b/drivers/gpu/drm/tyr/gpu.rs
>>> index 6c582910dd5d..7c698fb1e36a 100644
>>> --- a/drivers/gpu/drm/tyr/gpu.rs
>>> +++ b/drivers/gpu/drm/tyr/gpu.rs
>>> @@ -44,34 +44,36 @@ pub(crate) struct GpuInfo {
>>>
>>> impl GpuInfo {
>>>      pub(crate) fn new(dev: &Device<Bound>, iomem: &Devres<IoMem>) -> Result<Self> {
>>> -        let gpu_id = regs::GPU_ID.read(dev, iomem)?;
>>> -        let csf_id = regs::GPU_CSF_ID.read(dev, iomem)?;
>>> -        let gpu_rev = regs::GPU_REVID.read(dev, iomem)?;
>>> -        let core_features = regs::GPU_CORE_FEATURES.read(dev, iomem)?;
>>> -        let l2_features = regs::GPU_L2_FEATURES.read(dev, iomem)?;
>>> -        let tiler_features = regs::GPU_TILER_FEATURES.read(dev, iomem)?;
>>> -        let mem_features = regs::GPU_MEM_FEATURES.read(dev, iomem)?;
>>> -        let mmu_features = regs::GPU_MMU_FEATURES.read(dev, iomem)?;
>>> -        let thread_features = regs::GPU_THREAD_FEATURES.read(dev, iomem)?;
>>> -        let max_threads = regs::GPU_THREAD_MAX_THREADS.read(dev, iomem)?;
>>> -        let thread_max_workgroup_size = regs::GPU_THREAD_MAX_WORKGROUP_SIZE.read(dev, iomem)?;
>>> -        let thread_max_barrier_size = regs::GPU_THREAD_MAX_BARRIER_SIZE.read(dev, iomem)?;
>>> -        let coherency_features = regs::GPU_COHERENCY_FEATURES.read(dev, iomem)?;
>>> -
>>> -        let texture_features = regs::GPU_TEXTURE_FEATURES0.read(dev, iomem)?;
>>> -
>>> -        let as_present = regs::GPU_AS_PRESENT.read(dev, iomem)?;
>>> -
>>> -        let shader_present = u64::from(regs::GPU_SHADER_PRESENT_LO.read(dev, iomem)?);
>>> +        let io = (*iomem).access(dev)?;
>>> +
>>> +        let gpu_id = regs::GpuId::read(io).into();
>>> +        let csf_id = regs::CsfId::read(io).into();
>>> +        let gpu_rev = regs::RevIdr::read(io).into();
>>> +        let core_features = regs::CoreFeatures::read(io).into();
>>> +        let l2_features = regs::L2Features::read(io).into();
>>> +        let tiler_features = regs::TilerFeatures::read(io).into();
>>> +        let mem_features = regs::MemFeatures::read(io).into();
>>> +        let mmu_features = regs::MmuFeatures::read(io).into();
>>> +        let thread_features = regs::ThreadFeatures::read(io).into();
>>> +        let max_threads = regs::ThreadMaxThreads::read(io).into();
>>> +        let thread_max_workgroup_size = regs::ThreadMaxWorkgroupSize::read(io).into();
>>> +        let thread_max_barrier_size = regs::ThreadMaxBarrierSize::read(io).into();
>>> +        let coherency_features = regs::CoherencyFeatures::read(io).into();
>>
>>
>> Is there any reason why you replace the UPPERCASE register names with
>> CamelCase ones?
>>
>> I was under the impression that we want to use UPPERCASE for register
>> names. Like in nova
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/nova-core/regs.rs
> 
> Not really. UPPERCASE for non-const items will trigger the linter. The Nova
> people chose to #[allow] this to align with OpenRM and, IIRC from the LPC
> discussions, their registers are automatically generated from some internal
> docs.
> 
> We have only a few, we can simply convert them to CamelCase.


I'm under the impression that we define the "future RFL register!() 
style standard" here.

So we want to make the CamelCase the default? And nova is the exception?

I'm fine with that. Just want to make sure we talked about it :)


....
>>> pub(crate) const MCU_CONTROL_ENABLE: u32 = 1;
>>> pub(crate) const MCU_CONTROL_AUTO: u32 = 2;
>>> pub(crate) const MCU_CONTROL_DISABLE: u32 = 0;
>>>
>>> -pub(crate) const MCU_STATUS: Register<0x704> = Register;
>>> +register!(McuControl @ 0x700, "Controls the execution state of the MCU subsystem" {
>>> +    1:0     req as u32, "Request state change";
>>> +});
>>
>>
>> Any reason why req is a u32 and not a u8? Same for some other places.
> 
> 
> I tend to default to u32/i32 in general, as that’s usually the native machine integer type.
> 
> All we get from smaller types is a spam of `into()`, `from()` and their `try_`
> equivalents. When stored in a struct, they usually do not save space due to
> padding that is usually inserted to fix the alignment for the type. IMHO not
> worth it unless it really matters. Correct me if I'm wrong, but it doesn't seem
> to be the case here.


Wouldn't using u8 prevent any accidental access to 31:8 ?


Best regards

Dirk
