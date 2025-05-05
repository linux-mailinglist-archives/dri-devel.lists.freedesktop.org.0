Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA19AA9770
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 17:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4239E10E0D3;
	Mon,  5 May 2025 15:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WLWUFqpv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179AB10E0D3;
 Mon,  5 May 2025 15:25:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DjwOYPlcFyRHKFO49Bgsmx03jL3gqrRhUolXXguISxmwf5nw4lmBH6ih1VNH2HivTf4OgsoU8WpPHZ/jwYTSH016yVSLQcbx4Ij1u6b5yC8PTMq0LBIzTDaAD2VCvC3ewXivaQuPt/a/JP0uV0JIvXNaJzE0Lu6z9PvTq1JSR8z2VdEAy9VuGdIEkBsnZqqOs83nukzHRbIdleeIDoAhuy3y5mzVMIM29Jjku1Lfa71wa/WtlVIVs2bIyHUixPDt00pKREh0JCFi0q7Xrp8c9jLugNzXscf3UAyzDdqzTLLTLuFMLGbDwEcSsHNik8cWdscmN+j7r90cg0kxwrChbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4uyUFZAfHy/2u7tNlEh3d2HCnEnYNa71lFBCJgYKMs=;
 b=GPW6U/vvmFNZwQTOY0ErNNo+KAWEn7cnhKdX8xDY7l8hetylJDQwiaOZiPi80oJOb/mj+1HlvU6vp+c9K8P/7Qh0ETrFmiUulx78mn7khQHJURG35I8hg56lyZ/GuMwCtk3CTzMLA4J5pBXKLPuPSEQcXkKPdh4HjV72tP99gp5CKABlbkv+wzkmZ7HqF8FEvh2MaCF7M991ek4cTYg84+bjCZEIYUkuPTamUfN7jEdMWJTTBTUUACl7vbbA7JeA6+tq6+rNtvAm4jHjQlCD4j7+mP9CBPnCc7G7VuUFo8Bb/huq4uZ5/+F8S0xC/gC642eq+5kbwiXntSPNrCSZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4uyUFZAfHy/2u7tNlEh3d2HCnEnYNa71lFBCJgYKMs=;
 b=WLWUFqpvNzxn24Gpg6KTO0VLk6GtodsiBfmQkhl5sAd3RLDrFIMhJW5GBCzQS0UE+TWyj8Du31Wc/bFBuZW9DZkedSpbQbNyVKFK6nGZ60PilDQ6K4018ex6l4mzDEgCR2ClintQeiCco9QvxzwY7SMxiSG927ndcc+EfnUdJOjCuaRwF8y92xnv4fgv8PLb+29fhVXYiFZVQk7XGAorYmjUxxhS1pzD6l6n7PNsHA6Jbx0tOEiCoT5p1dCAeWbUxRkz9E3esxbjimgYsHB5yksSMPQoSlzZtRbM2bAAF6ClPpMjpNW4Slq6ZXE0xTdXJCx0bzYqJf3VEM3mexfLwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ1PR12MB6361.namprd12.prod.outlook.com (2603:10b6:a03:455::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 15:25:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Mon, 5 May 2025
 15:25:05 +0000
Message-ID: <ce197acc-8b66-4a6c-85aa-3318666d80d3@nvidia.com>
Date: Mon, 5 May 2025 11:25:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/21] rust: num: Add an upward alignment helper for
 usize
