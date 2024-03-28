Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1788F63D
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 05:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187C310EBD2;
	Thu, 28 Mar 2024 04:18:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TtGLV67C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE2C10EBD2;
 Thu, 28 Mar 2024 04:18:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMq/aHwZQnjDA1QmoDn00R8SW2uDPRut/5G4WLTMy3XYdTRjj7ZTGsJjLDMHOzi8B+1ypl+cL7gm00LBhXK8xQk8Dv+p9RO+V/mpd2L3Vip9hf7glBrIBRmzPiYmT32YU8hK2l+tqv8Cwocn2BICdjVBR1q81mfC/KIKfTsPuneoKR96f1lycehw/YUe92nO2t/Mz8KTeO4AzwJOpqvj8zmVNCkmRwSKADA4rB+W2lpMK+7KdPmY32ZLKYp1FY86oOlvtJBNGGNSAoG4x/ATmJNJjk07w+nsrnpD0lKBe5s76nLt1R83qPHyHOzF9wnnWgXPBeCGzemUP9Qfr0G0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRyp0gvdjPJzFOP2ppgNmmenCRv/rv5wKT0Wc8Ld0YY=;
 b=lCPptV8VfFHIPCNqH6Ss2s9WjFGfGgsl0exx97AM67nZacpJmF9eYqbJJBVDVE9UEOWBoT5CXJ0gnO4evRZOOzF0JdMpfDcl/A6PpvaPyThu0G8MfVBT3l0HjQSvU9/WkHpRGueLirIWUj0PCiD90UDzFFbvttKEl5ZRq05LOsE++Rp8u8V/DpxHpIXxsrLOzuRgwrrXGzZDCdmzzi1bE3+8BYqR0RJoWP85/AXXov2wU71GD7KtRfb5dZH7G3JAFhFGGpKbCBUf+n39hVVLUJ0hs+1lp+D3h9xFYYvGUwVFtoesK9ePK6Q2t0tCeJBgDQZK0fXfXKVn3nX/i2G+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRyp0gvdjPJzFOP2ppgNmmenCRv/rv5wKT0Wc8Ld0YY=;
 b=TtGLV67C81NjPBzXUvWQKjjT4irQ2a7gKLBSNDT2vylZg/smL7SE1khI0hb4s3XE5e+xdAQSYDtEzxlKAUO59oSXbLZiFcLsgdBxwp6NsNme6KIxIi6/awRIWxt9dC2RlEhE3YYkFZKSzZ+NZjYuQPRTKEoU3gP451VIanThtww=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by MN0PR12MB5882.namprd12.prod.outlook.com (2603:10b6:208:37a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 04:18:28 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7409.028; Thu, 28 Mar 2024
 04:18:27 +0000
Message-ID: <c41d7f3c-c717-43b7-86e5-c74532e4a2ec@amd.com>
Date: Thu, 28 Mar 2024 09:48:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add IP's FW information to devcoredump
Content-Language: en-US
To: Alex Deucher <alexdeucher@gmail.com>, Sunil Khatri <sunil.khatri@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Lijo Lazar <lijo.lazar@amd.com>
References: <20240326173142.2324624-1-sunil.khatri@amd.com>
 <CADnq5_ONivR7io0w6vkHsQSSMnNCRJU=XdDD6D6SQZ8t9o3FAA@mail.gmail.com>
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <CADnq5_ONivR7io0w6vkHsQSSMnNCRJU=XdDD6D6SQZ8t9o3FAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::14) To PH7PR12MB5596.namprd12.prod.outlook.com
 (2603:10b6:510:136::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5596:EE_|MN0PR12MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba2729e-52ff-4601-8fed-08dc4ede1e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ilsKgfERnK0GyO7MOOm5wmU5sgEKnIRNcb5xoGkXhpRs6bzlOGQYFUhNs90D9Zrp9CDMoiOSqhr33LQ/u4rygDyg4kLFJbsiutVwCiCGBK8jk9yI3eq1awxqMvnqj4wC8Z2ftgRHB8Gt1TGraN4ByJMd+4d4yBPRYaERMQO0mOPEBLlj7aACONJrocvPiQXkEjRwb/4slchIi4FWWG2yUOmnAJ+Uls+EW+FJFVLhqzDHkiRkQkORuoaflRmVqQq6l+WDbMVUNBtlcoCFkq+4X5FVBjc1idZ6a/IXO3gxOVbsbHo+PrJymEK8eSc6Xd9xpNYELX6NWhzLupxHJ+AfjC3Fd5ugFhycqREow9ufBgT/XqbKs7qgAHWCN54fhHH3HDSG+EZnFatlEUdCMBIj9bxBlNDcwgiPAMaMFPPSNcjbg2UN8jPZ+tyKwgsGRg2zJWKtcPqjg4r/djEoW4A1JAXrK3dSNJeBG95biHAfhKbg4Ecbdqo11QMfQdAa/+5vadNq1o9jDvA6dbXhLEBW3npbNyBanIXWl+f2B861l+nnVufTJqAdWPhCysxfIbAgGhxbYm+qtsKqPHEPrvOA/XtemQAl32oi/Odto9PBO8m/iV2pqzRSWcSyALn9GJEHyCWFJzNQW2lGnZJrQP2sSnjPF90Bj7juHIPIFkyyRL4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXB5dDFkQ0RHV2JsS1l1Vk41b1NoKzllbVBYN0J6ZHA5MDZlaFFOc0hGTWlp?=
 =?utf-8?B?c2NBSzg4NUhPVmRxYzlMTzNlRnc0Y2h4dHljL2R0YnJWcUQ2dGtqYWFianVq?=
 =?utf-8?B?MXNUd3pudEsvUUhEd2UyamRZRjROdXNLem42bzF2bTBaMkVKVmJ4MURENVhU?=
 =?utf-8?B?QUpzaUliMU82K201VllHT2dnSVB1dkdnbC9PQ05kQjZOZy80aktmWTdBdEtE?=
 =?utf-8?B?UHlmaXZnNEZZRTJGbFZMSTE4RGN4b3VXUmZ2OVREaSs4SXJNTFozMmZodVJj?=
 =?utf-8?B?aXpoTFVJNnlSZERGbWlLLzhSR1RCWVhFUEpIMG9ta1ZHNWg4VVNuSEREK21F?=
 =?utf-8?B?ejdQUUk4RGN1WWJpL1hzRzNGSzB5SkdXcmNlTVFhZ2Z0TlpINVZqUXMzMFVa?=
 =?utf-8?B?K0lGZDVTbUlBSDFNSFhvaVE5d21sTGJqRTl2Z0ZwVFhrNTU0cE5yWldWYkUx?=
 =?utf-8?B?Sll0V3Y5S2Z6dWVhZ01YZkxqb0g4Wjh3V1pjYWNZQ3R4UTVGeDRGcDZUbkpr?=
 =?utf-8?B?S28yb0lIMm1pQ2RCNUx4Y2FBVzY4em0zekducWxPTEt3ZHhmd1htN09yWUZE?=
 =?utf-8?B?WmNPSWp3S0l6ci9BYXk1S1d5eDZ1amU0TTdBUmRGbzhsVnNQU2NIeFU0UDd6?=
 =?utf-8?B?Y2ZUbHlsVURDZ3JLb1R6eCtmRlRUTkd6RWZWcUtvK3FyTmNFcUUzSWlCb043?=
 =?utf-8?B?ZTZ3M0lyNDJoMDZLQWlydWwva0FkOTJZa2wzeWlVSUtmcE5mN2JuSzJaU1Bu?=
 =?utf-8?B?b01XR1N0MTROK0dpTmhxK1U4MHNhTUh0NEFTQXJOeFlqOUNxS2ZISTh0Zm9v?=
 =?utf-8?B?NVBneUFxQVc5amh5MFpIWjRWcFA0SmpsUU5GMDVNSktOZmZ0R1ZabUlJWGJV?=
 =?utf-8?B?YThDWTY4c3Noc0drSVFVRVhrek5RV0NPMTh2VEJmMkxCcnYxQVArL0FIR2lH?=
 =?utf-8?B?azdwaVROVUZOM29MS3VQUkhtYXk5Q2x5ZFpCYk4ramc4b1NQMTZsSVRmOW9W?=
 =?utf-8?B?TlBVTXVTS2FVRVBZZndMd0t4NGpJYjlZMFh6U1BMRWdaejhTZmJGMENZdVVh?=
 =?utf-8?B?YzAxTTEvYU1KQlpXSUtSY3ZmcCtRKzA2bGQ1eDI1RE5Ia0FwNytPaFBYdUNs?=
 =?utf-8?B?RXArVUJueVI0TVZsV0ZkLy9LUWFTN0xhMGRWemVlalBLcENLOGZyVlh0SkEy?=
 =?utf-8?B?RkhCNVZhV0tEVXgyY29VbVpiejRWb0pzc1A3T0NaeE9NWUoxNWtPK0o1V2gr?=
 =?utf-8?B?aXRDcVIrSHlxNTNySXNjMjRZZUdTcDVSNG11M2lCL1FaQWZEOWRYRUNCMEM2?=
 =?utf-8?B?YmpVK2hLR0tvVlRXWFBORHZpQVNpZkQ0anIyaFYzTXQxSXo3WFhrSC94bkU3?=
 =?utf-8?B?SnovR0taa0xCcmVlNGp4WW9qdmk5NHUyWXBLRWVrblllT1BCSlZIN00xcWJZ?=
 =?utf-8?B?emRuTzc1bGFBTDFHWG9BQS9sOStzVVhkWTBEMEhES25KOC8wT1Y1OGF2a3NI?=
 =?utf-8?B?ZXlUTEh4Y2RqQkFnalBLWkhOQkxHV3hNR0JxUUNVZ1dYQ2Zia3o3UEcxSjBu?=
 =?utf-8?B?T0ExdmRHWHdIOTR1M3BwRXN0OFIyTW5EQkFCZWxUS3hkKy9KWlcvaDdGM0Zo?=
 =?utf-8?B?azliRm80MzNPNTFCQklwaStBRXlxcmZSek9HLytQa1gvNnRIZXpUK2xqdlZN?=
 =?utf-8?B?QWVkK2JoaksvcjNsdHhJVExMbFJnUkVVTzlhRFNDY3dIUnRMM1FOUkdjRkl4?=
 =?utf-8?B?c0pjSWJXTjZkeUk3cEh4Qld2Sm4zUnBqYmg5dFZoa09RQStHR0VrWEQrV21w?=
 =?utf-8?B?SklEc0JadVBqZkFjcVA2cXNUU2V5cC9ZOTdlVHJwV0VEd0d5Sy9nR1dXVDdu?=
 =?utf-8?B?U1NZeWk0OXJwWFlJQzhUU1J0SlRWR0RsNHRNTGdCdytkazFpWFhTSWVISlJN?=
 =?utf-8?B?RHIvTUl0NnRMYy9wdjZOdU1veHNGam1wQTFpVDBtdEQ1RjFLWTR1bno1N05H?=
 =?utf-8?B?L3VTNUI2bCtLSDlGUVI5cHpnUWE2cGI2OFNvbXU1WEVZK2pMV3dXZDJ1Yk1i?=
 =?utf-8?B?eFlRZW03TjB6eTR6S09XQ21TRUVNWTB1dTArcEQrbmhtTndNRm55K0pIcTRn?=
 =?utf-8?Q?qxJpWLlPhNoyiZlcWQdB8vAFm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba2729e-52ff-4601-8fed-08dc4ede1e18
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 04:18:27.7751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Mp4I7Hu9PEaaTxftXxBvSSkvSPvoFRAnPcQJZnvNURY52TD2fwRxmrUWR1Ik1fBI74i9o/RjxZcLPiya5zoKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5882
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


On 3/28/2024 8:38 AM, Alex Deucher wrote:
> On Tue, Mar 26, 2024 at 1:31 PM Sunil Khatri <sunil.khatri@amd.com> wrote:
>> Add FW information of all the IP's in the devcoredump.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> Might want to include the vbios version info as well, e.g.,
> atom_context->name
> atom_context->vbios_pn
> atom_context->vbios_ver_str
> atom_context->date

Sure i will add those parameters too.

Regards

Sunil

> Either way,
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
>> ---
>>   .../gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c  | 122 ++++++++++++++++++
>>   1 file changed, 122 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> index 44c5da8aa9ce..d598b6520ec9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dev_coredump.c
>> @@ -69,6 +69,124 @@ const char *hw_ip_names[MAX_HWIP] = {
>>          [PCIE_HWIP]             = "PCIE",
>>   };
>>
>> +static void amdgpu_devcoredump_fw_info(struct amdgpu_device *adev,
>> +                                      struct drm_printer *p)
>> +{
>> +       uint32_t version;
>> +       uint32_t feature;
>> +       uint8_t smu_program, smu_major, smu_minor, smu_debug;
>> +
>> +       drm_printf(p, "VCE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->vce.fb_version, adev->vce.fw_version);
>> +       drm_printf(p, "UVD feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->uvd.fw_version);
>> +       drm_printf(p, "GMC feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->gmc.fw_version);
>> +       drm_printf(p, "ME feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.me_feature_version, adev->gfx.me_fw_version);
>> +       drm_printf(p, "PFP feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.pfp_feature_version, adev->gfx.pfp_fw_version);
>> +       drm_printf(p, "CE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.ce_feature_version, adev->gfx.ce_fw_version);
>> +       drm_printf(p, "RLC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_feature_version, adev->gfx.rlc_fw_version);
>> +
>> +       drm_printf(p, "RLC SRLC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srlc_feature_version,
>> +                  adev->gfx.rlc_srlc_fw_version);
>> +       drm_printf(p, "RLC SRLG feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srlg_feature_version,
>> +                  adev->gfx.rlc_srlg_fw_version);
>> +       drm_printf(p, "RLC SRLS feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlc_srls_feature_version,
>> +                  adev->gfx.rlc_srls_fw_version);
>> +       drm_printf(p, "RLCP feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlcp_ucode_feature_version,
>> +                  adev->gfx.rlcp_ucode_version);
>> +       drm_printf(p, "RLCV feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.rlcv_ucode_feature_version,
>> +                  adev->gfx.rlcv_ucode_version);
>> +       drm_printf(p, "MEC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->gfx.mec_feature_version, adev->gfx.mec_fw_version);
>> +
>> +       if (adev->gfx.mec2_fw)
>> +               drm_printf(p, "MEC2 feature version: %u, fw version: 0x%08x\n",
>> +                          adev->gfx.mec2_feature_version,
>> +                          adev->gfx.mec2_fw_version);
>> +
>> +       drm_printf(p, "IMU feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->gfx.imu_fw_version);
>> +       drm_printf(p, "PSP SOS feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.sos.feature_version, adev->psp.sos.fw_version);
>> +       drm_printf(p, "PSP ASD feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.asd_context.bin_desc.feature_version,
>> +                  adev->psp.asd_context.bin_desc.fw_version);
>> +
>> +       drm_printf(p, "TA XGMI feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.xgmi_context.context.bin_desc.feature_version,
>> +                  adev->psp.xgmi_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA RAS feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.ras_context.context.bin_desc.feature_version,
>> +                  adev->psp.ras_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA HDCP feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.hdcp_context.context.bin_desc.feature_version,
>> +                  adev->psp.hdcp_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA DTM feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.dtm_context.context.bin_desc.feature_version,
>> +                  adev->psp.dtm_context.context.bin_desc.fw_version);
>> +       drm_printf(p, "TA RAP feature version: 0x%08x, fw version: 0x%08x\n",
>> +                  adev->psp.rap_context.context.bin_desc.feature_version,
>> +                  adev->psp.rap_context.context.bin_desc.fw_version);
>> +       drm_printf(
>> +               p,
>> +               "TA SECURE DISPLAY feature version: 0x%08x, fw version: 0x%08x\n",
>> +               adev->psp.securedisplay_context.context.bin_desc.feature_version,
>> +               adev->psp.securedisplay_context.context.bin_desc.fw_version);
>> +
>> +       /* SMC firmware */
>> +       version = adev->pm.fw_version;
>> +
>> +       smu_program = (version >> 24) & 0xff;
>> +       smu_major = (version >> 16) & 0xff;
>> +       smu_minor = (version >> 8) & 0xff;
>> +       smu_debug = (version >> 0) & 0xff;
>> +       drm_printf(p,
>> +                  "SMC feature version: %u, program: %d, fw version: 0x%08x (%d.%d.%d)\n",
>> +                  0, smu_program, version, smu_major, smu_minor, smu_debug);
>> +
>> +       /* SDMA firmware */
>> +       for (int i = 0; i < adev->sdma.num_instances; i++) {
>> +               drm_printf(p,
>> +                          "SDMA%d feature version: %u, firmware version: 0x%08x\n",
>> +                          i, adev->sdma.instance[i].feature_version,
>> +                          adev->sdma.instance[i].fw_version);
>> +       }
>> +
>> +       drm_printf(p, "VCN feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->vcn.fw_version);
>> +       drm_printf(p, "DMCU feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->dm.dmcu_fw_version);
>> +       drm_printf(p, "DMCUB feature version: %u, fw version: 0x%08x\n", 0,
>> +                  adev->dm.dmcub_fw_version);
>> +       drm_printf(p, "PSP TOC feature version: %u, fw version: 0x%08x\n",
>> +                  adev->psp.toc.feature_version, adev->psp.toc.fw_version);
>> +
>> +       version = adev->mes.kiq_version & AMDGPU_MES_VERSION_MASK;
>> +       feature = (adev->mes.kiq_version & AMDGPU_MES_FEAT_VERSION_MASK) >>
>> +                 AMDGPU_MES_FEAT_VERSION_SHIFT;
>> +       drm_printf(p, "MES_KIQ feature version: %u, fw version: 0x%08x\n",
>> +                  feature, version);
>> +
>> +       version = adev->mes.sched_version & AMDGPU_MES_VERSION_MASK;
>> +       feature = (adev->mes.sched_version & AMDGPU_MES_FEAT_VERSION_MASK) >>
>> +                 AMDGPU_MES_FEAT_VERSION_SHIFT;
>> +       drm_printf(p, "MES feature version: %u, fw version: 0x%08x\n", feature,
>> +                  version);
>> +
>> +       drm_printf(p, "VPE feature version: %u, fw version: 0x%08x\n",
>> +                  adev->vpe.feature_version, adev->vpe.fw_version);
>> +}
>> +
>>   static ssize_t
>>   amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                          void *data, size_t datalen)
>> @@ -118,6 +236,10 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, size_t count,
>>                  }
>>          }
>>
>> +       /* IP firmware information */
>> +       drm_printf(&p, "\nIP Firmwares\n");
>> +       amdgpu_devcoredump_fw_info(coredump->adev, &p);
>> +
>>          if (coredump->ring) {
>>                  drm_printf(&p, "\nRing timed out details\n");
>>                  drm_printf(&p, "IP Type: %d Ring Name: %s\n",
>> --
>> 2.34.1
>>
