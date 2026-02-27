Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLrMLukboWlhqQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:22:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BD01B29FE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 05:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A7410E0EF;
	Fri, 27 Feb 2026 04:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BTMsUIep";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E928810E0EF;
 Fri, 27 Feb 2026 04:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RlJvUSr0lnY3BTZFXJiLWwi4dOnRVRsHIjFwR6QBFG+HnuhzqB4hKbHWhGp0ycmT4PNhp4Prj2/h7EGoOV8R24hqRVpqD4bO1f7HiD28Ipk8lkm4AdRgtgqv1jzZOWCMFk5IVJ20z8g38JSKqsyTGWghFDUp8sSaFGWzmHKoKnA7ISvJrdwwUAwOt9RYLLS3fjIxCeR6OnxksaXTmsMEj7emjyPiZhxfO1SXw9UlXY4Fv4hZJ4FShfleFoSmqA0ExLFw9H6BFaoB6C5kuqGV0G9sB7/opRPc+0hSgOlJXvzvZV7MX3qoT6Ira+ZFSuWivDEqtAlF+voYDuoIsR06Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UTHlRbCGIe0bHw0SkCMHtsNGeNo6gORkt+nbgjm9U1w=;
 b=GO5gSVBQxwO1XYZIkK7CmXIhjOzg8/rzn/lZHGPfj55YJsVBkR856q1COG4szEh7Hx3v7ZXug2IOyEkHXitdLQKqxKqxhocwhb+cYTsGkJl7QaCEpfBadkSuMByWJC51oCQrDfxMg7VHRmEq/7qLKAQqm4i4k4X/rOV6essWQZ1S8a5UZD4AJqVFhbHciTlVDRyF7HGxV14JYYHoW/h05NsG9yaCd0BWCbLsm6tfolJlBWXBb7Hy5xTPVq93+QqLGy9JcWYaD3WXwa75wm6EN47vbtfFCZkVtLOPiV50O1RuFl9xA5zjyQXBPkc4avMHqOog3rDcSR7qQGaWchwedw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTHlRbCGIe0bHw0SkCMHtsNGeNo6gORkt+nbgjm9U1w=;
 b=BTMsUIepVWM7PjccTvMml+S7OWKeZBp5QLeiQZglDHJjvslq7y1Zoai65DkIuE2WPRcB3smwVSKa7x6mgAd1qDgPCdYByez9TpVPUkL59wGM16HeHGj3/uTbpJ3ihmVTCG/MUx/myTcKnhlmbglAXgQe0sUVSNg6PzqjbAbShWZNqiEpESak8be6ZamPIwLfoGrIbAjBWPIOtVxeRvi1l5m34dEqv8s9dgFGOf5xZPXYJO9RqEwweuaVIfcDUXohcFkjf8SxYQSa1ol1XTTrU/6q4A+NGNO2/6LfuRcoDdk4DZb6HaMAoGSH8+huZ9dLEsF124X2rIK3z3eu4i4HWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB999071.namprd12.prod.outlook.com (2603:10b6:408:352::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Fri, 27 Feb
 2026 04:21:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 04:21:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 13:21:47 +0900
Message-Id: <DGPGGETG9TC7.3Q8C1WFZAD8I0@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 9/9] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-9-238520ad8799@nvidia.com>
 <DGMU80KDI2NP.14EXST8YEO2YU@nvidia.com>
