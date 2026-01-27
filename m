Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOsTD1U7eGnsowEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 05:13:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E78FD00
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 05:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCEF10E24C;
	Tue, 27 Jan 2026 04:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fbnJfZOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012039.outbound.protection.outlook.com [52.101.53.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1653410E24C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 04:13:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W27nwjKQcIEJITEDxeYiT9T31b5mUb3uI3+bh42ZoBQ5MKywh04F3B4Tr+UUZISm8IEuIkwAmNKGKZ6IS0VrDDIqIe62Hz4pFqg6zJmsi0kMv0NZjb7M7IYg4YlDYFME5QpEH92awT9/mmMWB0KocB8Bzpeouxp73LM3+7x+WR2C/8y38YhzmEm1hnNPYizNzXzRlT3M9zZeU88wWkYXdXfhmlMIeOrmYSBoTIVl/vHgjN/dAS95wc0AqpCD2uKu1GTeqaNEcaGRmKPd/TYRCFPCGdW/cf1MlrpxWwLmb8YHlmQZqljc+xFCzP0K03wxbmzjXv1/JtyWjgF85ySAsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZZBgsYGulyhebia/eHFdL/VnOE7mBtukBjkRc+Bs6E=;
 b=IBq230HQXsZB5h9oxbbrnOcpF6IF+KyW57+XMEauRqHuwH48qQ/fhQ8JT4oD/MRvVvv+qwNsuwUAd7uFDqopT6SZdY+zpOhuw7E4kd66ilUVscFD0uD8Yi3/PLxxBoO7H4mbpdSVFg+WYGAAeWkXwPOkpYluUAQzxy5CvQRxBoWN4mM4L/5Bl3fTjc995AcClOEDrbNRMyi1bKOheFmdqu9Kt1PVxKuTn3W0GOOcj2A/rHc/axmmgE8OLlBfupGtlCCwQaL27tY17/LX4BEvxrWQ57oAWT6QQbiqdvhphFHVt+OW2yx9FcI+aT0l3aJvPfiNRDlIt7PcbQk888Z2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZZBgsYGulyhebia/eHFdL/VnOE7mBtukBjkRc+Bs6E=;
 b=fbnJfZOw/UA5Eu6zweLJLtlPz9PIKmD9Uuurx75iXNNERyZrAXtowV0rSB+vfNxZRulqqfCWIePyqEgBl2iSa+69c4S47iMSjA7llsm690UqNaRO5jnBUBVW5ELa9GdodK2l94JuKDDHRuVK2cV0cqYGbJua5Kn8nuRn8ra6p/UeM5REAziFwEQj4ovaLVkBJwC4G7QyMFGCwKUkxfEMKCjt6BfNNEMRtVFYHshoPuYdPvoEvZSaFQy0KwI08+LwjWVMhPyezjz2Nr1J9Vuvy1Rkir9hCzJSmbiLc3P3Z6RauMzQ/P3xj4xJ2rnN5rIgtYOxrYP1Yk23DgS9FJ1pqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 04:13:00 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Tue, 27 Jan 2026
 04:13:00 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>, Kurt Kiefer <kekiefer@gmail.com>
Cc: Jasper Korten <jja2000@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
Date: Tue, 27 Jan 2026 13:12:54 +0900
Message-ID: <4318175.BddDVKsqQX@senjougahara>
In-Reply-To: <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
 <8615742F-EE35-4B37-BA0A-D62FFD5424B4@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0159.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: d0dc2914-5b82-4005-3263-08de5d5a5bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFBvQjA1YnRUMkdrNXFmMEFGdEpoWUxnOXdQS1NabEJOR0hTZnBvTlVMWFRv?=
 =?utf-8?B?M1d0VnFPQkgva045TDIwRzUvNEUyN05XU1RaTVlSdW9iTzc3WHVUN3VmNk1X?=
 =?utf-8?B?MXkvdnNXNyt5NGVzQnp6SFd1SzlQUHFFQnl6ZnB6VEVFNnVLRnRNaWJFbEpK?=
 =?utf-8?B?Y1VZaTZZTWxYZmI0WkNsUG9Wbm81cjFIaUJxZzE3andQdGRnRVRhS3JmWEJp?=
 =?utf-8?B?YUdTOHhSVDloN1NlR0svOGNaZUxtTWkrKy9DVTdtR1IrQXB2SFNXbXJYNm5z?=
 =?utf-8?B?K0N3aEpKWE1wcVozZ3pBN21XN0FWK1Fyb0tGelQ2UVR1Q2FIcTFqWE5DWXBK?=
 =?utf-8?B?OWtPYUFzSFFLUnAyZVVsVWwzRkIvSlpOYTJjUnVYRWIzangva3hRQWoyUlZ6?=
 =?utf-8?B?NTZpeFJSNnNmU2lDeERuRDJkWWgzYXNOUUc5NkFpUjFoVUtBTHFhRjFNVy81?=
 =?utf-8?B?bkxCWWUydkhYTGNJNjUzSitIandwTWJXaEtKUUlYazAzSFdxNkd4ZXhUQWdh?=
 =?utf-8?B?Q1ZMMWwyMzlIMk1MMmp0cVgvdWlrZUJKdnZ6YmUvajAxN1pPN1JmQkFlbTZ6?=
 =?utf-8?B?bGFTV05PSWtISkRKb2FXZUlXY0FtOW9mUUFmcWxnUlAvTmdYQmE3elYrVkhL?=
 =?utf-8?B?aGMzK0k3NSszeUJXeHoyVFJUbjB3YTNDZDRIZ0hhaldUNFJlVWl6d2RjRVJz?=
 =?utf-8?B?cGZZNlpXN2FZYUhZT09tRzFla3RHcjQrVEdnZmRiWmV5TElkZUpqcmlHcDFo?=
 =?utf-8?B?ZHRXNTYyc2dvTHlRelNKbkFYd2MzY3VPZ1ZvbFF5SytIK29mUkw4TlVXM3E0?=
 =?utf-8?B?UE0zQndnbkpXd1BtYUg1MTZnZjRaYUw5K08wSEdoOFRaTnNRcGI4ckhwdS9k?=
 =?utf-8?B?VzA0SVdYYUxCQTA1Rm8rRXlQMUw1YTN0aU00M0NMR09HNWNhOEFVUWE4YTBi?=
 =?utf-8?B?ZjNDOHpVYXhoVUc5TmpORzdvbEdDK3BhamxyQzlQeHNHSzMzbEYwRG9DOGw1?=
 =?utf-8?B?eGRCMXBPYlFmaWgyWnJ5Y05JY2ZlVGx1VVZDWUZPUG5vTk1FckVmQktaaDFt?=
 =?utf-8?B?TVpyeFQ0K25FVFBWQzZCS1JxdVFEU2kxWldRNkRsSEdTa0RDMFE0ZTZjNnpB?=
 =?utf-8?B?V3JPV1ZQbVJOQ1JwVHBLckpOQlltekExKzBBcmJLQ0IvM1EyK0pJSU9MQkQ1?=
 =?utf-8?B?dnl1cWI2Y1Z6RUtnRmxYWjgxOXRVeWNCZm5wWER6YUo4b0tBSXJrdmxYbWJn?=
 =?utf-8?B?b2hwc0lSUTZjbWpXZ01QK2I3eUJqV0F6WSsyK2RNZ0FBby9KclpUVFZiMytX?=
 =?utf-8?B?VjVlZ2VxTS9iNnl6aUIwSzloaFdGdllnak5nbkRiVUxGWCtDZnowQ3F1Zlh0?=
 =?utf-8?B?QW55cDRtWW14ck9xaExiZTFSK3MrR3c4dzYremphWFI1ZXMvVEMvUU1UbG4y?=
 =?utf-8?B?eHMwWVYyWlBYbUtRaWdOZ3lxdWR5QnVlNHE3bkl5UVp6VFNYeGdpMHhQYjNX?=
 =?utf-8?B?Q25ndEFDRzhqbTl1Y0FhMGZ4UWNNMEUzRnJnZFNORitFUTZ1ckdhcnowSEJa?=
 =?utf-8?B?NXdJa0FFUHRzeW1xdkFJMTh1U3RLYXpPWGVLRU1CMUV4eFB3SitQK0EzdmdJ?=
 =?utf-8?B?aEtDejlpWnUza1FmMmRZUnJzVlUxcmpMSDQ1UlRlMC9pWE90RTcwVHYyRWlG?=
 =?utf-8?B?SjR1OVRldXlVSVl3Ym85L0RwOWM1SjVpWFFUck5pRkZhSmxwdkVpbjhwV0Zn?=
 =?utf-8?B?SHBBVmp1Y3BNNTduL2pQTFRYZzNIUEdDK0Q1RUZJd2graVFIbW9QV0JOcjZ0?=
 =?utf-8?B?cG1xbnpJZDQxNmU4UzF4SnlMME1xd0RnQ0lEWlUzTlJqOEVpM01oSytwbnlk?=
 =?utf-8?B?bDlRemhDOHRVRjFNcFJkcm9XQ2U3S0JyTzF5TEJ3UUFTc2pkbTNHZVpnR0xG?=
 =?utf-8?B?NFowTUVhUlNpeGhId2k0dEVMMUM4aUtpNXp2aEx1RTEwdEJjSUVlU0RHNkZh?=
 =?utf-8?B?UEEwaW1jZlNaL2JJdmhqZStmMXQxS0RuVDdGVFdodUlGcHFBRktKNGZNakRZ?=
 =?utf-8?B?QnRYVjhtZzlxcTY0d1B0QWN2NWhnVjdlNDViM00wKytnN3FvVWo2ZW9TalI2?=
 =?utf-8?Q?bNlo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OExUY29RSUs3KzRlNHRDUWxTZlo4c0dCRmRFb01hQmZ6RUdxWUtkRmE0R2d4?=
 =?utf-8?B?bXF4SjQ5cDFuVmYxbGpwZ3RnUHJvN1VObFluRHV6NGhmSDRyTXcycU8vUGdv?=
 =?utf-8?B?c3dWckMxSkZzTlRHWWl1dm5id051aCtTMHFFc2pOREZEWUtiOUV0RHdmbXlF?=
 =?utf-8?B?NnJkYkJaZ2M1ZzRESGljRkZYSmdFb1RJcExJbFk1U3Y3TnB5RHJQcVQrN0g5?=
 =?utf-8?B?cTNsRElRd25yRkVZZHRhN3dna3ZZQW5xMzNVRjdCMkN5ajdFZXpWQzRsTENX?=
 =?utf-8?B?MUxzUGtvY2k2RUNlWklVU1oxVEkwRkF3dEV6UlBaeWxML2x0Zlg2U3loVWlY?=
 =?utf-8?B?dk83YTVHcEo4Q3h4TjRSM0FlaUtFQWhkWUJUbjFjQm5EQ2dlSXpxRGdxbkZS?=
 =?utf-8?B?ZTY3ejFNdDIwUCtFZ0gyZDJCRitxTVlQNmdmVDdjT0x4RG4vaS8rSkRnNEhN?=
 =?utf-8?B?SWFXVjlIYXAxOWVOeVpoWllRUzdTYWVuT1B5a21zaFdzNExkQ085VW1oc3By?=
 =?utf-8?B?VVRycjU1VThucUhKaW9UekNFQnl0QjhZNEFvY1lwM0pDYkdRSUpzbUxUU2kr?=
 =?utf-8?B?eXBYZnFRNnJGVmUvK3hCTVhPVHFNajNGQ1RBc3VRc0RqOHpxWjJBaGNUNk9O?=
 =?utf-8?B?WVNmL2liUi9IaTMyQmRZcm5FSkNFdW1VZzRXNkI5RTlxbDQrMTJKbEcwUlhy?=
 =?utf-8?B?M2pTeGdndlZwMG9XREhKREFoZmtSZis1SkVJSU5vL0lnZ2cxenp4UFUxQVNW?=
 =?utf-8?B?eTJkeVNoN0tVNGRzdm9jQ2MyaUkxV3k1bTBsZ2lsMit6MHZIeHMwWlZXaG1j?=
 =?utf-8?B?emJJdmlhcVJOT2V2OHZFc0laWXVERWxsdUx0ZTU0MkpMVEpLOGJQU0ttZjBM?=
 =?utf-8?B?NUpoMHU4MHEycWVVTVhzYUlpdVZmd3VIRU1iWFpGbTFHbDFxbTRFY0NnQ1hY?=
 =?utf-8?B?RkZzOUl0MlBMY0tTK3hDUlFWdGVJRys0aWFRRVJBRGFMYmI3SFlqL2xVSXR3?=
 =?utf-8?B?SkFBUURPRXFYRC93OExGaTBTT2xmVTRjeGdjT3ZjMUNEWmZDQlNKMmJQM0dq?=
 =?utf-8?B?d2ZRd2JHYm9TY2ZPaDRiWXArRXhwODlNSWpvS0xGcVoraXZJcisvZ3F4YWtR?=
 =?utf-8?B?RTAxNzY2a3E2YkVFWXFHbEZSSHl4YkdnMnpkUzBmK25QcmQxR0cxcHA5bkRP?=
 =?utf-8?B?YVZDcVlMVG9lOVkxdlhjaFk1am50bXBXL2hJN2VWRHRJNEhNRys1eDZSZWlH?=
 =?utf-8?B?L09VWnNnT1A5cGpDeHlUTEdmRUhHZTEzVnZXakUrUGZUNmp3SGNJY05Cc203?=
 =?utf-8?B?cVc1UUZUcENMSk9CVzFOWldEM2RyYlVmaEc1MFZUaFY0cmV6YW1GdWlDWHdu?=
 =?utf-8?B?Wk1yWWZwb1dDSWl2cWovczR6K0xWWVV1SCt0MSsrNWZBb2VtcnJZNzR0V2c3?=
 =?utf-8?B?T1lyWDF0dWh3OVBvVytnQ2FJczBPcDdyREtLMlNNTWtFc2JrRmdnTjlaUTM5?=
 =?utf-8?B?ajlvTnhNZmVTNFZOSWVKdmZjR3h0ZGswRmlSaSsyV3FtSUhGRkVNVjg3algy?=
 =?utf-8?B?WmxPWW9WQTJaQzYvQ0pyMEVlSHVXN3lWWVZKU3B1TEU5eHFESW1JNy81Yjc5?=
 =?utf-8?B?eFVtSXE2RE8ySUxlK0NOVmF3VjVwYkxJblpMTkRUUXdxYURxZ2k4WmdreXlp?=
 =?utf-8?B?MjdYNjRRUytwRXZsUFBlOUFwbDg0aG5DWmFra1E1d0QzSWxxMWs0WVNTQWxZ?=
 =?utf-8?B?UW9pVTJUdjRlVzI5Y2xGckFFV1lxVVlhSHNheTJIZXM0dGtKUzd3T1BnNXVi?=
 =?utf-8?B?WUcyV2oxNitUOHZ3Z2Y1SlpXZy8rMHhqZU5mc3ZyYVFYbmlqTk56dFB1bVRP?=
 =?utf-8?B?Rzh1eVR6WjhjQkVTbXBNMW4ybjJEMkEvcU84Ym5uaGhDYWVCd2M5cFllWGI1?=
 =?utf-8?B?K2t5N1VsVjlvWUdmU3Q1c3c5dFJ5Z1RsS3UzSjl3NDJQQjY5VzYyQUpNYm9N?=
 =?utf-8?B?QXZxY2xJT3BDdlAzaEpMUDZxRVljN3NzQkh3NldDUzhOMS8wb01KdnFpWTVh?=
 =?utf-8?B?dDlQUkhNQzUzMlZRSlE0YzB1b0tkcVhWNWZvN3B0ZmNBWTNuVWJlbmFMZXIx?=
 =?utf-8?B?aUprNHFMVDh1c0pOS0EwaVl0dmNjTDZMNUlWUVJyY0ZqWEU2Y1ZhTGtmRlo4?=
 =?utf-8?B?Nk4vaVE1aFN1NURqdURpV1d6STJSWk9NcThiOEltQWJIUXRXMFNxeEZNdEhV?=
 =?utf-8?B?em1GMldsdTFRbkVBOTdMZkRCS2RjcjJqa29VOGpVSk41d2g1WkM1a2VLNHo5?=
 =?utf-8?B?V2hhZmVHVmxJd1B3aVdFMUNkKzFBM1QrQ2p0dzZWTHJta0dqT05DNVVIZ2tn?=
 =?utf-8?Q?nRsZ22zbvsoDPVnB2kCh0bpBioOhN9438msr+WPcM5t9Q?=
X-MS-Exchange-AntiSpam-MessageData-1: aVcvZB+BoLDowA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dc2914-5b82-4005-3263-08de5d5a5bbf
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 04:13:00.2930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJmxNfqeV/MBlkZNLy50zDJTKZ35UiQbTss9FcqVqCvVQMPwUJg6GDqSqRB1Q8nFLO9JCdtvF/UG+LLEQ+hQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:kekiefer@gmail.com,m:jja2000@gmail.com,m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,nvidia.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 8E2E78FD00
X-Rspamd-Action: no action

On Thursday, January 22, 2026 2:08=E2=80=AFAM Kurt Kiefer wrote:
>=20
> > On Dec 8, 2025, at 8:23=E2=80=AFPM, Aaron Kling <webgeek1234@gmail.com>=
 wrote:
> >=20
> > On Wed, Nov 5, 2025 at 3:28=E2=80=AFPM Jasper Korten <jja2000@gmail.com=
> wrote:
> >>=20
> >> Hi all,
> >>=20
> >> On 11/4/25 19:12, Aaron Kling wrote:
> >>> On Tue, Nov 4, 2025 at 3:14=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> >>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
> >>>>> On Mon, Nov 3, 2025 at 5:54=E2=80=AFAM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> >>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay=
 wrote:
> >>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
> >>>>>>>=20
> >>>>>>> Without the cmu, nvdisplay will display colors that are notably d=
arker
> >>>>>>> than intended. The vendor bootloader and the downstream display d=
river
> >>>>>>> enable the cmu and sets a sRGB table. Loading that table here res=
ults in
> >>>>>>> the intended colors.
> >>>>>>>=20
> >>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >>>>>>> ---
> >>>>>>>  drivers/gpu/drm/tegra/dc.h  |  13 +++
> >>>>>>>  drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++=
++++++++++++++
> >>>>>>>  2 files changed, 219 insertions(+)
> >>>>>> What does "darker than intended" mean? Who defines the intention? =
How do
> >>>>>> we know what the intention is? What this patch ultimately seems to=
 be
> >>>>>> doing is define sRGB to be the default colorspace. Is that always =
the
> >>>>>> right default choice? What if people want to specify a different
> >>>>>> colorspace?
> >>>>> I reported this issue almost a month ago. See kernel lore [0] and
> >>>>> freedesktop issue [1]. The pictures in the latter show what nvdispl=
ay
> >>>>> looks like right now. It's nigh unusably dark. When booted into
> >>>>> Android with a tv launcher that has a black background, as is defau=
lt
> >>>>> for LineageOS, it is really hard to read anything. Is it correct as=
 a
> >>>>> default? Well, cboot hardcodes this, so... presumably? It would be
> >>>>> more ideal to expose this and csc to userspace, but I'm not sure if
> >>>>> drm has a standardized interface for that or if tegra would have to
> >>>>> make something vendor specific. I think that would be a separate
> >>>>> change concept compared to setting this default, though.
> >>>> The reason I'm asking is because I don't recall ever seeing "broken"
> >>>> colors like you do. So I suspect that this may also be related to wh=
at
> >>>> display is connected, or the mode that we're setting.
> >> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
> >> Z1FC 1080p portable monitor and run into the same darker colors. Both
> >> have in common that they use HDMI which seems to line up with what Aar=
on
> >> is reporting. I do not have an eDP display to test or another carrier
> >> board with a different display out to test.
> >>>> It could perhaps
> >>>> also be related to what infoframes we're sending and how these are
> >>>> supported/interpreted by the attached display.
> >>>>=20
> >>>> All of that is to say that maybe this looks broken on the particular
> >>>> setup that you have but may works fine on other setups. Changing the
> >>>> default may fix your setup and break others.
> >>> Do you have a device set up so you can check? Or does the regression
> >>> test bench have a display that can be forwarded?
> >>>=20
> >>> My current setup is a rack of units plugged via hdmi to a kvm which i=
s
> >>> then plugged to a pikvm. I also observed this issue before I had this
> >>> setup, plugged directly to a 1080p monitor. I have not checked
> >>> displayport. I can cycle through a couple other displays without this
> >>> patch to see if I get any other result. I am fairly certain I have
> >>> consistently seen this issue since I started trying to work with
> >>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work t=
o
> >>> allow for a bisect.
> >>>=20
> >>> I am in contact with one other person with a tx2 devkit, who
> >>> replicated the issue when I asked. Who plans to reply to this thread
> >>> with setup info later.
> >>=20
> >> For reference, I am said person. I have a Jetson TX2 Devkit that uses
> >> the P2771 Device Tree. I'm running a Fedora distrokernel with no
> >> additional patches applied by myself. I have personally noticed the
> >> issue to at least be present on 6.14.5 and 6.17.4.
> >>=20
> >>=20
> >> I'm currently not at home to take screenshots with and without the
> >> submitted patch, but will be able to do it tomorrownight or friday.
> >=20
> > Any further thoughts from the maintainers on this patch? As far as I
> > know, this is an issue for all users, at the very least on hdmi.
> >=20
> > Aaron
> >=20
>=20
> I can confirm that I have the same issue on a DisplayPort output of t194.
> IMO, this patch will need to be reworked a bit to enable the CMU for this
> output as well. I hacked this change in for DisplayPort, and then it
> functioned as intended there as well.
>=20
> I've traced back to the reason this is necessary. The DC hub driver is
> applying an sRGB degamma for every RGB plane (presumably for blending),
> and then nothing reapplies the EOTF later on. Without gamma correction
> in places where it is expected, images are going to look "too dark".
>=20
> Which does raise the point that there is an alternative implementation
> where we do not degamma RGB planes in the first place. But this may have
> unintended consequences when it comes to composition.
>=20
> The SOR does not appear to handle YCbCr outputs at this time, so enabling
> the CMU assuming an sRGB EOTF seems like a reasonable path here, to me.
>=20
> Kurt

I tested this patch locally and did some investigation. Can confirm that on=
 my Jetson AGX Xavier, this patch (or disabling degamma) fixes the color ou=
tput.

The colorspace the display expects from the incoming data is specified in t=
he AVI infoframe. This is generated in tegra_sor_hdmi_setup_avi_infoframe, =
which calls into drm_hdmi_avi_infoframe_from_display_mode, which leaves a l=
ot of fields set at the default.

Currently we're advertising:
* colorimetry =3D no data -> for HD resolutions, use Rec. 709 primaries. Th=
ese are the same as sRGB.
* itc =3D false -> NOT IT content.

My understanding (based on some LLM research and otherwise) is that this is=
 likely to result in the display expecting Rec. 709 colors with Rec. 709 ga=
mma. sRGB gamma is slightly different, and setting itc =3D true would hint =
the display towards using sRGB gamma.

However, what seems clear to me is that the display would be expecting nonl=
inear data, so enabling gamma conversion at the output LUT seems correct to=
 me. So this patch would be a clear improvement (with the fixes already dis=
cussed).

Mikko