To: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
 <20250501-nova-frts-v2-17-b4a137175337@nvidia.com>
 <D9LEQ1U1PLO8.3N22GRY380ZM3@nvidia.com>
 <d6962ea3-282d-437c-b3cf-ce701d514558@nvidia.com>
 <D9M5K55GTN6S.1X827WU0Z50UM@nvidia.com>
 <112d971f-20c8-4598-86c9-6822d9c24001@nvidia.com>
 <D9MLOQC5G7XH.3GTUIRCCN8X70@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <D9MLOQC5G7XH.3GTUIRCCN8X70@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:208:32a::29) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ1PR12MB6361:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ab275e-907d-441b-9a68-08dd8be90341
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDhMWWJVcGJIRndoUkVWUmhHL2NzQTJJVlRLUkVoUVVYMEhhakZpZmtOL1cx?=
 =?utf-8?B?NExBTURsWlE3ZDBUbnhVaUs0ZlRRci9ybnI5akxLc3VmSys5N0liOHlucmQy?=
 =?utf-8?B?b2Jzb05VL1JVaFR5UUFXZ1UzdW1oU0tTZ25CSzE1eHBXZTdUelQzcjQvY09q?=
 =?utf-8?B?SHhsUHh4NkNCYXNxSHVCNlJoSzFIcTZndWVSeGJsbnhvd3lJSDd6bkxLTE44?=
 =?utf-8?B?ekJJbnlSZTIxR01GMU9nL3Z4aU9HcE9xQmYzVnA5M1RRRG1PVmY4eW9RdG92?=
 =?utf-8?B?TG95UXVlcjJrK3dmN3R3cmI4M2dYTWZ5aEs3SUgzRDJlMlg0V2d2OGcxSWtR?=
 =?utf-8?B?UHFTQXYycnY4TmJyeEFXRVN5Q0dGNkhIUHJTUTlwUHg0cUFGb2lmL0p5c0pi?=
 =?utf-8?B?U3B0bEEyaUx2Slg3dFlzRExaVnFiTVFESU44VVdpR0FHWE1ybys4OVZoMVdn?=
 =?utf-8?B?MllpZVFlRnRWdWpUMXBNUTJoSkRBU1p1RG5kSHl4OS9EME1wQ0lQOGl2ejVn?=
 =?utf-8?B?WS9uY1l1TFRtcmc4TnprRWlQK1l0WFdZZjVOd2JCTXJvUGZUZTZ5QjlFMXYx?=
 =?utf-8?B?UEVpY2tyTVRiRHZMdHQ0NkFQcjZ4d05PUU11SFlERWU5SGJvZkNmRGVYNWRB?=
 =?utf-8?B?ZGZhSW16cWF2OWFvYzBENVZYZzM3dkxiM3BVUEFYRW5iWEJEa2xaQ2IyYnJz?=
 =?utf-8?B?dlBld2Y1bHFORjh6WEZGQzJldUtvRXVpVXVsTThEWHlLSWdFV1V0dHhJZUNo?=
 =?utf-8?B?Mjg4M0JLaWR0MzZPaGFadnhDMXA5WFUzODJBWk9mQ0prT1VMUG1uMVpnNnhN?=
 =?utf-8?B?R0dodVFCczhqZzVrbjBBY0ZlSkdPS1ZHOHN3Yk4rL3lZeGRuaXR1WThkRiti?=
 =?utf-8?B?QWVOOUt3dnl5NmpVTGVjb29lRUdid1pzRElvSm5XWkplM0c3bjYyVUdDUXh6?=
 =?utf-8?B?Nzc4TGQvMXh5MzNIR0Yza2h3OGQvQ0wwUS9SR3RVcU14ZnhObmhJQlFEVm0x?=
 =?utf-8?B?Tm5HSzlhTG54UEpWZ04wQWpITE56OFJJRlhoeUh2c2Q1RHlLM2trenFJWkpD?=
 =?utf-8?B?SjlmTDNDaFRGQ0JGYlZRSCtianJGaUpwM3BlTGxQUzd6U05MU2NPVXVrdU9H?=
 =?utf-8?B?cm1CMDlBNVhPb1RZbmx4VGJxZEFHRGcxMGJJamF5VlZDbTN2blJyeTZJZ3lo?=
 =?utf-8?B?OVNSL3R1VUNtNE51TEpibFRwNDEyL0NMSXcva2lYK2VIU08vTUU1cVBMb2xh?=
 =?utf-8?B?djBQM2tGc0Q4VVE4dGlhTmdDK1l5R2VZYTZCakRDL24xRXd4VzRKdmNrNDBs?=
 =?utf-8?B?WUc4ZGl3Z2lib0xFL2tCQ0JQdG81eFB4bmh2d01uVHVIcXc3YTIvRGo3S3VP?=
 =?utf-8?B?TDNpZUZ3VDlyeUU5S0svejIybEdvaWJUc1FWaFV3eGJMSVFMWmZsV2dEYVZF?=
 =?utf-8?B?WWVGRWdEWnNkVDdlOHRRZ3RYRFlFK1MzeHU4dlVxTVhEWWtpbUhENFA0Sk1r?=
 =?utf-8?B?dlJtdVpJSjFBS1JFaS9oNW02WjBjTkduL1ViOTYrV0NDSjhuUWJjdm9ZN3Rj?=
 =?utf-8?B?V2ZVNnFNVVFPdFNVanluY2FVcjlyNkt4V3lwOGY3S0N5REpDbjB2NUtLcUkw?=
 =?utf-8?B?cGduWDBpaUtFbTRmL2RiVytCQUlBaTJjS1RNZy80enc4OXFwN0xacWszSUxq?=
 =?utf-8?B?OHVGd3kvN1ZUazFDQVNXL29rSElDQmxad0RMYlI3SzN1UHduNUR5RWYrN3Vj?=
 =?utf-8?B?MHZRNmNsMTMxN042czhDTTI2MWpIQXhkaTdQdVpob0pVSlZ0ZHFyQ3B2VlJN?=
 =?utf-8?B?SThNM2FRT05Jc0dlK1NKdW5LUm14NGxnSWx4cCtpejVmbGxGbmRHMEFJRU10?=
 =?utf-8?B?bmRyQmU3cDNkaGNGRzNadm4xcEU0aFltTlFadFYyZkdhWnNVU3I4QnJveGQv?=
 =?utf-8?B?YXdqeGVxYThWVEdLTU4yK3lsVWJEc2QvclExYkFPOHNMUTBGci9hanFWMmE1?=
 =?utf-8?B?V0h0NHFxRHhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akUwM3J1ZmRVemRBOWNYYTFZVUF1UkJKMVhSUGpuSkRDUEVpcTFjRmNrU2JF?=
 =?utf-8?B?TG1QRW9nd3hsMHFYaGYyZXpBWGNCcE51VUhvWnEzcXhWRzlFa2JVaS84NGdN?=
 =?utf-8?B?RkMwOU1YeFhYenJaY0pkcUg0Y0U0ZWx5c1lpMnFUT21WM2hvT0Q4azFsa3VL?=
 =?utf-8?B?ejUxR09FcGFRQkZsV3ZNNk1DbUVqQkoxVU1uSnV4VDZuaUhXYmE1YVVoamFF?=
 =?utf-8?B?V1ROVDVDaUV2OHdMOWRPSjNBejdGZkJWWks3b1JESE5rTzFFbG5pVkI2SHZB?=
 =?utf-8?B?R0JlcDR1TUV2K3J3VTYrMTI5VWtJbnVUM2FMczJGZU9qa1JBWGZpWk1HamdS?=
 =?utf-8?B?c29iNE9VcENiYVE3eER3L3BWTXR0Z0M3R3FoY3lHdFNKb3lLaUloeDRFYUp1?=
 =?utf-8?B?Ny8xK0c1d1l5MmFqWnFnUmd1a1pBaU9heXAxVWN0eTBpcG5pOXNHS3gvOVBE?=
 =?utf-8?B?Z051d0dOTVZXamFMWnBEOVI3ZkpYNGdrVjNENUg0TEZUWjYrTU4vWWplTmdV?=
 =?utf-8?B?UTgydlAvMThqNmFmVmFzNDFoSVA1ai9mT0YrY0VWTnhyQVg4SHdEUGltdjlW?=
 =?utf-8?B?cWNjNnFvaXl5enZ2NS9WM1p5c3AwdFdFZVJZdlM4NnpzT296TTFzSmhTdC9t?=
 =?utf-8?B?WlN3TURTam8rMGN3Y041UDNtRFZLMVlvWHdGWi8xZDBWWlFMVFVSdURnU3Q0?=
 =?utf-8?B?enlZRDdBQlNoWmtoZGxZZ0ZRemJXSmVTUnJYcmVTMXh5UjJhU3ZEQmhCWFAv?=
 =?utf-8?B?dllUbksxd0daSEx3R2UwMi9SWS9vRmlOdDdpQnpiQlBlZXo5bkJmK3pacW1p?=
 =?utf-8?B?YjZDMzRNUHpIZ2RRUGtRKzBtckRWMlFMRTVnYkV1R1Bkcks0dDQ2QytOQito?=
 =?utf-8?B?ei8rNnlndm1XUmdTQkwvMTI0d3FncXBub2M4RW56cGhlSHI5OG03a0RiK0c5?=
 =?utf-8?B?RUZJVlN2RXRYQlE4Mit1T2VCSXljMDBPdC9Ua2Y4aGxUdFBHZnF5VTNLbVBJ?=
 =?utf-8?B?Y09TZHRWenExalhMeEJtS1F6dFhGSHJFMkkvMXdINkFjdGhZbjdjV2lpc3lI?=
 =?utf-8?B?cllvVVdKWmlHOEc0RHdkaDRrZ3kyVG9lSmxEdVJFaFYxRFI0aDR0ZU1qNW5L?=
 =?utf-8?B?a0I2dithWGFWN3BqYmtNMVdiT1NGa0tad3k3cWJ1enY0YWxFQm8wN2dDSE5Y?=
 =?utf-8?B?bmVnN3ZEcDFLUTNJc0kzUUtVNzhtbTVHYUZiSWVOOXEyMWpKWmpLZ3doUzNL?=
 =?utf-8?B?cWZxWXFIaHI2RzJYUlpJajlLcTFFQWp2RHB5eTkrbGY4WU5hM1MwUnNQL3oz?=
 =?utf-8?B?ZVk0QU0zVmFkV015K2ZMam5aWG1RaGtlS2FHWlJwRTNDNzdkZWlUR2ExUDlV?=
 =?utf-8?B?Ly9qV0hSQ0J4SjZmYUI4ZWZTYVJBaGhrMTgrdFN4RFpheVUraHE3a2tndUV3?=
 =?utf-8?B?akZsSXNRWnUyUVV1S0lUY3BCRmd4T3ZCcjNqamloMCszZWxMcHJTQmhCaTJ3?=
 =?utf-8?B?K2l0N0pJWE4yZjIxQkFpcVE5RW5ManY5MWVyRnEvUnJhWW1BL3VSUDA0bzdO?=
 =?utf-8?B?N3NDQ3JLeXlOSjhRYXVZTWdIWnhsUU8xSXJoT2E1ZEp1WUE5ZVMxTFhtbVZV?=
 =?utf-8?B?VUtKWnR6TysrdmZQclAyWmZCaFJqa2IyL2FPbmhzOWdzWEg0WkI1MmdVSkpD?=
 =?utf-8?B?bnpFOXpNc0pOaXFOdFUyeWY5QXZMdzNrN1ZDeHdaOFdzN0x0dERjdkVTVmdP?=
 =?utf-8?B?SElFTVRMRHhMWVpEbUxYT2o2WnppbC9rMWJ5UUptMWZadDBQQmVPMXYvb1cv?=
 =?utf-8?B?QU5RSVhQNk5GNUhNdmJYZ2xiMXFhMWxrRDc3SHpPVCtzSmlHcVUwS2FiZEV1?=
 =?utf-8?B?WmRpWDJaZDdRQ3JFWThlaU1MK0lmLzNKenc1MElrdk9VOTg1SG9kMGVpYjJV?=
 =?utf-8?B?ZjhLNEpwL0Rtdm1UaFFJUkRBK0JLNU9wcDBqUjRDN1JGTmQ1bFcxcGdkb21V?=
 =?utf-8?B?UXNXZFBrZXlMSHpGVGlqYkVXZ0lBK2xrSlJnclllMlIxQjJDcHZ5RzBteVlK?=
 =?utf-8?B?cXhiam90RGlvOWlQbkFKUEYrL25FV2FHdG9TQ0Z0SXJrMEVLdERyQlpKQWJy?=
 =?utf-8?Q?QC0DliJEUvJdqM0w9uJ+wqgyF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ab275e-907d-441b-9a68-08dd8be90341
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 15:25:05.6514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR35woHs0+GTnAVEL61uhOw5+KvixpYy+EXAEg+UxmvVvPo6G+iv7aCBXHiwaNbMnoOYnlRWsAbcIZlVg6CNXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6361
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

