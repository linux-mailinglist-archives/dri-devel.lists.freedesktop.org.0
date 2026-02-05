Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJGoMiEthGnx0QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 06:39:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD7EEEC56
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 06:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94E10E7C1;
	Thu,  5 Feb 2026 05:39:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R181tVUW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012021.outbound.protection.outlook.com
 [40.107.200.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C5D10E7C0;
 Thu,  5 Feb 2026 05:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/vmEUfecsstV5ncjJZ0dt5a3UQhteCaMXkBuj5Pt3dXS0jXBmvnf59j4JZSW8VQPXOuNzX7Kb69OmzgqGn+UR1a9ZaL2QI/TcyMOVs9lGUANIWaoqEZRw1fkTUtPdg3cwUsPA7LFFDg4fHXTshLN+yN5u2zhEcY0A1vICb26unBbxz0Bckk/TeMxrlooWKE0N4K6+rgXtZu8WZmy5KE4hygGt/QYJiBSgYoWWVAj+sYHKxX4Hy2E9+udy2Hd4qXOLXaiVd9L1G6spNyiqRx2kpO3aQ0JdOUp3K3CzirlCEQ0M738i0lXCw2jMTeO8AlLVXaw5I1FSxnzn/5p57UNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuZYohiBW/VoMyxs79LO5I0vsV/qm+bpI/HWf1NiRYA=;
 b=Pyv34zpBAxqxwPLeDVPPyfDSaeFArghin7FVySgFSQPoX//nrmqQ+QmL8Cn0BnQX0F40H93/TREitM7FVYeSD3qp8G7a/hAMSGgndF2catPE+U2j9uciEWImw2u2XoVoKKtb4W301BDImpfBXTYaoDj3zNVxrNta21cMAfniHRcmYb3qU1RRXNPZHe0++UxzRyPSugtD/mJCjOYhxsXaJB9d1lPDfhq0AD9flksBO7XTuvu19pTIzVEKVKif4A878P0puuRuxVGAPVgjHsJIP2bV/j7h1A/r2YPPCzA0A2ayq1vGU2iu+HO/B2x9lxV35rTW0xIOOuUugLDM+C6rdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuZYohiBW/VoMyxs79LO5I0vsV/qm+bpI/HWf1NiRYA=;
 b=R181tVUWBh4GtXLKehXQVHH797CwFChNk1YKb+9x2Ikzgooley6pxdXECBCcEsMCOpPAlBjvRc+mVYoCcjk2uv7NHUS3C9P2K71+hjvObfdjVrOCM+VK9Fmu14/Woxfb/2m7QeVKVrPK1vyj2tec5etcSJjW3SFjaUjmVyyfuyVa17L2kNGz4eKehjNFfybmGmZ79yY2QyJEG9UK61kQ2IOpY7g+vynUDsbhSNXxpyZqvvz/RSR2XGUpnyBVGW3SxBJ4LSfT/Ltk1oBWyNncXb74cA5BvK2qByLF0j0BAu0v6crnGcvoo17GWBKTgFQbe78v9CuBI6iAwpMsCvHkFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Thu, 5 Feb 2026 05:39:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 05:39:35 +0000
Message-ID: <f0047a7e-7114-4375-b6eb-8bf1b7a82262@nvidia.com>
Date: Wed, 4 Feb 2026 21:39:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] nouveau/gsp: use rpc sequence numbers properly.
To: Dave Airlie <airlied@gmail.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Eliot Courtney <ecourtney@nvidia.com>, Maneet Singh
 <mmaneetsingh@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
