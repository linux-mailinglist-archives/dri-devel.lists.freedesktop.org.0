Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346728C23D3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 13:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26EA10E99A;
	Fri, 10 May 2024 11:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="C3wIYRmP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DA910E05A;
 Fri, 10 May 2024 11:47:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R5/8XQNncN67+AnunA97vdieRFRcuCJQem4mIjfhQiNb6BYeSuPrnhGfsvWIl8FZwJaYtyJ+z+i57XfJBZITN1L2WGMo0W9/OJ1Z4SkA1boHoDdS4b0GPUq8QFWV9Gu3rCT90yc234K3BWbg1pSOAg8bxxeUOz/+haUhJTIS99210RpGBHjtuO6pH28VyRPslaqvA4h8ZOp60XVregR0NpUAV6pDAW6imWMQ5/FpVjs2XKCFgFrW8fJk4gsXG01sMw/OsPZI6uLAfQrXNvTTmpfJTp58QRE8Dd1oeBakehPL/c5Zi+xIo7NK/xGYqJ3mKaRKJ6yV8DlP4uqWjQDxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qs99zht7pbiDQr9wOPVIx96jiFzBFHTUNRqNN/20270=;
 b=eHrCciF58IJ24wPVpoY/sVSH6WtJyUzxa2ngvWRLzvlqaHsTZ8E1oy9AIicMg3ZQsFKotn+ute5qFBqcViEOGXpV25C9DBVWodRbJWrvHF9A7AA9/wqIYRrYBr2brCwXdF4OXlOVBwBMQ9bNhjOaXvgqvftTwuMNkMsw7NN+DvVtz3lSKSPzw4dkeemVbHgGO65DWP8bGBOHF9JxMJMItjnFhNdhSmC1e4mOBz0BMeUtWBk2X80T9nMRywr7awIPH8bzf7dc3i2nLdj+USdjt+IXNbYarT6jnwVGlBmrpjOQc6Q6/AFG9iBlnmAkQDf7BcZkVKyOJCSdfWm1kKjBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qs99zht7pbiDQr9wOPVIx96jiFzBFHTUNRqNN/20270=;
 b=C3wIYRmPA7RDgREzgB/XM1yqhtQWVD3NJm0MbK2K9WsTz0AW5qqoMH6uLZRO9jWPMNYFMWWpwLaDrO2jsaJd6xWvHyf5mT8FXGtr5qmfERcrCjHy9AcRleX3oz5nyLxp3Dwpn5bhap3PsjpmTqwMHwzCzAi7UI75hGyFJJysfE8yc/cEQ37BR10Q8f8QPcwD3dxEzjGOZ7+WVIWN6vHJGSsbavyqk3qmlETVzpSR0eZu6Xms9r/dxUpbncRon6f3J+HQRoH0I+wS2YeNOjvaFXFREU1VoFUt6mBjUqLbopVonyk7lHE+yhVUQZb9///pyCzkE+sflaL+laRWXlEQ9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 IA1PR12MB7687.namprd12.prod.outlook.com (2603:10b6:208:421::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Fri, 10 May
 2024 11:47:08 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7544.047; Fri, 10 May 2024
 11:47:08 +0000