In-Reply-To: <DGMU80KDI2NP.14EXST8YEO2YU@nvidia.com>
X-ClientProxiedBy: TY4P301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2be::19) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB999071:EE_
X-MS-Office365-Filtering-Correlation-Id: a0584eec-0851-4d66-1697-08de75b7bb61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: PEtyOgMDO41cEC1lJKY1VuY4G/sS1MzNzXOu3/kerZR3gdcDKD8seCszR1qJ5huENF6+UDOGjEpGZbU9FbZysQrlL/LLGY2Oht/Q+4R2HI+ukDoNnUEjuqObuHTrHYugRzWKMCQkUbXB8o9/3EnRcqKTosqbr47BBxcoi998O++061icvsi4UGr9pMvk4qlHL9eDtnsz9SFUgsTPwSF8tTthmP0BzRXlqCVcv+OpgTPMGz3J4OA4NlTm2B5fKcMh+NZI6RUeqEs1VcKxyeUq0oQXjEnvcfM/8twxUXSaPsQQIEjQ738os+JTKVugDcZQJSKxQ7dco4fWKb8SNySRla4oIS9+w7MNVgfLiDk52S6nsjaY+TaRk3HqKjpr4YfZDNoYVxtj2adXofECoFZ4CTY6hzjO4zQvZdBC+88Pt/A0fyuT+pS+ophqyi/mQbs7qUkO58gJ6F0hHajtD34AmPzXcwhruchBCzkUADPQl7NORYecohi6/3Y/tkCLbffLRDuW4VkOXTysZRvcDRhm/vp9q18MU36gLE28Km6WhFFounoAWP+Ojjq7ERCs8bOFyYHfbj1PkDVv2uIihHIqyxtemHtoP7WYF2v2yTklXPSx9BYnqJbyTPszvp3PRZZIi8f7uB4DhlVCj3y3DGeP9RPkFr2RT9rhgIL+FCZ4iAMjRFxysiiKsbm2PdixjcGb1CfgDmaj/Mhro0OFU/YFSOik8WAaKbJpjMJJMuukUks=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2paOEVpMXNDK0o3NDgvMHY4b2Qrd2trK3VGYzMycUxrK3g4ZTlVK2RwNnl3?=
 =?utf-8?B?clVSdkZLQlJMWWN4dVppVEF6blgwREgvYmtZeWlDTlQ1MHRveS9NOU92TzhT?=
 =?utf-8?B?dVFEMkZUa2NCdHM1c0pnNStjL0p6RGVlK1l0OGEwL0hWbXpVSjZOWG9FWWZZ?=
 =?utf-8?B?ZXMvalkrUjFET09lWk9BajZMNW5JUEE4RFBQN3Rvc3ZyZmNPd1JrSmI4UzJr?=
 =?utf-8?B?RzZsZVZXb00wMm5WOWR5N2NHeVZnNWI3aCt2b3ZwNWo5bGdUaFZzLzVsVnZ1?=
 =?utf-8?B?WmljWFBFbUEzajk1ZWtnbFlBRmIxTmZ3UUZLTzB5MGhqaXVVMXdHNWdxVjFH?=
 =?utf-8?B?QVpaYVpKOWRtU29sYTgwUVAyeEVrTjE4UlA5R0Exb0RtQ3FONWthWjd1dEZG?=
 =?utf-8?B?L2lPN2VTTi9KaXR6ZVRDQ2lNZ0kxVThTZ3NNSmRKSzRzWkp2U2tLaDZ4dlhz?=
 =?utf-8?B?Rkh2YVFndUhkdEZsWlNCQUtFdkhERUMrQ0hDaWhJMjJRZXA5UFRMbW81VUg0?=
 =?utf-8?B?Yko2dzJuUTE4c3hBU1ppeU5RMGFUREZkUUdTTTEyQmZPNzhEOGQ4RWpDbzNM?=
 =?utf-8?B?V015cG9aWVNXYUFaMjEzLzAyc1VGdTlKODBZd2V3NFpPeDgzOE9ucW52TUhX?=
 =?utf-8?B?d0drR2dsWkFRVDlHN0JxYmJQSytlaUF6SEM2VC9WUSthSTlTc2dBWEh3bi9Q?=
 =?utf-8?B?VEkyc2dlQ0JoMDZWRE8yeEpwY1dWQzZxL1liZnVFeXN5V1RZSWFXOEZhSnpD?=
 =?utf-8?B?VjdjM2cyYWZDdHB1cVpUaElDdkh3L3RQZURKY3o4ODhBTFc5QkhuZmUrT05F?=
 =?utf-8?B?NGlRZzRjOVkvaVZpZU9lelBkTVhwaUQ1N1QwaXpyajVPMmZzMkxkVXNHUENY?=
 =?utf-8?B?NmFLRGFxODZnSlJ4WHFBOWk5WHlUZysxTjFkWmtTTEQxQnZVTS90cDlRME5p?=
 =?utf-8?B?Z0lNZGtnYUwwTkpuUHl2UnNzMHprUmNVdXhrZVh6cXU4L3AwTGF1TDc0aFV3?=
 =?utf-8?B?R0pueng0ZnZuWlN5SkZaTGhuaExadkgrYUZlUjllajY2Z3VMcGF5L0FsNDI4?=
 =?utf-8?B?RldGTHF1VzJKc2ZySHNHVUNLWmF2N0s1YURaSEVYeGFQenBCcm5yKzNoS2Zk?=
 =?utf-8?B?c3V5dXBGMkZkSnJZN1hmTnExdWxMaHk2ZDhlN1VtNGpGbFk2UXU0S2xuSkZq?=
 =?utf-8?B?S2hXT0JZNWcxS2Q0WWxSbk4yRm9qNVp0TFM0QnlLYklzZTZ1RFA1bUx3akdx?=
 =?utf-8?B?UkZIVTg0NTNKREZwWlpYdDhVTHdDekhHNENENVdDbnR1c0thYklNMUJKVVBM?=
 =?utf-8?B?eEU5Zjl2b0pTeTlPVVdpUHM4ODBlTVpCVXRUdFpWWVNoMU1KREtuMndockZ0?=
 =?utf-8?B?NFJtZlViKzhlMlhYR1ViZkI0dFY2b2ZObXo0UkQ4cmlsSFA0OUU1cE93MjZZ?=
 =?utf-8?B?S3pUb0JUaU5FM0liQTExSzkxMmdUUnMrUklyVnpyL2JiNnZIWFRCR1oyc251?=
 =?utf-8?B?L3oyZUdaeU1iRUVlMm13cjNFZW1VNzVRY0tPRDlGRU03NmZxSjZCUk1SS0Zr?=
 =?utf-8?B?eXBOd1UrMWxJcC9xQ1FudFVQUzNLQ2NTdUF6aHUvQlFXcng3RjM0RDFhMmZO?=
 =?utf-8?B?RUJJa1E3UC9YNVlhL1ZDMHU3RGJ3NDRlRUJVMEJYbGUwcEF0Q0U2UHVjekdG?=
 =?utf-8?B?RzBHZHVpcjNuMEwzK0lWZldXZXJ5ZzRVaUFqeEdFaUR0UHQrNkxocjdPQWlP?=
 =?utf-8?B?bHh4VmtWSkxVTE5YblJscEJpY0hyQVFWUDBFaUFmNFkzOUhsQ1Q2WndiYWx2?=
 =?utf-8?B?QWswamNwN1lnbTFUQ292V29aVExscVZ5cW1LYU55QjZPczN4aGpxRW5rUElz?=
 =?utf-8?B?SGlPRkt6b1FpdG50dldzVzNaVTIwcmNjNFRQZEIwb1pnNzU0UzJrK3ZtcFo1?=
 =?utf-8?B?NGt3OVR0MlFtckFDekJiVDFoM1UyVTZyeis5NXN2K25pY1BuZ3NTTGxpTDdF?=
 =?utf-8?B?VkhrdWJOK2p3S0wrSExhTlZ5a3l1b3IvODNxSnJzK3BSaHNmNTh6ZlhHVU9n?=
 =?utf-8?B?RXgvcExGOCtzd1JLaENwT29wWGhubEdYV1Fnc0orYWs0Z0FZejFVRjY2OWg3?=
 =?utf-8?B?RGI1dzdnYjFsWGw0MTE3SXcwNmhUem1RL0xGaERDV1dpSXBpNW94YkxyYVF1?=
 =?utf-8?B?eTVjVE9oeHdkMGFBTUQ1S21LSURQdmcwMXUrYk5oMFJIc2xxcFVlWUVUV0Zs?=
 =?utf-8?B?dVNrRDVkVk53QlpESHJMRXRvNHlCRHRnRUhTeHdTUDhPTlNVUk1za2U4TnZU?=
 =?utf-8?B?cnZhaWRmeXRvMjZnRHBiVHVFZGhRNUMrYzhzOExGbWhlMGJTeUJnNHNRZVlv?=
 =?utf-8?Q?L9byAUO/N8QwN98Sub+zqfup2ic0LPeHNquUBeA9OHyZd?=