References: <20260203052431.2219998-1-airlied@gmail.com>
 <20260203052431.2219998-2-airlied@gmail.com>
 <d8a40e5c65e4aa51636a42fc613b223dfeb001a6.camel@nvidia.com>
 <CAPM=9twKuyo2afqR3qM7LMkyuOue_t_eCm3EcnU4CkKPOyxcRQ@mail.gmail.com>
 <4409e252-4778-4e9a-961a-647cc99b9455@nvidia.com>
 <CAPM=9twGHsH=SKvfuuqCuQ=eQw3+qKhFWtQ8WFm0Ut_2WhwZxg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9twGHsH=SKvfuuqCuQ=eQw3+qKhFWtQ8WFm0Ut_2WhwZxg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0040.prod.exchangelabs.com (2603:10b6:a03:94::17)
 To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 37eb3a92-39f8-47f1-ba53-08de6478f238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aHJrNGorTnZaQ1FPclFTeFVXY1J2RUJYWlpYSmVRNmZkdG5XU0NGMkluQ3JM?=
 =?utf-8?B?SkVwamR1NzNlY25HSWVHQWtScjJsbXBwMFM5MnpDcFVYajI2cHF0NlBFRHI1?=
 =?utf-8?B?MlhLbWdEdm9sUW9GZFRqQUpoU0hDa1ZzaHE4RFVUZTd4QW5IUTBreCtNa2VP?=
 =?utf-8?B?QzNpS2MxdUFnKzBGeXZoZlI0S3FvZ1FkSUxIanBGdDhkcUVSV1hlVHJKNWZH?=
 =?utf-8?B?czdOSEhxS1pMd3RKQmZUSTZ3dENiOW1IMXlNVTJQMHcwcERwaERyUlRORDdQ?=
 =?utf-8?B?UGVDMkN2UTBaNE5EZWE5dmRjQWMxNTE5MHlGR0pXam5haXdVVWVJK1ZycVJJ?=
 =?utf-8?B?OG5kOE43WXlsSVl2eEtoNDBrRStJZ293dVp0WUNESTlsRTRUYkpWK2tEMkhM?=
 =?utf-8?B?bmlhV1Z1UDFMdmdvQzFXRm04dXp6R1Z1NERWd0ZTbHVpMkdxSFVkTnd4UU15?=
 =?utf-8?B?MjR5SEdCYVVUbEVtdDdrNEY3TldyYzdvbVk5T0dId1hQb016N1p1ZFF3OXdz?=
 =?utf-8?B?TXdIU1U4ODJuUjJTbGx3VVo2M1poWWF4WXlKZ1FhV2RUTXN0ZDVCaDV5UW5n?=
 =?utf-8?B?bTNrUmVld2twZksyVExDYW03Y2M0TXpOdHdLU1gxUUtuaktwem9uSFJFK2VT?=
 =?utf-8?B?QlpQYXpRZGxXTlBaeStNdE9rcGhuYXNlbjBBV0ZxMk90dnBEL3JpT1Q0ZCs4?=
 =?utf-8?B?S1p2OHMxRDZIaTUvdFpXMjJFNS9VWVVqdnB1ak9QMWFFTk5Gcy9MMjZUa2hp?=
 =?utf-8?B?akVGeVd5eVhKOUdyQytWTFRHOU1iNkZaaDNwMmxmeVp0TklzTjZqRVg2eW5N?=
 =?utf-8?B?RityTDFYdHNPVTBoMjJ5TUZjVm5jQ3pSZzl0ZVk0OG5OaHUyNGlDT0xnaUZs?=
 =?utf-8?B?alZGUUM1N20wcXBHZ2ZpUWdhNEJnaUJWK2pzQ3pPZ0JZNngwSHVwQitzSkho?=
 =?utf-8?B?SWM1bm9KZ0JHRUwvK2hlVXpvdm8rcjUrcEVIYUhlM0syWG9Sa2FOUXhMSXk0?=
 =?utf-8?B?emhHSGpWWkJUL3NrYzRnODgvRjZRaHdXWjBDOEdqM1lGRURpWTdhSnVMTlJR?=
 =?utf-8?B?THovZEdHUGEzQ1YzVXg5M3F0QytOcVNCSUphdWZYM3BHcXR4OWJZN0pHRHNx?=
 =?utf-8?B?cjJJSnF4eXF4dk9jMlJCM2FvcVd0ck1TMFJlVWFBNTlDMlVnbzZCZWhsZFVQ?=
 =?utf-8?B?andsdjZHVXQ5Y1ZNSGtTNS9sd3RtSXcxd2hoUEVPeTdqRHpNY2Q3S3pPVkd6?=
 =?utf-8?B?SDZzNjgva1NFckJodmZjVWZ0SG1Gd2ZoZ2YwU2h1OUVTdldFaHdyUjd1TUxQ?=
 =?utf-8?B?TjRUNVg1SXRPbEpuRmdUMFZXNFpYVHM0L3N3WFNDbmxvcmJ4YkpENy9UcGZy?=
 =?utf-8?B?SnVVZ2lxRS9xUXhHZk1WVTRHaVhXZzBtVVNFS0xnTmdqM0UxS2FyZGRhU05r?=
 =?utf-8?B?bm1VREJiM1pzUTlKYU55dDUxc0Q2cXV2VVp5YkdSaDh6VGdmWVZnRktsYm1R?=
 =?utf-8?B?R013ek8vb1FwdE01bmpqRzh0bHJyZTZySWcveHZrVXJpTEh6WEZXYkdLNnVF?=
 =?utf-8?B?QnkrVmhQL2RyS0hIeUNuUDVUczl5RFVLWjlFbC9hanZVb2IvYXA1V1JrclRk?=
 =?utf-8?B?di9odG9UT2N6aU9FSVo0SUJGa2lFSVF4V3dEd010UERia3ZndkFseDE3bkFp?=
 =?utf-8?B?Mlp4ajdJclp3Qm9rODhHbWl0cVVPeks2eHlyUkhlWmgwc0N4L1p2Q3d4b1pW?=
 =?utf-8?B?Z3BvWXFyWUZFb0lKSWdNSUZUL0x5QmFXWjRybVVPQTB0RVFFSVJ6c3MzUitk?=
 =?utf-8?B?b1BoQkN3cG5CNnNUR0xPbTlxWW0yWEZjZkdPUUhPRnpqdlZaZ1lMRUpSLzBs?=
 =?utf-8?B?S1VWZ0kxaFJxZCtUUm1hWlMwWktSOU9OSHJUa1Z1VTVjSkxpK2NDbWtpUEY1?=
 =?utf-8?B?a2Y0VVhJR3gzTW1HYlJOYkF1RExhZjN4OHVNU3RETlllSFoxRHNRbGJQcEts?=
 =?utf-8?B?SlpNQ1ZaTmdNWXE2TFBGb2lDc1Q1OUJ5VkUvTytBVXJ0V1FNdGtIbldkTjhh?=
 =?utf-8?B?NHUvSU9uQkZWYU5rRzlRbldlRXBSa3p6T0E4Z3l2cGUvR1Y2c2pnVkxOaVFp?=
 =?utf-8?Q?0E8g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THIzVDhrZ2VVVTJkenh4Wm9rczMweUFMbXdYSGdsczllTkxiVnY4OCt0aHMr?=
 =?utf-8?B?aUIyNnhjc2hFYnBuSm1RZDgyWGhadkJMQ1FwSnhXZVpzWDVsdzNZM3NHbnd5?=
 =?utf-8?B?YjcxeE1Yd2wwN0NtOW9wTmlDM2MyWDA4czU5c09mVGp5bVJucUQ4VHdCcG8z?=
 =?utf-8?B?aVhuZFZmQXJlQTNkL3VSVmlxTHhST25TNStsUkFCcmp1U21mVFVSYkorTGJL?=
 =?utf-8?B?UUIwVzZ5VXJnZFJ2ODM3eHEvNXdoZXFrdFBZN0hXTTJhdmRlTXp6TWh2TUw0?=
 =?utf-8?B?MjNISlJKWkpTWDRzU0VTa0FuSnZ1dlBHai95OWJBc3hIb1ZMY25nMCtRTlh0?=
 =?utf-8?B?cUZoa2tZR21wK2ZrczFDRWU4NG0xbEZkVStKc2NZNjJTbFlLaVl4U2xyendQ?=
 =?utf-8?B?b0VyTmlpamVsRUZuandJclkyU0RNL2NFZGM3cW9PU3JLak1EbmxURmkrUGFr?=
 =?utf-8?B?UW1idFEyOG5nR0cwRTdKK1FnNkFvamxhVGF5cy9NQ0k3cmZUYms0Sk1NQ3hy?=
 =?utf-8?B?ZTJSbzdacDA3TGdwUFFuaFZBN1FnMnE1NytaZzB0VnJReVN2L2xtSnpBUWNE?=
 =?utf-8?B?SzMrUklMYytJSzNXcitmWFZZcjYzOUtjNzVveTdxMzlQTzFocEQzWGdkNzRH?=
 =?utf-8?B?b2RLcDZOcncxTytrakk3Y1Fac3BBdDVjajg5LzJPamljTTV4c09jaHkvUito?=
 =?utf-8?B?NVFXd3dZZC8vcEpOamVnNEl4aDkyUlFSLzJWNHB5U3NKeFRYWHJlQjAyN0Jh?=
 =?utf-8?B?UnMrOE9MZFpKMVRCbndRc1dRMWxrdVAwNHdMM3dQQVU4S0ZMZmxuL2NPL1lj?=
 =?utf-8?B?S3YrRkdpT05mU20xRDYwanc4QTllOE55bVVJU3F2NmZPY2ErN2lkUmJnVlY4?=
 =?utf-8?B?aHVTSVlNMkdPdmxvdEdmUnRUc2FMWUhMcDZ5SUlWT0hDbnFJc2dNeWNpSWgx?=
 =?utf-8?B?MGhwQlcvUERmZXZOQWRBM2l6RFMvUEs2Z3E2WUdvVXppdGJoNnpJNnZycFdy?=
 =?utf-8?B?MktDZUNOWDM5MHFvVkFUajVIOTJST0NXSkxoM0liY1VFU1B1Q2hPNUhRS3Qr?=
 =?utf-8?B?Mmh2QUZBQ0huclFBbHF1eEdiUnh2WGhtWDJET0hDcTRnZW1OVkJMenpBdzBo?=
 =?utf-8?B?QU1kdzdtT3Q1eXVKdGtQMmRHc2lwMjdNWjdWSlJZZVFNdFI5Ykt5UHpYQ3Z6?=
 =?utf-8?B?T2d2TUZOaHZ0aC90L2VHYjE1UzRFRUJNR1FrOE9DK2tNV3VRUGpWeHNGMUNy?=
 =?utf-8?B?c2xJTi9FMkllLy9kNVVmdlhva1h5ZSt2NXZQSnRBVEpPb2FJeGhvYmN4emR6?=
 =?utf-8?B?bFBkK1U5TUt0OTlhREJ6UnM5dWlTV1BUSFB5anBJUFc4VkRvenc5SElpRXVB?=
 =?utf-8?B?aHJmR2JVMk1sUFpQRi9KRTlIZVNoa04vODB4L1l3OUVoSWNjd3huWXQ0U1Zn?=
 =?utf-8?B?MUhNL1pEb1B5ZVRMWWtEVnAxa2kxSjArNHhhMFQzSXY0UDFQTWczUjhZdXBx?=
 =?utf-8?B?eUF1VUdZa2hMTUF4RWJKTjdRK2hCQmEyZmJUbEtBWlRvL3YzcVdWVkRWY1p3?=
 =?utf-8?B?TEM4VTB5d2htbE1aNVcrUkdFUmJUVlZxUGdvQlBTbVkxTXJLUWs5MGtSbGJN?=
 =?utf-8?B?MHVYZXgreEdDUCtCcEdTUElkdm5RU1ZFd0s2aEhGRTN0cTdDeEN0TmJQaXZH?=
 =?utf-8?B?WENLQzdEUU5lNWZ2QkppVm40ak4vdXZUNFJHV1FtZkd3M1htalZzR2ZsLzBz?=
 =?utf-8?B?NVExRThLK29LbHJES0dPMUxmNDZkaW1kNjJrRndEYjBMSDNhMzRDT1BucFVQ?=
 =?utf-8?B?YTFNVkREMnl1a3U0NG1EejF1UURkZGlGdnpnb2QxSnlmeVY1TmlzZXRUUlQ0?=
 =?utf-8?B?MzFJbkg5RXJRblJwNW93TjRGaUtjZGZrVGxmZEVtYWUvTHB4Y3dnajJjZ3Nj?=
 =?utf-8?B?VnhZMXZ2aXd3K1I2VDlXSVpxKytyZHdZMHdCdllmbG1PaU90VXI4blB1YWE5?=
 =?utf-8?B?L2VMOXMySkZiSnp6eVEyT0lUTXcrWWNHZmdDTnd4aXdSeTdidlkxNzgza3Bw?=
 =?utf-8?B?US9OdXJsNEVFTDZIbzRXU0g3NEd0S096dElsZWI3dGFwV0FWQ3lINzZPcWNI?=
 =?utf-8?B?SDUyZHdIMDRwUTBBQXJFK3VNeHExcUVDalRwOEc4RUxIWUsxS1crMlRQUTlN?=
 =?utf-8?B?QWVGZXMvUC9YTWFncXFVYnJrMzdIUzlHVzlZbzRqUE05Z2NiL0RGaUc1dWNL?=
 =?utf-8?B?NGpFb0JUTkM2dE5oOUJJVHBUb3N1V3VhNW5naEcyRVd5Z29oanZKTW82eTM4?=
 =?utf-8?B?bUxrWTIxNi9JNDdVbGd3eDhZVnhseVUxTDVEQzRncGRrUHhFbldSQW0xa0tt?=
 =?utf-8?Q?4aeD99c58TvcUpZo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37eb3a92-39f8-47f1-ba53-08de6478f238
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 05:39:35.7863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sCz3RVrF4Xj7ilnl7GmTDtTOd1E8gCfS7x0yt5raQnoFQSoRkQZukS1JONBNPO0QqWd/5Eu4ZUgKdotdmxeyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 2AD7EEEC56
X-Rspamd-Action: no action