Message-ID: <7e23363b-747e-444e-9007-c806a6c5596e@nvidia.com>
Date: Fri, 10 May 2024 12:47:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: document python version used for compilation
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stefan Dirsch <sndirsch@suse.de>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
 <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
 <20240510123911.34f050b5@sal.lan>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20240510123911.34f050b5@sal.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::13) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|IA1PR12MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 52fc51f5-c8d1-49c1-6d3c-08dc70e6eba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTdmWXJlTGJINGZWSWJCTFpJWmdDSzYxZlNhckZ4MDZjUDFtVTBleWU5bmtl?=
 =?utf-8?B?KzllbkJuNExkZFJjRHJCY3d5T1JZUEVkcVNOV2IwL1poS0ViempmQUdnVWx5?=
 =?utf-8?B?WkExTjQzeW05NFpkb1EwZXpQc09pWVRuYmlZaVpLSkV5TDdvUmlQZUVCRlR0?=
 =?utf-8?B?TzUyaEI0bU1CSDJNNnJ0SkV3WnBqYnNxd3MzQ1U3dUNGbkpLc1RCeEIreDM1?=
 =?utf-8?B?M2xiVUNxTGZkWDFQQm52bkJRcFNHdXY5VTY3SWl0RTJHRHUycGZJR2ErSkdW?=
 =?utf-8?B?cWp1ME9wcS9KUTZZVW9iU0RMQXIycDRwVWFNbGpRV0ZSazdWN0U5Um1MT2lU?=
 =?utf-8?B?elRsenJYS2Voa21MSFNSc1g3N1prZ1NRWXJuWVJTcVJhZGZvOFYya2ZoaGJq?=
 =?utf-8?B?aGU5cTdPckRVZi9NTkZPZlpGSEVaOTR1dERtTWVtS0p1RE5URzM4UGJ0WGFW?=
 =?utf-8?B?OUdrODlCVEdxZy8vNGNrQnVjRlFyNjk3Z2hKSXhFUVhISFlzdWM5cnVTZ1Rk?=
 =?utf-8?B?ZHFsZ1E0OXBuMDdid1ZZbzd2SnYzTTlqRS85ZTNnU21sNUpMRTVRcWFBQitD?=
 =?utf-8?B?ODBRb3k0RkFTMVFFSWRST1ZiNHIwWGN5eklKdUZhZFpCRGswbFdZSlg2S2ZN?=
 =?utf-8?B?U0YrM2xwZ1ltQlpQMklmTnViS3p4Yll5VEVFdEhlVm9WeURpcmRkQnRJUlRh?=
 =?utf-8?B?VnMwcUZyOGpCSXB5aGhmNVdERkhGQ2dCczVCVnA4NkpaK2FueW1wSFRDRk5V?=
 =?utf-8?B?Y2pwL0dHUFcwWW1GdEFMYzlIRUVEZXFQbTY1b2JwYmNYSDNLKzBXVnp0Uzlq?=
 =?utf-8?B?bnhaOUp4ODgyeTFBMUFmUW9ISldCbDNRTkV2ZXYrRTR6dlVzcGNnY25pck5W?=
 =?utf-8?B?b0xVaHkvSDZ3WTMyYUlWdTlkN2RHWUw0WjlWdXhZT1hsWURmbjRhOCtqaHMv?=
 =?utf-8?B?bUl0b0NrdGNlc3FiSkEyL3hPU0ZtWUY3akN6cHg4Nk1hdVJFd2FtNHBUTTRz?=
 =?utf-8?B?c29uZUw4MUg5by9JVWtKMU85dVZFRitubjhUZlFXU3pPRGQzTzZaZUt4Q3dJ?=
 =?utf-8?B?bU1YdmZOVEJrb3RNb3k5Y0VrUHBsejBnUElTYlQrVG5kV3VGR0NnUlZDVWZU?=
 =?utf-8?B?c29UWUhITzBiNzZJb2xJeGJ3Qmk3ZDdkTndra1pPcENPV3MxOEtNSjZPQ1p1?=
 =?utf-8?B?SHNMNWdSNzNXaG1RamZkWnc0MUdqNEd1VS9HdzlLSVViSWpRUHNlUFk5NFpY?=
 =?utf-8?B?enpHdjdVUUVrM2RFT3lueHpIWkJsa0Q4ajlWK2pFTmxoMWpsK1dIS0NqWlZT?=
 =?utf-8?B?RGo1cWZpVVBycnN3ZGZyRnQyTUk1RkNBdXF4Zmg1SzJ5aEliV3lVV0hWbkEr?=
 =?utf-8?B?d3ZXL0hVTnBlMTRDTVFhSjNYVUdtRTA2VEVialFBclpNOVJOcXJNbXdVcGVG?=
 =?utf-8?B?STExMHR2aFJCSHRiM2ZPNENlRTVieGhaTTFVYTFDT0tMWkhoWDVnSXNxWWR4?=
 =?utf-8?B?Mnhxb213Zk1Zanl0TldsWktyalo0bnlxaVd3MlJFZjgxcUNGSnhNbjBtZGVR?=
 =?utf-8?B?ckRxZTFqeHhLN0JLQmhENUVCSUxaMlhxM1lMeXNIekNxZUNncXJXMTBKVUht?=
 =?utf-8?B?UGdZOUJDanVDUjFCR2RvaXMxTnRLREZ1T2NBM0F0L3hiMW1RYlZwRVgzT09K?=
 =?utf-8?B?YUNOdllLQko0Y1A2QTArdGtweitqaGh1TUhiUkZvc1oyVFhOUjFCSGxxR2Yw?=
 =?utf-8?Q?ON5fLP3p+oia/ty+Fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGFqRHNPRHBybjBKbnB0QWpLTmZGRHZYTzRxQlFmNGxwZGxsL1pQUDN0L3pj?=
 =?utf-8?B?dzNGWHFDdytxTW5jdjFLWFRPUEhFY055eC9wM3JmV1lwZFlvQzlRTnErSER3?=
 =?utf-8?B?cFR5WFErd25KNmhaeVpCR2cyU0lDWGJ1M1htSGJHeW9ZOXdybkU4WWpOU2Rk?=
 =?utf-8?B?ZkRjMFNabHVJaHJRM1JZcWRTdFNBMWtjcGRjazVlY0ljaEhaTHNndm14TnBY?=
 =?utf-8?B?WmdBK0szb2prSTNQTWVRbXRPV2Fua3I5cDc4TXplRjFsWWFEY2RVUnlGdGI4?=
 =?utf-8?B?RWJxbjFVenV5bGkxY2g2ZHQ4NVdJTDg5ZmxHZWRYTFNnOWt1aHBnMUQ3dkU1?=
 =?utf-8?B?VnJRejEwbk5XRzl1OVdsOTN6ZU9nNlhaMXFESHVibEIyZWV5UHdOYW1hZ280?=
 =?utf-8?B?dFVGQjRyY2NkbUJMb012SHF3VTlPTzFUZExPZEQ4b01ENHp0UVVucWx3WWt4?=
 =?utf-8?B?akM1bzVpWnpmNlRidDNLWFlUZG9qNjlxdXFSRlNzRjVXZHI4YmYvajVZTnBL?=
 =?utf-8?B?MmlnbWNzOWRrdTdZRWtKMjRvdjl0NEk2VlV5MjkzUkxUcTNpQXBoODAwZm1Q?=
 =?utf-8?B?amk3OStpRGxBUk9mZjJocE41Q2tvejc5RnE0WW5TUkFlRW5UcTR5NjNrSzYx?=
 =?utf-8?B?U25qaytGQlRFMWJlK3hQSTQ3SWxPT2VwVDI4U0xoRUp3THNRc1JBcHUrdTNv?=
 =?utf-8?B?aVp6Nmc3a3dlbzhraGxtMTA5NEhqMFdWa2FkdmZpSE9Hako0SjEvSGFmbFdv?=
 =?utf-8?B?UFdHVWVGOFlEbkdhdWsrQjNTdTJxa0JvVWovWllRWitianVHSnJwblJ6eHBL?=
 =?utf-8?B?Y2pFZWtWQkZCZXZxMXl2cEUxNGFNaUR6bWN2WUsyVEdkSjZLNFREWUl6MkU0?=
 =?utf-8?B?WTJYMDZFblozblVCNTB4dVVNWS9nY3B4cCtXeklPVElOdFc0NmFFd0VMRXZi?=
 =?utf-8?B?YTZJeHdVM1lJdnViczhhQVl2b3AvUjNoUEl6azc0OVlRYzJhQm5FS1VEbWNM?=
 =?utf-8?B?dEo1VDhHeDZpMGdUWGYvUjdkM3FveWNGbThkVWxsa0pQa2tGWnZvWGFWM3pH?=
 =?utf-8?B?VXMxaFR2eDljcHZGeG43RWJVd0lsYy9nZHBhT1NqOExWN0dXVUttY1d6b0VU?=
 =?utf-8?B?L3N0dDFvY3JIY0ltcDNhQVJ1c0FOQ1hSZ3dSQ2ViV0M5b1dCR2hHRHRKRDMv?=
 =?utf-8?B?VDdYVWxiN3dTTWNZVDNVTUhRQnNNVWpnWThoUW5icnh5NG53V2VLN1NiTy9n?=
 =?utf-8?B?TkRKT1dqYTdWVGl3ek5jY25lY3dCemN6YVgyTFVuZksrWDFiZHVFMnh1ZnRO?=
 =?utf-8?B?WFdnWlczWi8wRUpsWVplTHRWTzJMRWVjLzh2c0Q3MkNLSUE5WS9ERkhUTnlM?=
 =?utf-8?B?dSt4eUlCMDV4YTN2aDJOZWNuWlFjT2tLZDhBbnlyNG0zbTZucUN5RW1nVTBQ?=
 =?utf-8?B?dDNCNWM1M3gxS0d2VzR2eTB5WWVBRjZMRWQzR25jQXpKb0VaSnVtN0ZJM2JN?=
 =?utf-8?B?VDlVQ24vZG4yMGZONnNDTk12R1VDNVdKaExBSGM2aWpvczN0eXFodUpobHdW?=
 =?utf-8?B?bnFkVDIzWkdIK2RrN0I2RXdnOVhTclJDbUlvRTNzUzFFMm5qTXJ0cnBMQmdZ?=
 =?utf-8?B?bHRWMkdMNy9QNWd0Ukgzdm1NZU1NaXk3eDZ2Tk11aE10K1h2UlIvU1YyRDhS?=
 =?utf-8?B?OGpweFZqVmFPZGNOQkwvd0VTRWV4a3Y0VDhYWkk2S2VSN3FYMnNzUXZKWGZB?=
 =?utf-8?B?Nm9NaExHM3RxSmlXbmJqdEhxQkgxUm03cHRKdGIvYWs1SjFxRjhvYU0vditX?=
 =?utf-8?B?YmZRMTlWOHZKb2kvajZIbUROdkEraS9aVVZIV2Fpdlp0dUVJZVFsUkNIRStk?=
 =?utf-8?B?dC92a2JsdjBCYzIyajdIcXJPWmJMOSt0R2FMYlIxV0hKNTNLL2t3M3JYRjhi?=
 =?utf-8?B?UVNOVm9wKzB2ekg2VFBlT0R2aVZ4SVdHaHBoYzBVSHlnNVlQak5saW1TYmd5?=
 =?utf-8?B?R1RGSTY4clhyS2dpcGFnSzBQZDZLQ3BzeFJBbWlJNjQ2SS9uY1Jka3RJL3V2?=
 =?utf-8?B?KzZFVmRhcEZYWERvTW1UejhnNzhMOUxvSmJweFJEWHVSdk5oRDNtV1g0V1c1?=
 =?utf-8?B?c29IdGFSemQ0V0hIdWJ1VmxRMnFsZ2lrT2RGczkrUk05akVIenV6bGFNTFlp?=
 =?utf-8?B?enp6MlVPN2JqTDhuUm50UXZqWkc0SDJOd3FDTm1jNHU1WVZHUWhRcUdRNlMr?=
 =?utf-8?B?WGwrWU9YVjkwdytiUmdTcG5nN2JRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fc51f5-c8d1-49c1-6d3c-08dc70e6eba8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 11:47:08.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MwWVbFoeON33a/iF7tZovnHT9V09GJtqipK1KG3EP7rJQvzjXRv5TQbLrnmwXWZU7OeJNliW0i+N62gHAvzwYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
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