X-MS-Exchange-AntiSpam-MessageData-1: Pbn5Q1qtNXNUKQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0584eec-0851-4d66-1697-08de75b7bb61
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:21:52.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IMnuHzL2RgeKRocDjRP8kfC9SXnSCY8Ub7036Bv1PL9rugVkJw8S1i2SKFwxEk9mZ7bvVektnH0Y2iTCN02yLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999071
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 16BD01B29FE
X-Rspamd-Action: no action

On Tue Feb 24, 2026 at 11:31 AM JST, Eliot Courtney wrote:
> On Thu Feb 12, 2026 at 5:26 PM JST, Alexandre Courbot wrote:
>> +        let dmem_desc =3D {
>> +            let imem_sec =3D FalconDmaLoadable::imem_sec_load_params(&f=
irmware);
>> +            let imem_ns =3D FalconDmaLoadable::imem_ns_load_params(&fir=
mware).ok_or(EINVAL)?;
>> +            let dmem =3D FalconDmaLoadable::dmem_load_params(&firmware)=
;
>> +
>> +            BootloaderDmemDescV2 {
>> +                reserved: [0; 4],
>> +                signature: [0; 4],
>> +                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
>> +                code_dma_base: firmware.dma_handle(),
>> +                non_sec_code_off: imem_ns.dst_start,
>> +                non_sec_code_size: imem_ns.len,
>> +                sec_code_off: imem_sec.dst_start,
>> +                sec_code_size: imem_sec.len,
>> +                code_entry_point: 0,
>> +                data_dma_base: firmware.dma_handle() + u64::from(dmem.s=
rc_start),
>> +                data_size: dmem.len,
>> +                argc: 0,
>> +                argv: 0,
>> +            }
>> +        };
>> +
>> +        // The bootloader's code must be loaded in the area right below=
 the first 64K of IMEM.
>> +        const BOOTLOADER_LOAD_CEILING: u32 =3D num::usize_into_u32::<{ =
sizes::SZ_64K }>();
>> +        let imem_dst_start =3D BOOTLOADER_LOAD_CEILING
>> +            .checked_sub(desc.code_size)
>> +            .ok_or(EOVERFLOW)?;
>
> Are there any alignment requirements for `imem_dst_start`? Or maybe
> `code_size` is always such that the alignment will be fine?

Looking at OpenRM, there are indeed! I will integrate them into the next
revision. Thanks for pointing this out.