On 2/4/26 8:37 PM, Dave Airlie wrote:
> On Thu, 5 Feb 2026 at 13:01, John Hubbard <jhubbard@nvidia.com> wrote:
>> On 2/4/26 1:56 PM, Dave Airlie wrote:
>>> On Thu, 5 Feb 2026 at 07:36, Timur Tabi <ttabi@nvidia.com> wrote:
>> ...
>>>> So are you saying that some RPC commands need to have a sequence number set, and some do not?
>>>
>>> I'm copying the behaviour of opengpu here,
>>> src/kernel/gpu/gsp/kernel_gsp.c
>>> if (pSequence)
>>>          vgpu_rpc_message_header_v->sequence = *pSequence = pRpc->sequence++;
>>>      else
>>>          vgpu_rpc_message_header_v->sequence = 0;
>>>
>>> src/kernel/vgpu/rpc.c:_issueRpcAsync
>>> doesn't pass pSequence
>>> _issueRpcAndWait does pass it.
>>>
>>> The SetSystemInfo and SetRegistry are the two async calls in nouveau.
>>>
>>> So I'm not saying some RPC commands need to have a sequence number and
>>> some don't, that would be up to someone who can access GSP source
>>> code, I'm saying that opengpu does this and I'm copying it :-)
>>>
>>
>> lol I love it. If only someone here had access to the GSP code and
>> the GSP team! :)
>>
>> OK, then, I just had a very enlightening call with one of our GSP
>> RPC experts, in order to learn what the sequence number story really
>> is. The notes below are sort of Nova-centric, but it should apply
>> equally to Nouveau.
>>
>> Let me Cc Eliot, because he was also fixing up other aspects
>> of GSP RPC calls on Nova, in case this overlaps.
>>
>> ==========================================================
>> Background
>> ==========
>>
>> Today there are some loose ends and inconsistencies even in the
>> Open RM + GSP scenario, for how sequence numbers are used. And these
>> are being cleaned up and fixed. In fact, I was even able to request,
>> and receive some nice clean behavior, which will be implemented in
>> GSP soon (we'll get it when we upgrade, likely sometime this year).
>>
>> Today, there are 2+ sequence number spaces, one for send-receive pairs
>> (command + response) RPC calls, and another for GSP-initiated ("async")
>> messages to the CPU.
>>
>> The "2+" is because there is an inconsistency (it will be fixed in
>> GSP), leading to the first two very early RPC calls being in yet another
>> unaccounted for number space. These:
>>
>> NovaCore 0000:01:00.0: GSP RPC: send: seq# 0, function=GSP_SET_SYSTEM_INFO, length=0x3f0
>> NovaCore 0000:01:00.0: GSP RPC: send: seq# 1, function=SET_REGISTRY, length=0xc5
>>
>> ...are not included in the counting, by GSP.
>>
>> The GSP finally starts counting up when it gets the first "non-async"
>> (command/response) message, here:
>>
>> NovaCore 0000:01:00.0: GSP RPC: send: seq# 2, function=GET_GSP_STATIC_INFO, length=0x6c8
>> NovaCore 0000:01:00.0: GSP RPC: receive: seq# 0, function=Ok(GetGspStaticInfo), length=0x6c8
>>
>>
>> But even here, it's not what I think we want, because we want the CPU to
>> get back the same seq num that it sent, for command/response pairs. But
>> that's not what actually happens (at least not directly).
>>
>> So for now, seq numbers on Nova and Nouveau are generally "do what
>> you want, it will work ok". But actually, we will soon be able to
>> use them for
>>
>>      a) debugging aids,
>>      b) detecting missing messages, and
>>      c) recovering from "CPU sent a message, timed out waiting for
>>         a response" cases.
>>
>> ==========================================================
>> Next steps for Nova (and maybe Nouveau, if not already done)
>> ============================================================
>>
>> a) Change debug output to print the seq number numeric space,
>> which is either "async message from GSP" or "command response
>> from GSP".
>>
>> b) Put a comment in the code to indicate that GSP_SET_SYSTEM_INFO
>> and SET_REGISTRY do not yet participate in the incrementing seq
>> number system, but will in future GSP versions.
>>
>> I'll send patches for Nova soon, to do the above.
> 
> So just FYI nova gets this wrong as well.
> 
> There are two sequence numbers:
> 
> the one in GSP_MSG_QUEUE_ELEMENT and the one in rpc_message_header_v
> 
> The rules for the first seem to be just increment, the rules for the
> 2nd seems to be along the lines above, two msgs get 0, then start from
> 0.
> 
> Currently we never init the rpc message header sequence to anything but 0.
> 

Yes. That's accurate. To be fixed.

thanks,
-- 
John Hubbard