On 10/05/2024 12:39, Mauro Carvalho Chehab wrote:
> Em Fri, 10 May 2024 13:39:17 +0300
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> escreveu:
> 
>> On Fri, 10 May 2024 at 13:09, Jani Nikula <jani.nikula@intel.com> wrote:
>>>
>>> On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>>>> Em Fri, 10 May 2024 11:08:38 +0300
>>>> Jani Nikula <jani.nikula@intel.com> escreveu:
>>>>   
>>>>> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>>>>>> The drm/msm driver had adopted using Python3 script to generate register
>>>>>> header files instead of shipping pre-generated header files. Document
>>>>>> the minimal Python version supported by the script.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>   Documentation/process/changes.rst | 1 +
>>>>>>   1 file changed, 1 insertion(+)
>>>>>>
>>>>>> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
>>>>>> index 5685d7bfe4d0..8d225a9f65a2 100644
>>>>>> --- a/Documentation/process/changes.rst
>>>>>> +++ b/Documentation/process/changes.rst
>>>>>> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>>>>>>   GNU tar                1.28             tar --version
>>>>>>   gtags (optional)       6.6.5            gtags --version
>>>>>>   mkimage (optional)     2017.01          mkimage --version
>>>>>> +Python (optional)      3.5.x            python3 --version
>>>>>
>>>>> Python 3.5 reached end-of-life 3½ years ago [1]. What's the point in
>>>>> using anything older than the oldest supported version of Python,
>>>>> i.e. 3.8 at this time?
>>>>
>>>> What's the point of breaking compilation with on older distros?
>>>> The idea of minimal versions here is to specify the absolute minimum
>>>> version that it is required for the build to happen. If 3.5 is
>>>> the minimal one, then be it.
>>>
>>> AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
>>> at least be aware *why* we'd be sticking to old versions.
>>
>>  From my side, the 3.5 was chosen basing on the previous feedback from
>> Jon Hunter: https://lore.kernel.org/dri-devel/20240412165407.42163-1-jonathanh@nvidia.com/
> 
> Patch there seems small/simple enough if it is all it takes for 3.5.
> 
> Yet, it would be nice to hear from Jon Hunter about the rationale
> for 3.5 support (if any).