Hello, Alexandre,

On 5/3/2025 10:37 AM, Alexandre Courbot wrote:
> On Sat May 3, 2025 at 12:02 PM JST, Joel Fernandes wrote:
>>
>>
>> On 5/2/2025 9:59 PM, Alexandre Courbot wrote:
>>>> pub trait AlignUp {
>>>>     fn align_up(self, alignment: Self) -> Self;
>>>> }
>>>>
>>>> macro_rules! align_up_impl {
>>>>     ($($t:ty),+) => {
>>>>         $(
>>>>             impl AlignUp for $t {
>>>>                 fn align_up(self, alignment: Self) -> Self {
>>>>                     (self + alignment - 1) & !(alignment - 1)
>>>>                 }
>>>>             }
>>>>         )+
>>>>     }
>>>> }
>>>>
>>>> align_up_impl!(usize, u8, u16, u32, u64, u128);
>>>>
>>>> Or, we can even combine the 2 approaches. Use macros for the "impl Alignable"
>>>> and use generics on the Alignable trait.
>>>>
>>>> macro_rules! impl_alignable {
>>>>     ($($t:ty),+) => {
>>>>         $(
>>>>             impl Alignable for $t {}
>>>>         )+
>>>>     };
>>>> }
>>>>
>>>> impl_alignable!(usize, u8, u16, u32, u64, u128);
>>>>
>>>> pub trait AlignUp {
>>>>     fn align_up(self, alignment: Self) -> Self;
>>>> }
>>>>
>>>> impl<T> AlignUp for T
>>>> where
>>>>     T: Alignable,
>>>> {
>>>>     fn align_up(self, alignment: Self) -> Self {
>>>>         let one = T::from(1u8);
>>>>         (self + alignment - one) & !(alignment - one)
>>>>     }
>>>> }
>>>>
>>>> Thoughts?
>>> I think that's the correct way to do it and am fully on board with this
>>> approach.
>>>
>>> The only thing this doesn't solve is that it doesn't provide `const`
>>> functions. But maybe for that purpose we can use a single macro that
>>> nicely panics at build-time should an overflow occur.
>>
>> Great, thanks. I split the traits as follows and it is cleaner and works. I will
>> look into the build-time overflow check and the returning of Result change on
>> Monday. Let me know if any objections.
> 
> Looking good IMHO, apart maybe from the names of the `BitOps` and
> `Unsigned` traits that are not super descriptive and don't need to be
> split for the moment anyway.

