Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85072AA7CA2
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 01:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308B710E975;
	Fri,  2 May 2025 23:16:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L2rr8FxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED6310E975;
 Fri,  2 May 2025 23:16:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WLOJRNLoF+hORg4VVvyXfPEA7VhnsMVSADwPXHII+a4Jm9gmwLGj2ms14jzD9YayUJxlF2UHz8s6icAgHRPqEMqAa4Yu5O4tymFGSS3AXX8nSLP7Eq/T+iI/RcyAnnh5mwYEE1/LPSEbGWtQzDEzbe7wUdrh+Y+DZtt17mOIrZ5txesbS8LSt+C1gjj5d4YafvGykNZwFTYU6W+FqbViRjyGKTOeUiMtvDBigJrwU2eDacMAAKH2OK/ttN8Zn9ZxMIOr716g2RyAZAcAirIKtv8+KH0U9ncKmCxmPAOV8JkrNkwJjGZVdE7IKEPbjkPdJe5a9zxGawzfM8abHM85Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lePTMexvxkTcrme1YUOubjj2TcMdDK5HLjTf3MruRhY=;
 b=Kcj1uC72+mjf+lMAZ9uS3RZ7V1XbwrcvJKdNJS8wSiJBIgEMzn2/TEDAgqyk2IhNjvuW1pahDQ8zPhIzdOU5b+svmyCJ2WVNSE5L0I4SmQvXRHL4jax+16gaEL/GBBr7VJgkEOikl13CRxcaSr1iR11hrGAYRnJqT8hrI+xXIchDPOHx/SsES3u853EYy/1t8t0g8Zq0FKjXTLgTaNDU6VYP2HmpE3Nt1UKGlSsNwqElSmrBX8F2AagcRYoNbPulDdlEA19z9wOHnzlv4by5W/hrkFiT0jNBiuHMqIHxkJpIBQgsFk/bodgPaAhkCL7TAWDMBXn+gFVuj599DBDuZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lePTMexvxkTcrme1YUOubjj2TcMdDK5HLjTf3MruRhY=;
 b=L2rr8FxXHE/YxAuo9xmkF9fycbiDbyjsNbWLTytO6wXxzgmL7mqinS/+FnarrXMXShd147D/vdFDpVcSUBu6TVOKT1qPIWZYG4hjTMDg7mJlMcHUMyhuNgFOcRc3iVWUAWJJT4L7JfPiOGFmXBNDSkca9Ltj8H/Y3k/+Q79yEyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 23:16:43 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8699.019; Fri, 2 May 2025
 23:16:43 +0000
Message-ID: <f78f68ba-80e0-47ca-97a2-37a15d076e68@amd.com>
Date: Fri, 2 May 2025 17:16:39 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display/dc/irq: Remove duplications of hpd_ack
 function from IRQ
To: Sebastian Aguilera Novoa <saguileranbr@gmail.com>,
 harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch
Cc: saguileran@ime.usp.br, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250501225343.76300-1-saguileran@ime.usp.br>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250501225343.76300-1-saguileran@ime.usp.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::28) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d9978f1-5c70-40dd-228f-08dd89cf66c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjA2MEhJRGt6UURTRWFZWVMwQWVHMHdPOGZiVUFuMWxEOWhGdCtsZHhlRS9R?=
 =?utf-8?B?NEg5UmJXU3NMd0RENk9SMWpVRlJaOGRFZDJPbmhPbnN1UUJ1QkM3TUpmRnhI?=
 =?utf-8?B?ZUZtNTNhdHY2MWpUY1FMcnVncXgvMFllelVPNWV5ZkhWYmVJbzNIWVVzYmVm?=
 =?utf-8?B?cTEzZ0RMbGhNMWc4SG1WeHRzNnl5TE41clUrVHBSYjJ1eWtDNDZpU2xSMVpP?=
 =?utf-8?B?SDVwM3JrQ2MvMHN4bHo4cEpVeUZyVDZUNnV0Qm10Yk01OWlXUTBHSzJZZjR2?=
 =?utf-8?B?S0FKYkxHRXpJMnpjbXRUS1RZUldMS3VpdGdGeGhTbXZzNk9IeGk1RGRsd1Q3?=
 =?utf-8?B?RFZDenJiMUR3S2NKV0VzNXUxK011M05HNHpiaUUxTzc0cTgveVJMY1pNQ3ov?=
 =?utf-8?B?dGVxMGtmYUFFV3YwWlkxZjQzeVU4Z2I1M1pXVDc0d1JXVlk2M0FrbWRQeFhT?=
 =?utf-8?B?dUZxWjlSSDdEbDl2OElnallxeitpMFlmWnkyTitPYkFMZmwwR2hDT0ZuU1Z1?=
 =?utf-8?B?QytqV2dMK25HeUMxU0FmdDBHQSs4WGs4NEtaRmQ5eTJDWjRoOWhUSGdEeTV1?=
 =?utf-8?B?OGVWYURyZUdwOHlZczNvbTdsOUVjcWRtbkw3SUppNzFTNDhKWEtFZFJIbGpn?=
 =?utf-8?B?eGRpNTJteDFqSWdscWlQM1FJejVOVHlocitmNnd2ckRUVTg5Wk9Rd0g1blFx?=
 =?utf-8?B?UDdLQlRjZTdQU241TFIrMlp4RXdmanpSWm50T3dmODFhZmdMMkFmVUVMTjhL?=
 =?utf-8?B?MzVCdUJ2UzBBcmtUdWV4WTB2cCtYQXROdHh4S25tYlFQaHZ2N2R3VklLUVpp?=
 =?utf-8?B?MFlUVElCMkZLZW95WEMwL052cVFBc2VkSmxKZzJmTHRPcXJLV01jQnlWV0U2?=
 =?utf-8?B?a2JFWXBUYkZKR0RhWXBNL3VqY2ZhT3pFU3ZwZDBQRDZqT2Vsc0x1aGprZWRD?=
 =?utf-8?B?N1F5eGRvQi9ZbUhFc1c5STIyVUNJRFFHb2RrU1JmSHBCVjJBbVV0LzU0WEM2?=
 =?utf-8?B?bTBMTjk0M2RDZE9jaU5Xa1JhUFd0STVJMGVSTFIvUTl0bitZNkxDS3BrQWlp?=
 =?utf-8?B?RURqUk0rczRCd3VWYlVNZEdJMENndkZmRHVjTTYrZW1YNEpycTJsQkgrS29h?=
 =?utf-8?B?MUJHSkh5d1pObTZwU3VET3p3N0ZYc1hEQWI3QVVoMHppenYzQ1V6bHNObTNV?=
 =?utf-8?B?dXp5bDBaQ2VhaWlRQW5IRWZhVzVobmlNQTFYVFRQUFVxNmFJcWZBcmRSa2hR?=
 =?utf-8?B?cjdNL3JrYU5GZ2k2dGd3ZkhBWXp6U1UwNHpieGlUdDlQUzBjRStRNHpiMkhL?=
 =?utf-8?B?cWRzYVVFcHFCK2pEOTFwMDcycmRtVG1wLzZ2cVVta1d5SUZCRUhDaTFGTHBH?=
 =?utf-8?B?b00zZ2lEZTEvR1JadzRtbFdVVHhOUDNoU0tBbytXL0hIRnZPUmZOd0tIdXd4?=
 =?utf-8?B?SnpJK1RuaS9NY0lyOS9XN3pQUEwyN28zYmNUb2h3VHQzQWVGRDNreE02MG9a?=
 =?utf-8?B?Y2ZNU2FDT3NZYVdSUUlCN1FtSzRZUEN4OVFEWENnQkdqaU15Z1BIajRUL1cz?=
 =?utf-8?B?Q0IvVmkyenBQY0FvZktCbzNld2x3NHh5WTAvdHlWeGhiMXhjR0RONEtJT3Z6?=
 =?utf-8?B?bW52UXVUWGtrU0VpNUpBSWhsczYvL3BDTkQrKzcvOTdpQjlhdXV2TDc2emFY?=
 =?utf-8?B?MndxdzdSZVpIZTRWaW5IeGZ2OTAydDJFMHlUUVlUY3FPTnYza2ROdUhSZ1hU?=
 =?utf-8?B?cld5MVNOK1VtSHFpVU5sdStiSVFlMXZraXZVbVl0aGNnVWJBaDdyTkRUMlMr?=
 =?utf-8?B?K0M4ZnQ3TEExWXJRcXBYaXFwc3pMY3BlcDNZZWhXbVQveHZTUmJnaU1VaFdM?=
 =?utf-8?B?MnFwUHgvaWt3NWc2UytDbU9PdlRCK3Z2U2t4c2taenZHYUdCenl2ZEZnVHla?=
 =?utf-8?Q?uUOtODNpVfE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q09BOS9nSG5WNXhxMCsycXovMTRiOTdob0VVOVhLQ2FnVDZINjk0N0lKQXQ5?=
 =?utf-8?B?YUU1NXJCRUxWY0JHdVlLWUFXMktYcDRpZE5vcFViTmZ1YVZqQlc3WnEvejF3?=
 =?utf-8?B?R2EreEdDZ3VqT2V2QTFYMDVHbXRta0h3N1NPT0dnUUR0elFGK0RONEEra0sw?=
 =?utf-8?B?NnM2MUFRWE9xQ0syeDc5TDhhQit3WXlaWnBSQS9ORzE4YTl3S3ZwSmVETDBC?=
 =?utf-8?B?TDVZaWs0NkpKN0dBQkdRbjVXMUlva3UrT2p5RmNPaWE3NUJLTUtsQXZSd2o1?=
 =?utf-8?B?bnc4TVBEeCswdUovZ3dHU0ZJaHpFYWN1MUlYK1JIOFd6RWxiYWkxSjc4MmJ2?=
 =?utf-8?B?UkdhTStjMU04Y2V6WTRRbVZSNk9Eb3hFc20zUDVTUjUxY3liMlE5YWN6TVQ5?=
 =?utf-8?B?aVdaVHJtSWY1Uy9ueHAveTZVc3FtVHpPVFpKbmswSGdiTE1GblFscEVZVmQr?=
 =?utf-8?B?eWZRSHVRbEVjaWNDdDgzejlsTHdpOGplekFaeUtUTWxNNnlMZTlZZzVJUUxn?=
 =?utf-8?B?dHN4TTBFdVRxK3J2QWZzS2lTUGFrMVBOQ3Z6MnBBbzQvUmtCUXhxb2JQbGN4?=
 =?utf-8?B?cnlwN0VaOG5jVUhSMURLK0Fra2E4WTluU3FTQ0M3Z3dZUzg3UmM5SHJPTUxZ?=
 =?utf-8?B?Z21oazZKQkxXOTRLWUd1WkJlZ1F0UUk2VEh6TFMrbGlCR04rSWdvdXVxSlpL?=
 =?utf-8?B?QzI2WlIwVUt6WE5JM2Z4VGxaZWdUczdjUXQyYmZmK2VkLzB2UXJtbXhONVRl?=
 =?utf-8?B?QjdYZXpWTGpiUWdva2JWcVhZT1VDNC9jaEFVcnBPbk5wcmdmbmVQVFhZaHFo?=
 =?utf-8?B?bVpBZEZjV0tRc2FaQ0NCWXphUVBsWFZBWWtBejJSS2k1UUUzbkRvaEhuYVoy?=
 =?utf-8?B?amRDVXV6aHlLRlF1TXdnNlpPUGhwbkZzY2M0RjdBNVl2Z3Vlc2Y0eTIzeWw5?=
 =?utf-8?B?OGd0UEp0djc1NjMvVmpzUkk3VEp2TVB4cnFEb0sxK3hrbjNWa3hqM0R3ZC9v?=
 =?utf-8?B?RTlObHlKai9DWVdDNjlPSDk3bGJJRFNRMTB0bDBGRkcxSy9Ma1VKWVRjOU5h?=
 =?utf-8?B?MEF3ZDVHR2hMNGRkbGtYL0JtL3hHV3JpQ0ZqbkU5TVJVdWZhUkdzVHo5bk84?=
 =?utf-8?B?dDNDa3dNMC9aTTZOTGhrWmI2Z29kTVkvYjBNT2Z1WGxzTGZ5eDZhbTRDWHlJ?=
 =?utf-8?B?ejJMeXN0SnJpc2VFWSs2cFVwSE9ZTGJPVjdyM3QzTTJtcDFNbWxwZ1R5TVg2?=
 =?utf-8?B?MUVLSVVkcEd2alE0UFNUNFVlQXZUdk9uTHE2Z0VmSVFCUXlJMzFCTmttSis0?=
 =?utf-8?B?Z0c0TEVJREg4TDBHZERBdS9jS2NMeTc1dFNBcXlKY3BsRzhDTmJ1USttWld4?=
 =?utf-8?B?dHhBYTNUVEZ1M3FXbk5lQTNwRXJtdzJwbGlmMHJ4MFNpQXBsVHRudFpaMnNx?=
 =?utf-8?B?WFBVWkJXL3RzUkxHR3pMS0RMK1ZmV3lhTUVUZ3dWZjZGMW9YeVMxdTVoMEFh?=
 =?utf-8?B?WURZZnRxWUkxS0lSWStRdTZ6M0dKNUprRzBUeFV6L0ZLMGNlVjdKU2tiNnpQ?=
 =?utf-8?B?QTJFejRLL0xsNWhZV0JyWG1BRjdkMmUrczQxWGdLK0VjU0tUNGZXd3dJRnZi?=
 =?utf-8?B?QndYUURWR2dCTGkxNUpLanlVbSszTXRqVmRWa05yTUd3dzJOTCtSbGZFcWdO?=
 =?utf-8?B?MGY0WG5Ec1Q3WFMzSSt1aGd6Z0J2dTRaM2E2azdwS0RuNWdVdXVWM0Zid2s4?=
 =?utf-8?B?RzNuNzZiWmhEQlc4OHBYaHlCZDBCQ2twTmRoY2tjNUkxMmZzakY5L3hWODFj?=
 =?utf-8?B?V2syQm1iUEREVGYyT0xCVFJzYU53YkFKMEFNekRqTVVqamlSUS9OejFXVWNl?=
 =?utf-8?B?RFE2TzNOdzY5RHZCNmZjYjZHTU5mbnZwV3BMNCtzZWZPZVRuKzlvaVJFN0JH?=
 =?utf-8?B?bzFia2dYVUZjbjZtbU8rRGNMbk5VVmtxK09RV0FoRTViLzJQY1Z6RndjaG8z?=
 =?utf-8?B?bnF5S2NmV2lNWlozTDFYemVQcEEvVFZQY1BVOFlmcGhJUjlLVnpEaW56Qk9m?=
 =?utf-8?B?MExoMGhjL3N2aXBrWFlUVW1DK2xwZTZtZ2FiVGtMQnRpcGRYbzdKakxRWVRk?=
 =?utf-8?Q?pV+AFqvhuCewgDSaJz8vlzn2C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d9978f1-5c70-40dd-228f-08dd89cf66c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 23:16:43.4002 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3Bx5ms5rXYteNGfAHnTG91kgi6QCUPCdMLdP6qrBM/iequSJGaSilX34KQ87AxbHNDewV3I+omN2QTdVmcYuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
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