We just have some legacy builders for legacy Tegra devices that are 
still using python 3.5. I will request that these are updated but these 
are not machines that I own and so may take some time.

>>> Minimum versions here also means sticking to features available in said
>>> versions, for Python just as well as for GCC or any other tool. That's
>>> not zero cost.
>>>
>>> I guess there are two angles here too. The absolute minimum version
>>> currently required, and the, uh, maximum the minimum version can be
>>> safely bumped to. Say, you want to use a feature not available in the
>>> current minimum, how far up can you bump the version to?
>>>
>>> Could we define and document the criteria (e.g. based on distros as you
>>> suggest below) so we don't have to repeat the discussion?
> 
> Agreed. While we should not bump version randomly, defining a
> criteria about when we should update the requirement sounds a great idea.
> 
> For me, the criteria is:
> 
> - the minimal version shall be at least the minimal one required for the
>    Kernel to build at the most used LTS distros that are not EOL, e. g.:
>    Debian, openSUSE/SUSE, CentOS/RHEL and Ubuntu LTS[1].
> 
> [1] In practice, Ubuntu LTS usually has a python version newer than
>      Debian LTS, and CentOS versions are identical to RHEL ones, so
>      I guess checking for Debian, openSUSE, SUSE and RHEL should be
>      enough.


Adding Stefan from SUSE because Stefan also reported a similar issue 
[0]. Note that subject of this email is incorrect and should be python 
3.6 and not 2.6 :-)

Jon

[0] https://lore.kernel.org/all/20240118123752.bl3qss3qbbxgvpdk@suse.de/
-- 
nvpublic
