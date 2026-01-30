Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OQnLBJwfGk/MgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:47:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3B3B89EE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 09:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D810E0AC;
	Fri, 30 Jan 2026 08:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0qP35pZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A3010E0AC;
 Fri, 30 Jan 2026 08:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkPoDXoG91IkDuV7fFIR5hi23bXAW9ddrIlc2dhvuj/QnqYtQUkTmOjWSOyuC0Q1FO3OjhfbSd0RM4wdsRFIPWws5BJ94vRSuNaT+HT9mA1U4u5FMq7XRnoUQ3T+S5Zv1OJTY1ZhyB3E0wyCxc7/7vUrRKHpBFY22RN22EHEbyt/hCR16To4C31mfRxcX0IO+c40Vf8tFu0bD5KcoNGH8VaX5VriCq5zKuw2J5Rtb0K7C+kEAtGFUhlDZqOtdIJIuu0C+jDJ7jsFddtpK6AP368L+kVLE+jwAA3/L79kV0+H1gWMmxiVUw4d7Iy+U8X9osl80wwzDcXBDZqAGXfpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nokbhVpJ3SJcV+d3H+pV8ko3IHBKE8xrspgt7fGuwhA=;
 b=umT1rBASXzgYE6xmK7ZZLA5A2q7I57MkLx35tI+FrnSbHkjiBJbfAuvMXHZl+9/XSSvfphG+qIkHAgaT06e65I0JLAxEgPQw0g/wXecBHCBS+cBbt5FciGanZ6F747QVsT1wTHTRg0K3AvK1TKS3RLP5MTIty+cQ0OxPQfvXwYhd2sVVdm3UEDCc4jAnIR35tQWwCs72/HIMSGRMg8o2tUL4Fjbl0Glj2/dUMTvfbQNsB2Bq2Uxb0MnqBJWlUauZqY61raJAyEba1+H7eQYDFDm5HWgVdT8lhRFhncUSYrPGaX6XilZrOjt+GhxJudZwQ4AYVrZxnBvcQYgSqfyoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nokbhVpJ3SJcV+d3H+pV8ko3IHBKE8xrspgt7fGuwhA=;
 b=0qP35pZzzyAe+clXhjqBXhY4ymBMmLbQWMsOhyYM7FK1jLhcNp6E1PJbZLXzu5DbY/pnvi8ZnLKRT6bPfIE7J5+AtxlAH8svmJATtXEAkQeQkBcDj4K2DYLMFsq3A/gcVsWoq8NzbTMzHL1rAhdDU17rBZ/5AqEYDEQVbsm+mik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB9527.namprd12.prod.outlook.com (2603:10b6:8:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 08:47:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 08:47:07 +0000
Message-ID: <2d9339db-4d26-4ff7-8390-5ac5c0a92401@amd.com>
Date: Fri, 30 Jan 2026 09:46:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] vfio: Wait for dma-buf invalidation to complete
To: Jason Gunthorpe <jgg@ziepe.ca>, "Tian, Kevin" <kevin.tian@intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Pranjal Shrivastava
 <praan@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Williamson <alex@shazbot.org>,
 Ankit Agrawal <ankita@nvidia.com>,
 "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
References: <20260124-dmabuf-revoke-v5-0-f98fca917e96@nvidia.com>
 <20260124-dmabuf-revoke-v5-4-f98fca917e96@nvidia.com>
 <aXfUZcSEr9N18o6w@google.com> <20260127085835.GQ13967@unreal>
 <20260127162754.GH1641016@ziepe.ca>
 <BN9PR11MB5276B99D4E8C6496B0C447888C9EA@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20260129145851.GE2307128@ziepe.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260129145851.GE2307128@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB9527:EE_
