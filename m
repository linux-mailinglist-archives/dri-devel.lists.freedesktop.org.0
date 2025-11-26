Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C1C8C40B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:47:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE6A10E743;
	Wed, 26 Nov 2025 22:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Onr4lUvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013023.outbound.protection.outlook.com
 [40.93.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A59210E71A;
 Wed, 26 Nov 2025 22:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJoSr0imMneB4hsiPKayTK7+yM6KJICGhHfUMggc1NfH8CvZe6haKXGF/13scGZSnV07WKxmDBUdgOivJMk0vrzwEUpZ6gNh3A9dzgIKPmmtfknWC4YGUSdTQUQqEnvkYPBQPpK9Ys1VC7aiBcaUueF5/Kv6hMAh87CgeRy92C+0/yrZcyJ2TUQOutL1770uSfJO+ncqakV3dGXn6U8UHNnO1ViWFRmA6Fno5YNM8ig1UpW3JYlJDaSS2CCK38ayVTz9d/47tAuGD+fJiVwq6Mmq8/DGL8VWMbAQKDc5PCSuo36FutI31TXZ68EDmrCmz2PPSqd1eoEDgvpRKlr1Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqI85E8VSvFwMoKVMJwWUZ9ueOYnysm/AjDyLq33Iqo=;
 b=wNKmK7UAiqYvUKsTHKiiEoZwkIGRiGFo2KmyszSDcyffhCxoDUv465lW1lNGDihoI+K3dTCndHtSzJHxJOpvH9xOilYtAJFQ3v+HsckTZbkSSHKmAx6+q+yQbIBDUIXiAmq0haNLri2884kjx+0GIqcfTVyi3WeNtU/rFNWx9s6FVHnk/GQoDHtSZiDVykwtcG2Cl7I5U1PuFQpzxfXfirwwQjmiSUfc6VQ9K7B4gCvIP8yvt09QkZc5WWKSdQ9/iyDuJlDELsJZCFIjwScGTXX+mIHVWXnSnr+nOBEEd3iqGMWHhQaexzeYTVgaSJHjk3xkUMgxqSbdcrJNYHNOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mqI85E8VSvFwMoKVMJwWUZ9ueOYnysm/AjDyLq33Iqo=;
 b=Onr4lUvRWgs6o49OkG3lNgSHfM0x9CorMCX/F6fnlIJd7E+wfaz3KSdcPubej3sAlPT9/ETvFq5R8bgudtlKUYE1X72CiqvCJBl/9vH5c+Z3Kn77vpuD2EdplNmZI35aCfED66L0nCUVN/ASYmjiRWnp9Ehsr++g1gAMO4WB8y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 22:47:17 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 22:47:17 +0000
Message-ID: <654e8357-0bee-4132-9122-ddba18a2d8f5@amd.com>
Date: Wed, 26 Nov 2025 17:47:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 00/51][FINAL] Color Pipeline API w/ VKMS
To: Simon Ser <contact@emersion.fr>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, Alex Hung <alex.hung@amd.com>, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 xaver.hugl@gmail.com, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 wayland-devel@lists.freedesktop.org, leo.liu@amd.com,
 ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es,
 mdaenzer@redhat.com, aleixpol@kde.org, victoria@system76.com,
 daniel@ffwll.ch, uma.shankar@intel.com, quic_naseer@quicinc.com,
 quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, mcanal@igalia.com, nfraprado@collabora.com,
 arthurgrillo@riseup.net