Sounds good, actually I already switched to keeping them in one trait
"Unsigned". I agree that is cleaner (see below).

> Actually it may be a good idea to move this into its own patch/series so
> it gets more attention as this is starting to look like the `num` or
> `num_integer` crates and we might be well-advised to take more
> inspiration from them in order to avoid reinventing the wheel. It is
> basically asking the question "how do we want to extend the integer
> types in a useful way for the kernel", so it's actually pretty important
> that we get our answer right. :)

I am not sure if we want to split the series for a simple change like this,
because then the whole series gets blocked? It may also be better to pair the
user of the function with the function itself IMHO since the function is also
quite small. I am also Ok with keeping the original patch in the series and
extending on that in the future (with just usize) to not block the series.

Regarding for the full blown num module, I looked over the weekend and its
actually a bunch of modules working together, with dozens of numeric APIs, so I
am not sure if we should pull everything or try to copy parts of it. The R4l
guidelines have something to say here. A good approach IMO is to just do it
incrementally, like I'm doing with this patch.

I think defining a "Unsigned" trait does make sense, and then for future
expansion, it can be expanded on in the new num module?

> 
> To address our immediate needs of an `align_up`, it just occurred to me
> that we could simply use the `next_multiple_of` method, at least
> temporarily. It is implemented with a modulo and will therefore probably
> result in less efficient code than a version optimized for powers of
> two, but it will do the trick until we figure out how we want to extend
> the primitive types for the kernel, which is really what this patch is
> about - we will also need an `align_down` for instance, and I don't know
> of a standard library equivalent for it...