Hi,

Thanks for fixing this.

However, I think checkpatch reports some warnings, including spacing 
warning and a mismatch author name vs SOB as below. Once they are fixed 
in V2 I will send them to test.

$ ./scripts/checkpatch.pl 
drm-amd-display-dc-irq-Remove-duplications-of-hpd_ack-function-from-IRQ.patch.patch
WARNING: please, no space before tabs
#816: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:44:
+#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK 
^I0x00000010L$

WARNING: please, no space before tabs
#817: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:45:
+#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK 
^I0x00000100L$

WARNING: please, no space before tabs
#821: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:49:
+#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK ^I^I^I0x10$

WARNING: please, no space before tabs
#822: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:50:
+#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT ^I^I0x4$

WARNING: please, no space before tabs
#823: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:51:
+#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK ^I^I^I0x100$

WARNING: please, no space before tabs
#824: FILE: drivers/gpu/drm/amd/display/dc/irq/irq_service.c:52:
+#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT ^I^I0x8$

WARNING: From:/Signed-off-by: email address mismatch: 'From: Sebastian 
Aguilera Novoa <saguileranbr@gmail.com>' != 'Signed-off-by: Sebastian 
Aguilera Novoa <saguileran@ime.usp.br>'


On 5/1/25 16:53, Sebastian Aguilera Novoa wrote:
> The major of dcn and dce irqs share a copy-pasted collection
> of copy-pasted function, which is: hpd_ack.
> 
> This patch removes the multiple copy-pasted by moving them to
> the irq_service.c and make the irq_service's
> calls the functions implemented by the irq_service.c
> instead.
> 
> The hpd_ack function is replaced by hpd0_ack and hpd1_ack, the
> required constants are also added.
> 
> The changes were not tested on actual hardware. I am only able
> to verify that the changes keep the code compileable and do my
> best to look repeatedly if I am not actually changing any code.
> 
> Signed-off-by: Sebastian Aguilera Novoa <saguileran@ime.usp.br>
> ---
>   .../dc/irq/dce120/irq_service_dce120.c        | 29 +--------
>   .../display/dc/irq/dce60/irq_service_dce60.c  | 31 +--------
>   .../display/dc/irq/dce80/irq_service_dce80.c  | 31 +--------
>   .../display/dc/irq/dcn10/irq_service_dcn10.c  | 29 +--------
>   .../display/dc/irq/dcn20/irq_service_dcn20.c  | 29 +--------
>   .../dc/irq/dcn201/irq_service_dcn201.c        | 29 +--------
>   .../display/dc/irq/dcn21/irq_service_dcn21.c  | 29 +--------
>   .../display/dc/irq/dcn30/irq_service_dcn30.c  | 30 +--------
>   .../dc/irq/dcn302/irq_service_dcn302.c        | 19 +-----
>   .../dc/irq/dcn303/irq_service_dcn303.c        | 19 +-----
>   .../display/dc/irq/dcn31/irq_service_dcn31.c  | 29 +--------
>   .../dc/irq/dcn314/irq_service_dcn314.c        | 29 +--------
>   .../dc/irq/dcn315/irq_service_dcn315.c        | 29 +--------
>   .../display/dc/irq/dcn32/irq_service_dcn32.c  | 29 +--------
>   .../display/dc/irq/dcn35/irq_service_dcn35.c  | 29 +--------
>   .../dc/irq/dcn351/irq_service_dcn351.c        | 29 +--------
>   .../display/dc/irq/dcn36/irq_service_dcn36.c  | 29 +--------
>   .../dc/irq/dcn401/irq_service_dcn401.c        | 29 +--------
>   .../gpu/drm/amd/display/dc/irq/irq_service.c  | 63 +++++++++++++++++++
>   .../gpu/drm/amd/display/dc/irq/irq_service.h  |  8 +++
>   20 files changed, 89 insertions(+), 489 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> index 953f4a4dacad..33ce470e4c88 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce120/irq_service_dce120.c
> @@ -37,36 +37,9 @@
>   
>   #include "ivsrcid/ivsrcid_vislands30.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> index 2c72074310c7..d777b85e70da 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce60/irq_service_dce60.c
> @@ -46,36 +46,9 @@
>   
>   #include "dc_types.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			DC_HPD1_INT_STATUS,
> -			DC_HPD1_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		DC_HPD1_INT_CONTROL,
> -		DC_HPD1_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd1_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -391,5 +364,3 @@ struct irq_service *dal_irq_service_dce60_create(
>   	dce60_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> index 49317934ef4f..3a9163acb49b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dce80/irq_service_dce80.c
> @@ -37,36 +37,9 @@
>   
>   #include "dc_types.h"
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			DC_HPD1_INT_STATUS,
> -			DC_HPD1_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		DC_HPD1_INT_CONTROL,
> -		DC_HPD1_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd1_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -303,5 +276,3 @@ struct irq_service *dal_irq_service_dce80_create(
>   	dce80_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> index 9ca28565a9d1..4ce9edd16344 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn10/irq_service_dcn10.c
> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn10(struct irq_service *irq_servic
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> index 916f0c974637..5847af0e66cb 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn20/irq_service_dcn20.c
> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn20(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> index 1d61d475d36f..6417011d2246 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn201/irq_service_dcn201.c
> @@ -80,36 +80,9 @@ static enum dc_irq_source to_dal_irq_source_dcn201(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> index 42cdfe6c3538..71d2f065140b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn21/irq_service_dcn21.c
> @@ -132,36 +132,9 @@ static enum dc_irq_source to_dal_irq_source_dcn21(struct irq_service *irq_servic
>   	return DC_IRQ_SOURCE_INVALID;
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> index a443a8abb1ea..2a4080bdcf6b 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn30/irq_service_dcn30.c
> @@ -139,36 +139,9 @@ static enum dc_irq_source to_dal_irq_source_dcn30(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> @@ -447,4 +420,3 @@ struct irq_service *dal_irq_service_dcn30_create(
>   	dcn30_irq_construct(irq_service, init_data);
>   	return irq_service;
>   }
> -
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> index 8ffc7e2c681a..624f1ac309f8 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn302/irq_service_dcn302.c
> @@ -126,26 +126,9 @@ static enum dc_irq_source to_dal_irq_source_dcn302(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   		.set = NULL,
> -		.ack = hpd_ack
> +		.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> index 262bb8b74b15..137caffae916 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn303/irq_service_dcn303.c
> @@ -77,26 +77,9 @@ static enum dc_irq_source to_dal_irq_source_dcn303(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(struct irq_service *irq_service, const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status = get_reg_field_value(value, HPD0_DC_HPD_INT_STATUS, DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(value, current_status ? 0 : 1, HPD0_DC_HPD_INT_CONTROL, DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   		.set = NULL,
> -		.ack = hpd_ack
> +		.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> index 53e78ae7eecf..921cb167d920 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn31/irq_service_dcn31.c
> @@ -128,36 +128,9 @@ static enum dc_irq_source to_dal_irq_source_dcn31(struct irq_service *irq_servic
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> index e0563e880432..0118fd6e5db0 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn314/irq_service_dcn314.c
> @@ -130,36 +130,9 @@ static enum dc_irq_source to_dal_irq_source_dcn314(struct irq_service *irq_servi
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> index 2ef22299101a..adebfc888618 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c
> @@ -135,36 +135,9 @@ static enum dc_irq_source to_dal_irq_source_dcn315(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> index f839afacd5a5..e9e315c75d76 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn32/irq_service_dcn32.c
> @@ -129,36 +129,9 @@ static enum dc_irq_source to_dal_irq_source_dcn32(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs  = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> index ea8c271171bc..79e5e8c137ca 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn35/irq_service_dcn35.c
> @@ -127,36 +127,9 @@ static enum dc_irq_source to_dal_irq_source_dcn35(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> index 7ec8e0de2f01..163b8ee9ebf7 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn351/irq_service_dcn351.c
> @@ -106,36 +106,9 @@ static enum dc_irq_source to_dal_irq_source_dcn351(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> index ea958628f8b8..f716ab0fd30e 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn36/irq_service_dcn36.c
> @@ -105,36 +105,9 @@ static enum dc_irq_source to_dal_irq_source_dcn36(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> index 8499e505cf3e..fd9bb1950c20 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/dcn401/irq_service_dcn401.c
> @@ -109,36 +109,9 @@ static enum dc_irq_source to_dal_irq_source_dcn401(
>   	}
>   }
>   
> -static bool hpd_ack(
> -	struct irq_service *irq_service,
> -	const struct irq_source_info *info)
> -{
> -	uint32_t addr = info->status_reg;
> -	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> -	uint32_t current_status =
> -		get_reg_field_value(
> -			value,
> -			HPD0_DC_HPD_INT_STATUS,
> -			DC_HPD_SENSE_DELAYED);
> -
> -	dal_irq_service_ack_generic(irq_service, info);
> -
> -	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> -
> -	set_reg_field_value(
> -		value,
> -		current_status ? 0 : 1,
> -		HPD0_DC_HPD_INT_CONTROL,
> -		DC_HPD_INT_POLARITY);
> -
> -	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> -
> -	return true;
> -}
> -
>   static struct irq_source_info_funcs hpd_irq_info_funcs = {
>   	.set = NULL,
> -	.ack = hpd_ack
> +	.ack = hpd0_ack
>   };
>   
>   static struct irq_source_info_funcs hpd_rx_irq_info_funcs = {
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> index eca3d7ee7e4e..fe593eba1246 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.c
> @@ -41,6 +41,15 @@
>   #include "reg_helper.h"
>   #include "irq_service.h"
>   
> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED_MASK     	0x00000010L
> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY_MASK     	0x00000100L
> +#define HPD0_DC_HPD_INT_STATUS__DC_HPD_SENSE_DELAYED__SHIFT		0x4
> +#define HPD0_DC_HPD_INT_CONTROL__DC_HPD_INT_POLARITY__SHIFT     0x8
> +
> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED_MASK 			0x10
> +#define DC_HPD1_INT_STATUS__DC_HPD1_SENSE_DELAYED__SHIFT 		0x4
> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY_MASK 			0x100
> +#define DC_HPD1_INT_CONTROL__DC_HPD1_INT_POLARITY__SHIFT 		0x8
>   
>   
>   #define CTX \
> @@ -177,3 +186,57 @@ enum dc_irq_source dal_irq_service_to_irq_source(
>   		src_id,
>   		ext_id);
>   }
> +
> +bool hpd0_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info)
> +{
> +	uint32_t addr = info->status_reg;
> +	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> +	uint32_t current_status =
> +		get_reg_field_value(
> +			value,
> +			HPD0_DC_HPD_INT_STATUS,
> +			DC_HPD_SENSE_DELAYED);
> +
> +	dal_irq_service_ack_generic(irq_service, info);
> +
> +	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> +
> +	set_reg_field_value(
> +		value,
> +		current_status ? 0 : 1,
> +		HPD0_DC_HPD_INT_CONTROL,
> +		DC_HPD_INT_POLARITY);
> +
> +	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> +
> +	return true;
> +}
> +
> +bool hpd1_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info)
> +{
> +	uint32_t addr = info->status_reg;
> +	uint32_t value = dm_read_reg(irq_service->ctx, addr);
> +	uint32_t current_status =
> +		get_reg_field_value(
> +			value,
> +			DC_HPD1_INT_STATUS,
> +			DC_HPD1_SENSE_DELAYED);
> +
> +	dal_irq_service_ack_generic(irq_service, info);
> +
> +	value = dm_read_reg(irq_service->ctx, info->enable_reg);
> +
> +	set_reg_field_value(
> +		value,
> +		current_status ? 0 : 1,
> +		DC_HPD1_INT_CONTROL,
> +		DC_HPD1_INT_POLARITY);
> +
> +	dm_write_reg(irq_service->ctx, info->enable_reg, value);
> +
> +	return true;
> +}
> diff --git a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> index b178f85944cd..bbcef3d2fe33 100644
> --- a/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> +++ b/drivers/gpu/drm/amd/display/dc/irq/irq_service.h
> @@ -82,4 +82,12 @@ void dal_irq_service_set_generic(
>   	const struct irq_source_info *info,
>   	bool enable);
>   
> +bool hpd0_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info);
> +
> +bool hpd1_ack(
> +	struct irq_service *irq_service,
> +	const struct irq_source_info *info);
> +
>   #endif