X-MS-Office365-Filtering-Correlation-Id: 78cba416-cbaa-4960-1466-08de5fdc25ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OS9kalhBMWQ4ZlpvdzIzZjViR1Z4T3VKMDI5NUx1bkhoQkE0MTNFYnVvTVFr?=
 =?utf-8?B?Wlp2bXE0UHNzQktSaHlzTkZTUHBJVnZ5RlhHUEVETUY3VituZ1ZES2duN0FT?=
 =?utf-8?B?L1dTUEhWWGxNNGVBQS9qZ3Z6dUxNdlhMZEdpRVB2dzBhRVVqMDRLa1o0dUxH?=
 =?utf-8?B?cmNQRHIrTXIrdk53QUZhR3U3MENtZEdDWkhwbnM2bU1xc0J4VlUyMmFRTkFt?=
 =?utf-8?B?cC9KaDVsRGRHY25qQmxNUGJGQ3hGdm4xNlg2cmI0WEtNbUJyZUg3em9NOG9E?=
 =?utf-8?B?REJSYW9uNXAvQitLLytjZ0JDUWF2dXBwUVllWW9UYkdvT0VJR3NkOXJjQVlo?=
 =?utf-8?B?NzI5VlRhWFJkemdzWFl3K1pMZzRGTlhyeU9MRWl4RkNBdjFpd3k0RFhIWEc0?=
 =?utf-8?B?ZFUwQ2RNdmRTUkdPNWtnMlFZTXV5dHFpTVJBeHVoNlpXTFRlc0g5cGJ6UFln?=
 =?utf-8?B?cG5aSzI0SE5zVTVESGJmU1hBTEIvbnVkVW9YVEVtQ210ZW9GVXh5WStDVWdD?=
 =?utf-8?B?eldHa2liVHUvMEZZWWJJYU5UU1l2ZWFxK2VFbFBISzJwaC83WTRoQkQvYUFH?=
 =?utf-8?B?SFVuV2RQMkhIZUFzeURabVJ4WjJEYm1NaFZSVGJQb1kvaDFFZW9VckVEN092?=
 =?utf-8?B?dGJGRVMvR0dzZjlwMXExeG9sbXB3Mnd1SHpoTUlzSDV4YnNrSnM5dEZjeUZV?=
 =?utf-8?B?eXhDTUpINzhyQU5CVFRiZUFvMnp3ZkphNlVJdDhsTUFaNENrS0NLRy82aGdi?=
 =?utf-8?B?dUpMZk5teVozYWdmRWExSnU1bWRSSE84WGNIUVpIaG5udHdETmRwSVFKUmRL?=
 =?utf-8?B?UVBERGtVRkIrWG85Y3RvZWYrMHcySU4vaGIweXBoVGY4VUFQcnJnNW8yYUZ0?=
 =?utf-8?B?b3NQZlFweVMzSnVDUW9iTWVIbENhQlFOVDR5eVRzTHlQK1JKVTMxd0JqaWor?=
 =?utf-8?B?bnhOZGcwckNFbDlzTEZ3NTErR3ZmamROU0N4RG8ySUxsa01rZ2UxTnI1eFBq?=
 =?utf-8?B?TGo1Z1dkY2pGcUFQaWVOM1VHSFNEbnJVb285S0h5c0lMdFBPRE91SjFKalA2?=
 =?utf-8?B?elNad1o3Z0VzZUN5UkV5VEwyU1RPM05oSUFRTjlzVi9MMUdFMHArZCtlaTNm?=
 =?utf-8?B?T3RIeXNRZTNra2hvUjlrV0U3Nkt2bmhWOGtCM0plWXZRMXVrNzJwYVhQcU5u?=
 =?utf-8?B?bWhDU1VSNHo5NWVpL0V2bjhaWVh1OWg0WFhxN1JtejBLTEFxQ0VUSHFscnlq?=
 =?utf-8?B?dFNnYWNDMzhWaVNCdlFIR29CZmg2YS9kRkJOc3ZQeU5RNlg5eXBiZEd2b2hC?=
 =?utf-8?B?c1I2YUxBVU9RckJDTW13M0RWOXZZZFdSdWNsaXV2bnJkZEx5SGt2QkRNYnV2?=
 =?utf-8?B?bkRiU3hRelhWaXRnMjdvUXMwdEdrampXODdQQ2JJaFFUV1V5ekx4UmdKcnRp?=
 =?utf-8?B?TWFHNllabWdzek5yalVHMFVWY1NONWw1NzgzSE9CWWsxT1VPVXR3S2dHa3NR?=
 =?utf-8?B?QWNSRjRHZVg3RXNDMnV6a1JtNlEraDdTRDVXakNEMjcrajVvSzB6NlM3Z2hy?=
 =?utf-8?B?UUtIMGV2Ym5wRXNGcWhxRnpPMDJSTFVqK0RJQVRrNjVaUm1ENkl3amtDaldO?=
 =?utf-8?B?Y3l4SXZrVE10ODZxaGF3elhYNWk5a1I3ZlFWMGtHeGVVYWFHM1FTSXFlak5y?=
 =?utf-8?B?ZUlBMUt3U21jTmJhbEdVdFZaT0RhcjJZT3VVRzNVYmJRWW9BYW5EUmJ4ZUpY?=
 =?utf-8?B?Qlg1QmFwcXlhajBqZzBYOEQrZmN1R29pTmVZU01yT0Y3cGpXaDMwQlp2SUVs?=
 =?utf-8?B?OG5FS0xEU25pL21hU1p3ampHQUF1Rm9SOXB6cVlCSk0vZHpreks1QjZsQ0RN?=
 =?utf-8?B?WFhqZitvYXBGNy9wTTFPNlc5bVYvU1BCNFoyUmF3NVJyRmdzaW9ZVXZPUTJa?=
 =?utf-8?B?SWxTRWgrVmsxd2V6VDFVa3RqN2k2MHhrVnV6eXBwTkRBaW9PbHovTDBMeWhs?=
 =?utf-8?B?WURDZUdTY3k0MmljMXlzWHI5amtOWlNLQ2F2WFhrUGl4Z01ndzBBNjZqL2pR?=
 =?utf-8?B?SnJtN2c2RkRYOVFZRjBYd0o1SWNzK3NGUk9Pd3hlYUxvQWVGOEVKcWI2SWcz?=
 =?utf-8?Q?K2o4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG90QVdlamFnaTdoZTRIcXRxbW9kRklKWTJ4eEFsdEZKNVhOcVd3MVFjQVZE?=
 =?utf-8?B?OHZkUmFQOW95S2JpWDRMbTFjVXl3TkJUT0xoVDEzOUdNbDNVMUlPK3c1NTNV?=
 =?utf-8?B?dUZrdEN2NTYvMXRLQ1A1SFM4OG8xWVE0c3VTMlQxVVdWMHNuWSt1a3V2d0Vl?=
 =?utf-8?B?QzZSQ1dGM1J1alpNZjhFWllJdFNxRWxVNWhBbVRldXhiS0FJZ2hkZU9Dc0U1?=
 =?utf-8?B?MWpIT3o5Y25CcVFlb0JML3R4ZlQzdGxzREo3VkJqUThFRlloaWlaZTY0MGRE?=
 =?utf-8?B?WUt5OGJPN3YwMkFzbUplNEY4RmRia2hzRUpZUGp3MVA1VG85UDVMNGhCVWJH?=
 =?utf-8?B?dmZCRUM3aTUwZVdZL2I1Nk5zVDl4MDJXN21VMFJubjVZZlgrR0xRUVVNQWtO?=
 =?utf-8?B?NGZWNjhOM01QMmN5SGxsV0pHaTNPQ3NxWFQxbVRJLzN6WWxVc0N3d3IyY0lo?=
 =?utf-8?B?R0ZMb0JjMDlSa0s1dm13V2k5cXZrMFhSVi9LN1RWL0o0NlE0djdWSFdEQzE2?=
 =?utf-8?B?c0xHdFR1VnpHczFjeGJ1U0RjSjExamFuYWZmTmdyQU95dW1MZkVZV3Fvc1or?=
 =?utf-8?B?S01ZMTBDTWFWYzZUbWcvVmErUmN2UUNlRGFJbHhuK21HNHZDU3Fpek54S2Iy?=
 =?utf-8?B?cUVsUFl4bW5sRjBaMm5QM24zZGtIY2xLaDJGT2FUeXgxVGFudGtmNnpmRUJX?=
 =?utf-8?B?Y2d1S1RYYkNkTHlnaXc4NXBXbXhwbXdaaXNpazArbG9SamRGdEpsR3JydTNC?=
 =?utf-8?B?a3VUNTRJeHdEVnhURytVajgrazZ6b3NnVWdTYU1uL3QxZmJjQkxWZzVUTVZS?=
 =?utf-8?B?bjhHbHMrd3hVTFl3aXVyNjJrQzBOOWxFMHlLQjJPNUVTU1UrZUJCSDB1VEV4?=
 =?utf-8?B?N0F4Y2szOWJZamQxQXRRTEVjVmt0QVA0bXNkYi9aODg1ZjlYNDkrbXZVYisy?=
 =?utf-8?B?RHFWMnZDcWNzNCt6WGhlMHRVbmphaFNwa09PTWovMEZYR1BEcXp4eTZvVGF0?=
 =?utf-8?B?bHhvVmlQb1c3OGgzd2g2NythM3R5Y2diOWRXVzJ4NGVHOW9yNUZkQ1k3RUhE?=
 =?utf-8?B?RXlSS3lVVGNnRy9takx1RWFGU0I1aFV0R2gyTW5Jb2VoaXNPbkxKTEJoRVpH?=
 =?utf-8?B?VlhXSUJYaVYzWm1aZGdqNW03N1FpdFc1K0RuT0M2ZFhiZ3FoN2t5c0RKWUQ2?=
 =?utf-8?B?Y1JvVkIvL1NwYUdLZE9YcUpVZWZjVGhCN3FjakNMdkRjSjI3dFVydU0rdTJh?=
 =?utf-8?B?aVE0Qk1na2hLSkNheFliSmhQMTlPZzVWcG1vRjVaTnZnWDgwTiszaFQrdGZZ?=
 =?utf-8?B?S1lkbzJDZExvOTAyUmoxampSV2kvZTB6WTdaTDFoVldqSGd0TUJQb2JOQVNL?=
 =?utf-8?B?U0pvNm5uZ2JRS1RCTDNsTzRlelRCSHl1a3p4WDArcWFKaldXU2g5OGZkQjFl?=
 =?utf-8?B?Zk9DbFFOWUM4OC9uTU1ESjY4bEYySHBNVHNsUzRxV1pxMXc1OGlrUFgwM1Z4?=
 =?utf-8?B?TFA2RlFpWU1Zd1EvUStGY2dEVnFVSmYxaTczOXlxRjl6enZaMnlEQlZXYVps?=
 =?utf-8?B?bVJBcjRnZytOY05xSzVXNXlPZmdIWmNFVEgyQjh4K05jT2V2NkdCc1Rhd2Vr?=
 =?utf-8?B?WWxEVzZWMmxPU200c1ZQOGoyUDBkQStKRDlKT0paU1VCZnJEcFFFNnM3VHNQ?=
 =?utf-8?B?S1B0Q0tqU1FOQktseEp4V1VvSkVvQXlNN21ZUjlQOWxGbDFnVkF3ZGw3SGNT?=
 =?utf-8?B?WkFpNEFMZnBrTmdrcCtTY2VuT0paU3NyMGtMNEd6b0MydklrQksvcGR0eDRP?=
 =?utf-8?B?T1VlSzdXTi9DaFhuc2E5ckRqaTJiWEEvbjNsT3hXaFhEMDVXdk5Ia3NGWUF2?=
 =?utf-8?B?OEpnRjVxT2FBa1Jqcy9Dd3A5c3JBSTk1MFYxSEhXeklqRnRrSDYwRjM5Nm5t?=
 =?utf-8?B?czJXZ2pJV2tmV3BzT0dtOEFpR2lTSHo3cnEwQmNIMjAzY3MxRGpTQUEzN3Fj?=
 =?utf-8?B?b0hzZ0VFZFdZYXlyRWtQaGVTMFU1YXhSWnR4WWczNDgvRjhYVHJqSldYMzU5?=
 =?utf-8?B?dWNDdnZYdEQ5NUNvaHhTQ2RWRzVUVkFCS0oxQ0FzNVd2cTgyVkIzNFFYZnBK?=
 =?utf-8?B?K2pTOS9oU2dZTUh1Sy93TFY3bXNscUNjdnArdEczb1lSeE5VZWlBSklzd2Y5?=
 =?utf-8?B?bzNoTHNyODlKMTh4UzBCWk4wSXVpdDZSWnlqZzZlcWV6WjZpTkdSOVZzU2xq?=
 =?utf-8?B?UEhOVzJpYys0amM0YndGTklpQ0p6QkZLenNxaUtJVWlCaFBFN2t2ZUNxcVMv?=
 =?utf-8?Q?nrCV/cMPVaz/o6yS3t?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cba416-cbaa-4960-1466-08de5fdc25ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:47:06.9340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X51ms7P2mSqWn1tw5OGYbMkncbjH/t3FiqqLm3DJZV+uZ6ZJJ+x+xj9OeKh295ZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9527
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
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,google.com,linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 1C3B3B89EE
X-Rspamd-Action: no action

On 1/29/26 15:58, Jason Gunthorpe wrote:
> On Thu, Jan 29, 2026 at 07:06:37AM +0000, Tian, Kevin wrote:
>> Bear me if it's an ignorant question.
>>
>> The commit msg of patch6 says that VFIO doesn't tolerate unbounded
>> wait, which is the reason behind the 2nd timeout wait here.
> 
> As far as I understand dmabuf design a fence wait should complete
> eventually under kernel control, because these sleeps are
> sprinkled all around the kernel today.

Well it's a bit different, but we indeed guarantee that dma_fences complete in finite time.

> I suspect that is not actually true for every HW, probably something
> like "shader programs can run forever technically".

Nope, stuff like that is strictly forbidden.

Regards,
Christian.

> 
> We can argue if those cases should not report revocable either, but at
> least this will work "correctly" even if it takes a huge amount of
> time.
> 
> I wouldn't mind seeing a shorter timeout and print on the fence too
> just in case.
> 
> Jason