Why do we want to trade off for "less efficient code"? :) I think that's worse
than the original change (before this series) I had which had no function call
at all, but hardcoded the expression at the call site. The suggestion is also
less desirable than having a local helper in the vbios module itself. I am not
much a fan of the idea "lets call this temporarily and have sub optimal code"
when the alternative is to just do it in-place, in-module, or via a num module
extension :)

> 
>> I added the #[inline] and hopefully that
>> gives similar benefits to const that you're seeking:
> 
> A `const` version is still going to be needed, `#[inline]` encourages the
> compiler to try and inline the function, but AFAIK it doesn't allow use
> in const context.

Right, so for the vbios use case there is no use of a const function. The only
reason I added it is because there were other functions at the time which were
used (by the now dropped timer module). I suggest let us add the const function
once there is a user of it, I also don't know right how to do it. Like if I use
generics for the const fn, I get this:

const fn align_up_unsigned<T: Unsigned>(value: T, alignment: T) -> T {
    let one = T::from(1u8);
    (value + alignment - one) & !(alignment - one)
}

error[E0658]: cannot call conditionally-const method `<T as Add>::add` in
constant functions

I tried to do this with macros as well, but no luck. If you can share a macro, I
can incorporate it into the patch.

I can respin this patch again on conclusion of the discussion, but any guidance
from rust-for-linux folks is also much appreciated. Below is currently the patch
that I am considering so far (without the const function and Result changes).

// num.rs
//! Numerical and binary utilities for primitive types.

/// A trait providing alignment operations for `usize`.
use core::ops::{Add, BitAnd, BitOr, Not, Sub};

/// Traits for unsigned integers
pub trait Unsigned:
    Copy
    + BitAnd<Output = Self>
    + BitOr<Output = Self>
    + Not<Output = Self>
    + Add<Output = Self>
    + Sub<Output = Self>
    + From<u8>
{
}

macro_rules! unsigned_trait_impl {
    ($($t:ty),+) => {
        $(
            impl Unsigned for $t {}
        )+
    };
}
unsigned_trait_impl!(usize, u8, u16, u32, u64, u128);

/// Trait for unsigned integer alignment
pub trait UnsignedAlign {
    /// Implement upward power-of-2 alignment for unsigned ints
    fn align_up(self, alignment: Self) -> Self;
}

impl<T> UnsignedAlign for T
where
    T: Unsigned,
{
    #[inline]
    fn align_up(self, alignment: Self) -> Self {
        let one = T::from(1u8);
        (self + alignment - one) & !(alignment - one)
    }
}

Thanks.