References: <20251115000237.3561250-1-alex.hung@amd.com>
 <cbe00ac4-a535-47d3-813a-e2eda7e9b991@amd.com>
 <d8360e9c-502d-4003-93ab-9afd8d716c49@bootlin.com>
 <cb13dd25-82b6-4d8d-a8f2-a9a31ef2e73d@amd.com>
 <ecf54c45-4b45-4fb4-a102-46ce9e1de3a5@amd.com>
 <2270bad3-8634-438a-aa16-2092398e271b@bootlin.com>
 <5b0ab1cd-0a66-4a47-9251-396df9693477@amd.com>
 <9SKik7HYjfvfDFnhulaAYG4Hkw_dzXvXEZqzLtTQNEadc1SHg9eQUnBWtP3zOtV8qip9yrWY57d5E2jKWDhJybvRog9GerilPeiVLd9dFMs=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <9SKik7HYjfvfDFnhulaAYG4Hkw_dzXvXEZqzLtTQNEadc1SHg9eQUnBWtP3zOtV8qip9yrWY57d5E2jKWDhJybvRog9GerilPeiVLd9dFMs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::32) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: 5493c317-9318-4ee2-4e5d-08de2d3dc026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVhYUzFCTnFTR21oOGFrcitRSmtWOWV1cUV5UWVVWXBETkx2d1BjTlJVaVFi?=
 =?utf-8?B?MzZxZGVSVEFUNW42ZlBob1AxNUJ2alMrQ1g5WUhvdHUrY1RpVDQyYllsWG4w?=
 =?utf-8?B?T1JhbnJYUDV4dFNDSVVTZ1VhTkhNTmZMM05PZW1Ed1FvczZLTFdrS1VWZEtU?=
 =?utf-8?B?NFU1ZWRySDV2UFBiQ25JQUlhdDNhL1NFbVpKem5qQzd4L2ZZZzYxWmFkWFlN?=
 =?utf-8?B?U1diYWEzNzlmUHVXMlNrVlg1RkprblVadVV5ZTF6b285cUtYMzRlSGJCOCty?=
 =?utf-8?B?bGg5bTZMU3hrT21hdDZXWHpyZkhWbXoxYVlScVdtcmtUcnJYRTU5TlZMczcz?=
 =?utf-8?B?dmM2NEMyREtkbDFLZ3M1Yk1iVmdqRk9KbjVaZldndkRIU0lZYnBudGxpTVhs?=
 =?utf-8?B?UzJ1c3RDRzJucUdIc01YT1FJWFp5NndKTmVlL2tWczYwK1c4eXdGdGZmRGZO?=
 =?utf-8?B?czhkL2t3V25XSHdaR0pPNWVVQVpsNWlxYlB4TUl3aTdtUkFlMk5EMXdrSmxZ?=
 =?utf-8?B?WENFMUhtYUt4Rkt1M3hTQk96QnZGYXZSekMrTWNmbi80a0Q3K2ExbXE3ampM?=
 =?utf-8?B?ZnhybzNTN1VpUzRlQ2YrTU1JS1NWV0NhZFh1bGdXamFpSEk3d2ZxdS9Ocisz?=
 =?utf-8?B?VE81RFJ5aDRRTitYOEtKeWZIYWR3SHZ6RXlyY1RldUx6OEJDYUdhYWNIZld2?=
 =?utf-8?B?TTBLVDBZYVd1UC95Q1J4ZElOd3QrY05kcjNTWXp3bzBjN0E0M0FsV2kzdzZy?=
 =?utf-8?B?ZE1ablNBcTArenZyTWcwVndmVkhvYkEyQXlUOFB2WlEwNml4d2V3VkU0TFB1?=
 =?utf-8?B?a1pwRFRQNGFLYmdua0dyYmVEaG9PdzVJZmVTSVlNQjlCTEs4cnRqdkxRdENG?=
 =?utf-8?B?dW81U0l2bUJtWjNRR09LbjJzWjdQaWtvZzhBV1RTTnZ5ZFVYYWdnTzM1SUV6?=
 =?utf-8?B?ZU1saGdJVUxEVVBmams4ZjdlTFhxbWFNNXZlbS9TNGttN3g3NzRuMCtDd09H?=
 =?utf-8?B?U3dvZnFGMjJxS1FHTDVpeFRoTE82NHNpaEhLQzJONndQYklnLy8wQ3dqaXNU?=
 =?utf-8?B?WVgybUtRQmd1RGVWOFI0TjNvZzZadlVTaXJvdDVQS1plRnJQKzhqZFVBaWY1?=
 =?utf-8?B?RnFRNEtlV3o0UWVZbVBDQmNyUHhKVU5Xc2M1WnZqRUUwSUtucStod2k4WDM0?=
 =?utf-8?B?L3ppUjYzR2dxUmNGbStXekhOY1B3Q28vS1ZicWRNU2lIWlYzTzFDTTZFTCt1?=
 =?utf-8?B?dDY0YU93dUFsWWxwazVpSmhsVWJmRCtmNG9HNVcxUDR2Yld3bE5Ga1FqQXEy?=
 =?utf-8?B?RUdrSk9pRXFOU0E4SnpUWDNPd1U3YlMwdklwTWtvMjlLc1E4cmc4eVNDc2VH?=
 =?utf-8?B?UlhNMU96NWdERzBxbmJKemtaTllMY3BLLzBNS2ErWWJMNk9Dc0NCd1d3OFdz?=
 =?utf-8?B?ekxkSUZKZlBCdEhBMW1tNy9qWWhYaWw1NEFnbGRBUWt1SWZNV3dGU0NIQW1w?=
 =?utf-8?B?eDZTanZNOEtPc0dUZ1MxQWp0WDVCekxKRUx2TndQWGNKaW1OWjZXOGZ1ckh3?=
 =?utf-8?B?KzFzSHM1ZU5TZHNQbUdzVWxISjd1aEN3aFd0ZGRBOHdlZjdjdEtMei81NUwy?=
 =?utf-8?B?dmlhRlpmMkVZSU5YMnlPRUJlVCsrcmJWSm02NTZDZDR1ZmMybFNJYVAwdGl6?=
 =?utf-8?B?cGtqSlozSWVISEQ1NHoyb0Z4UGdNeHY3dGRMSFkrVWFTaklTYlBORGJpbE9Y?=
 =?utf-8?B?SmJuQkFCMmZuWTJobHJnZEFSdEVGQXV0NFVzUDkvUmN2ZkplMWpjeDFRdHBE?=
 =?utf-8?B?UkNTbHNKUCtVUmVaN3h6dktBZExjYWdBNnZMeGNEUm4vWXlucVV1OFA3blBT?=
 =?utf-8?B?U0ZHZU1uS2g3dnB5QWZCMWw0aUxLQVU1THZadkRaM1d2TW1CbnRRZDdPMjYz?=
 =?utf-8?Q?SkDG8KdVnNp7WlJ01R91mlAUbQEGQwap?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpyWUdtNTA1c3g4bHFGekpXQmtSZ2d5aFQ2ajJOUE9HeFpQSk8zRTQwUXpB?=
 =?utf-8?B?ZUxuNDdOWjZUVWxheTd0RUtKMWcyTklqSURLa1VmYU40UXNIc2tScS9HazNH?=
 =?utf-8?B?L0tuMTQraEJTQjdZUjJGb2pFQTFwWWZsbFh6S1VvVmJtYitySVFJa29sODlX?=
 =?utf-8?B?M2tJSXVMMzRwZWxJWXBEb3gvME00UUVSd1gyakg4Y1Q4MzdtdnNqWmx0TUVt?=
 =?utf-8?B?NkVtS1VQYWxHUVgwRFlKdmRVUjhZVk53MEgzaFB4QnRpN3BsamluNlQwWHdp?=
 =?utf-8?B?UldHMXdFVmtOVHl1MHMrUU1aNC9xNmZEbUpOcGtZMWJVNndHb0dUb0hBUmx5?=
 =?utf-8?B?OHBGZFZOM08zaGNLaDJWT0JLVkgwZ2R2NTArMTY3VGVpOUJUVUJKV2k2eUto?=
 =?utf-8?B?VTRCaS9xbnZSaDhIRm1CaFdIbVhReXIvQkNlakQzTldsRlY4UTRjVi9NbGpT?=
 =?utf-8?B?eHRrZDdiRXRYLzFxa01xL0piVUE1VU1pZVZDWGRUWExhMm0xYkVneTJYR1Fk?=
 =?utf-8?B?RFRyYWNqZDhuN2NpU2pWUGgwSVdMZW1IZGMzRmFsYmtiVkhYUnMvYkRhZ3Ay?=
 =?utf-8?B?dWxranVmdEluMmhvd21EMWx5dUtsOWdJVnlrdGt6QUE4ZU1jWkRTUVg1Y1M1?=
 =?utf-8?B?aHpFNHZQNWJvYURmR3ZQME5RMGRUdFFMclNnZXBsZ0JIdHBEVVlrRlBXZ2JF?=
 =?utf-8?B?ck0rS0g2cWVRM0dqV25WTU5CRmJWMCtuM1o4cnNSd3JlNzdWYWpMcHdDMGdZ?=
 =?utf-8?B?S2QwSXdhUjV6WnhhK0ljbUVqa3lxTG54M2RCcUpqUE13TTlZa0NCMmNOOTI5?=
 =?utf-8?B?Q0VZNnN4eXZCT2o4Ti8xL2paaGlZalBWK21ZWUR3b29BTDA1bXNEMnJHZm41?=
 =?utf-8?B?YmI3dlFtMHhyTnFnaXdQNkJXYzdOelBCOHVMV3pIeWZvQWJyUzk2ZzN6Ukx3?=
 =?utf-8?B?NkxraW1LRlVmWUIvN3hyL0J1UXVLMWdBWHdtVlZ2b0VQM3UrT0VTcEZ0UU1B?=
 =?utf-8?B?TWsxMWpHWUZxZHF5K1FiVjlzWnZ6aFVWZDArck1TbHQrRnZlTTJSdXg5NEFI?=
 =?utf-8?B?V0FvUytsOU1xd3JGM0JMYVBGVk5iN2JWSkRBTzJMaExUOUs0Q1NWTklPdEJ0?=
 =?utf-8?B?OTZ2WDhiQVRmallVZkJyR1dZam9GNlRhRlNOajdYOFg3QlJmbEdNNEQ1eUEz?=
 =?utf-8?B?bjdaOTNlZ1p2QzdUUVlTOFhDa1p0SXkveEdqNTZCZ0N3bmpHNE1jZ3pKdVU3?=
 =?utf-8?B?UEJrSFkveEtyR2F1WnpMREgwUEJKQldzb1h6STRDRm4wSDJ4NXJpVUsvT3pI?=
 =?utf-8?B?SkpHL1pEN2p5WEROSUNLOWV4YTAyZ3F4eml3TW12bmNNNE9OYkRmT0JoY3lX?=
 =?utf-8?B?c2FGVDNaaUZMOGdQSWRRWElkUGkrZWtGa2IzNWVKL0NQTlVuMEVtRmx6QnEx?=
 =?utf-8?B?T1hFdHZEUHcwWi9QWGpuV0N5Z2d3bElPcXdlY2F4SU0xeU9RcllxVHZoRWt5?=
 =?utf-8?B?b0k2dFc5VlhxQVNodXhYcmpOQnNuM2tyY1dxbXNxNXRRQVZYbGpPYmFHZVBr?=
 =?utf-8?B?ZEdPN1pUUkNxSGhXd1ByL2JETGw4dU45cnlUalRsZmx4MzRnQURmb1JYTlRY?=
 =?utf-8?B?QnIzLzE3ODNxWTR3eHNnd0pBLzlDK0VjNzFWdFI2ZXBRcHZqUmZYZWdyT0hK?=
 =?utf-8?B?ZUNrMExDR3BmNDFpV09pYXphYmJ5UGdFK0RwSmJvaWk4QnZtUXlsWkIxcXI5?=
 =?utf-8?B?Nm1tenh0a3ZCZWRDQmJmSjF2UU4zblNYNnkvdkJLSVovUmpNM1I2Qkx5ei9D?=
 =?utf-8?B?K3Jsbzg1QzAwZWMzc2dNWmFxQ2lialp1SDE2SzZveGQyTDFDSitoQnlPWTA1?=
 =?utf-8?B?Ty9GQ3A1THR2TFlCbStJUDRpUWpIcDlpaHFMc0o5WEt0NHp2WjA5NTdiNzFh?=
 =?utf-8?B?V2lya0VIZjBZVy9CMjBWM0t3YTlPVDQzS0pQUHFiMGplYTNoY0NVVjhQUEx3?=
 =?utf-8?B?Q0hOOWN4aEJoS1VYMVEyWUx5S3E0dE1jMHVRWlRKNnZWOVdSdzFDMG5CQUZR?=
 =?utf-8?B?eWU3dlJFTkxOMnplQ3BwZFlZYldsZ2dzdkcvdzdNejdlalRWTXhHNEdGSWJF?=
 =?utf-8?Q?QseeaD7jyB5/94p9BgWMBHZ/R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5493c317-9318-4ee2-4e5d-08de2d3dc026
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 22:47:17.4683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wKb6Sxpc4xuJC6ov6xcITl1SpY9iQSLKAZLbJJZ7iN1k+m/r70q2mYq4o0kCXHwRWPSsXETho2zqdxBC/2PWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101
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



On 2025-11-26 17:39, Simon Ser wrote:
> On Wednesday, November 26th, 2025 at 16:22, Harry Wentland <harry.wentland@amd.com> wrote:
> 
>>> I tried to apply the series, there are a lot of checkpatch warnings, do you have the time to fix them?
>>
>> Right, there seem to be a whole bunch. Let me clean them up and send a new version.
> 
> Oh, I only now see this message… Seems like we duplicated the work, sorry!

No worries. Happy it's in.

Harry
