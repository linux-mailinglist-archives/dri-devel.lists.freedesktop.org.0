Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3472BE103D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 01:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73410E2B5;
	Wed, 15 Oct 2025 23:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oqpqvXGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012003.outbound.protection.outlook.com
 [40.93.195.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED86F10E2B5;
 Wed, 15 Oct 2025 23:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwbQeo41JCbcCUsnn4maMpGl6idoOJ0XvDVceuZMpgpi2OjEkpBuzXzGwtDeugZytz41Hi6h7wM3nzYn9cygKmJ5FXdNPUtqO16QJJ/QMZfi5IuvGnOcEn7w222lEG7+kFmMSIGwew+itHoK/gu2BqgiOT4jJo0/EAz6zm7Ed7pd+r670ATheNNTJOL8vSk5mXZJHYTqFzYFT57CyXt4mLBTRF6q6YN6F3Azv8ChKThU+O0hiXlNdn4NiOj7FveDYAIIs5TetWvkV1wOmDPeazd6OHWxRYXiBzq6AmlyxsU0DRNokFxX1x/4zczHrRq5SDinU1haFV/gUae54TP68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZVcymUFOfx26vnL1gVNmokCpOu+K6gqR23O5qHJ5d8=;
 b=Ds4t9O/3/Pnr7Yey9kA1bpTEBSkzQ6Ay0e46p301LUVRsjSSYV15xru0Jy+bPaK6wt6XP7zZZunREuGGbfmtUQrtzYDP3TDrAjjT37ukmAIkjkoZZAFYgAJphmMPcHoGXMVSnwb7smD5vYNdWvvaNSzQp2f3z5VYoCdpK0Q+ecAO6p8ygs8JffuXCQ9ewoKAquu9OQpnEPYuafY4KwSkLyjA4unoqKaxd8eUU7d/sGw5bdixG8XjBxBUo4LG6CcPZaCAB1f9XwdazKEc+1mGMqX9I9Bk8KGNnzmF3btSTOYyem6iKrE4jV0+QKVFeHzHEGp3+neYoL4tKdIGdH68Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZVcymUFOfx26vnL1gVNmokCpOu+K6gqR23O5qHJ5d8=;
 b=oqpqvXGqzTyQpcj5D9dZr0TVTc+shRNRD4Xo8SpKBA6D/9Mcy3BMYIdL0nai1BnIrY/DfDUjTkv3Vp3JcVxvmB17x7cQAFv6pOFQDreLUYOg6kmKAlIVUGtBaeRZywirGD081SruHkq/emDqtiTw1QoWuXoN8PnOIZYZq6oKGCOSE7oLxJd0JsV1jMMpA5l1aenhO3fGdpXFEyBNSslNVlEUoopH71WfLK8k7VqkCh4awbOyvnUGnsmTkXJguUFUGiAil2NOwZ3W20hbFyd9QdT2LC8CmFa21ZroFBY2FsphAqLwIv7PsrhdTNfT0ODETEBHwvN5gACETWbRbXubmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6218.namprd12.prod.outlook.com (2603:10b6:a03:457::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Wed, 15 Oct
 2025 23:20:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Wed, 15 Oct 2025
 23:20:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 08:20:22 +0900
Message-Id: <DDJA4MLDP53H.3PB9MQE7A1O0D@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: remove useless conversion
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, <ojeda@kernel.org>, <alex.gaynor@gmail.com>,
 <boqun.feng@gmail.com>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <a.hindborg@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250926130623.61316-1-dakr@kernel.org>
 <DD4ZTGLPIL87.CSOZ9KMSOAC2@nvidia.com>
In-Reply-To: <DD4ZTGLPIL87.CSOZ9KMSOAC2@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0207.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: 624b301c-d657-4335-6cc7-08de0c416c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWliR0YvQkF1dCtDWitDa3orVEw2Ny9jdU9OZFY3NTE5SndRUm81dnVkUDRE?=
 =?utf-8?B?c3pKSk5lVlFUOGJrdmZMeG5jTmE5NDlWY1l0aHNMb0NIQUtYWGVtV01ZczdC?=
 =?utf-8?B?S1lJcUx2c1pTb2tQQnlLeUxsMFJvNGp2L3hMb09wVWNUMjlqdFhQclFTbDFI?=
 =?utf-8?B?Nm9xLzkza1pFbkVLR0s5c3ZSN0R6M2JLVnBiNUdtRjJmK0VkOTE5bW5VNUhZ?=
 =?utf-8?B?MWNyWFBLNjFPYXlabVRBWk9uUFpBTjlmNTJWRVRtc05VemozVlhwMHk1aTcw?=
 =?utf-8?B?MG5zWUpPUDdBUy9XT3VaZ3dBcFptc2xMUzFNai9heW5ZaWxLNVBPdVhDN09h?=
 =?utf-8?B?T3dZOGhFbU82OWFFWFBjV0V1V29WNzhOSU9pNVpTUWZxNDRYbTF3UUVQRmtv?=
 =?utf-8?B?bEZYWk5HaWNwc0ErUFRDUHdsRHlRS2lYOEl4bng0dGZBRStZeldCZll4M0c5?=
 =?utf-8?B?U0hKMzFPYnREZVNBZHJVOXRDNmVxdnFQNXQyazU3OXg2dWVyZW5oNENFT1VQ?=
 =?utf-8?B?QlJvL1M4azlNWlovLzNFY1dsYXdQMndieWhaM0pEbHd1Ly84aW9ZMWdNMW0r?=
 =?utf-8?B?cjZ5MUZ2cENuMklJYktxd0RIYlF0NDNqdEhicml6d0FmV3MwYkM1cmxaQ0cv?=
 =?utf-8?B?SGY2STZ4QnRQYURzbkVLZHF1NVhVQUMvVWFMZm1GUzlXdmtaeTZxZzFuSVlv?=
 =?utf-8?B?MDFEdVRuZEpSY2pESnJNOE41Q2s0Lzl0cWpuVmJEdUorNmhGZWZDdHpFNVNS?=
 =?utf-8?B?SE91UDNJRU5wb2JlQzcxem5FY2U3YmQ0KytwRHcwbm15Q1VyNWNFVVdJck9y?=
 =?utf-8?B?cjZ3aXpGYTBGcTB4ZVVjcXdERnYzUkc1a2Nldk0yKzhibzdYZkxGeVRUUTZs?=
 =?utf-8?B?Z09Id0M0d0J0NUIzT2lIRzhHTGJtRWZSZzcvRzRmSExvWFVqbTBNUmZzazFE?=
 =?utf-8?B?b1FsYUFrVEl3YS9hT3ZRdkl3TjBLTVpKclBEZ1FkY2NXdHlGODZ5OFZwU2Nz?=
 =?utf-8?B?SGMzMDB6Tm5RVStWNUk0YWpZTUZhajRHR1NtU0ZCR2VVam1yMC83Znd6VGNa?=
 =?utf-8?B?VHVDdExJOFJQSTFoNm1CTXJoOGhzUjhUaTNBMW5ESlVRcEJYazlSbXdGVTVh?=
 =?utf-8?B?dE9PTVpIczFlVmJRVTN2Z3JZT3hEc2JRclJtaUxxM0psVW4rZ1NndzllSW5K?=
 =?utf-8?B?Uy8rMTdzLzdnM2krdWFOTDExZmJGbitWYm55cUhUenkxR2NBWStUalVDRzY3?=
 =?utf-8?B?QmF1NGNDK0x1WE9pbXdNVXlqTGRwQXFaMzVNaWZaOC9NZk5yTDJqOFpVcEJF?=
 =?utf-8?B?S3VQd3F2TG1hYndIdGpmTTJkMW9GOS9XeWUvQWRQSjVmWTF2MGtHNkgzUlBE?=
 =?utf-8?B?QVNkQnE4NVpVQ1krSVYrNGpYbUxCZ3RveVloOWVMbVZsNWxmRlZvZ25tQW1p?=
 =?utf-8?B?QU53ZWYyV2pBUi9KWWN3VStHWWNxb2ZEOG94NEtpaEM1b0hwQUh2bUc2WThJ?=
 =?utf-8?B?a2VTVUhhOHFuVSt1YnNCZlJvS3ZqNkVmb3VFQkxyL3JweFRTNDF3dnlFZVhy?=
 =?utf-8?B?WVBycVl4dzJLekwwVXFaLzFwT2drOERDSmt3ODQvRWJZZllVdU1zekJWRm5l?=
 =?utf-8?B?azEvVTdNMVR0ODgvcDY5dmhMcnJmS3pJaUQvM2NZaGdwZFhxWFduenQrMERq?=
 =?utf-8?B?NGlHRjNyQndybjJBVkNLWXlYNUVoUWVhYTVHakxxdUFVYmgwYXdEVUhFZENJ?=
 =?utf-8?B?TFVOQVFWQlBhNGdScUplbDhFNnBndWFlUkpCV2JpaDlTWURQVVVYUC9aQmRB?=
 =?utf-8?B?RWN1WHVuMWZObDljUW9ocTBneHJZbDJwaHhDMjU1MldLdFpDd29sRDdYVS83?=
 =?utf-8?B?YUp1QThRWTcvMFlIQlNjUHkwU09DMUxGL05hNFo5NTVpUWlVT2taOHNmL0t5?=
 =?utf-8?B?bXN4SWlqYkpuaFdsQitmeWh3YWpSSzVvSHBRSmc3UENNSVFRVFZhVVFHQ1Q3?=
 =?utf-8?Q?CYOm0is3J32N3hRm5JP9M/QfF131xk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGdqYWd4R1ZsczdFNHNLYmdtVzBhUzVuWDhicHZQekszR1dSR2lreCtsUkk3?=
 =?utf-8?B?NUFCd2ZpdkVEUERBQ0w4R1JseDF4OE1uSklUY2hMNTZoNjRETkFaYnVMdjI5?=
 =?utf-8?B?OVFjMjlzRE05ZExwSjZWL3ZVOU1leEJqb2hxZFF6TXRjUGVkSm80L2VLRjFK?=
 =?utf-8?B?N2E0bnQ1WnRwQWNONkxkODkxWUd4NEk4eXZ5SnJWVXN6ZFAyRkxMTTB6MEVh?=
 =?utf-8?B?Wjh5MWdtZnFoNk1jTWZhVUhjUS9BN2wvOFdBL3RaYTFyT25zM2tOa2FiT00v?=
 =?utf-8?B?YlRjVWZ2UTJ4VGEwRTE1bTZYdklldFNHK1hGRTkxL3hOZ1dudmYxNUxZZHc3?=
 =?utf-8?B?Tmd4cWxJL1ZtaStzSDJDb1JBOFUzT2lhaEVDMFdtYm9WRlZlYXZYU0l0RTFq?=
 =?utf-8?B?OXV0aklCNEF2SWRocjZNbmFsZzlDVzlwNTdyMWo1Z3VWUjMyZVVKb3JyM210?=
 =?utf-8?B?Zml1Z1NkQ3cwckVacDRJdUZOclEwZ0pKMDl3ZTlpSHU2N0lUVzBPM2lnN016?=
 =?utf-8?B?T1pzRWlqSHF2QS8vZ0pCSUhaQXQ1MmhlM3lSWUNzSU15SXRYeEVwYjNDU2Ur?=
 =?utf-8?B?QStJQWliTXZoOUpKQnhOK1MyV3JFV3RDUTNMMy94cEhIVnNoQ1VvZVZ5Wk9v?=
 =?utf-8?B?T3BkMmtCbjM0aHUrYjExSTNRSTh0TE9wSExpamZWK3hnczhYOU1HdTFTd2x6?=
 =?utf-8?B?ZmxUVWlxYXV0YnUrOExQM3V5MHlnd0xVRktKY2hNTE11bTJoaDAxZk9JS0la?=
 =?utf-8?B?Mm9FbHpoMUJzZWp0L1J6dDRqK0k4VW1IT2xISWw4ZWRUL1AydWFYMFBpOEx2?=
 =?utf-8?B?diszbDQ0U1lIWlA3dURIZm9ENXZGUHpIMUZkQkNqMFNPTWRRWVh2UmFmT3Zk?=
 =?utf-8?B?Y3ZPT2U3R204RDZmNVlnbFdYakRYRXVHT3EyM2hjTW1Gd3NCaWEzNzNENURR?=
 =?utf-8?B?UzFpNWdoRjFBMktCZ3ZpWFJkb1I2cjVwaWtFakgxU3kvcmRoTncrc3lwcS9M?=
 =?utf-8?B?WlRybG52cWRKemFHSHUvUnR1dVpFanRYOEhZTy9iL1hsNmhPaGZiNWs4ei9j?=
 =?utf-8?B?QnlFdTBHOE4yUHloeWpnTzN5WHRXR0M0NkJPQnpSL0Jjc1NqRkFrakZNZ2pZ?=
 =?utf-8?B?cDl5cllwRHlhM3NZK3laM1dXSkYvV01zVzNuRWpjbFlETGRkQW5SSFhYM24r?=
 =?utf-8?B?UjdqbzZTUit3N2cvQjRrYWlYaUxsUHRrZDMrWnZZT3VnNGFSdVZwbTU3MUM0?=
 =?utf-8?B?QmUycGh3aHRMYkY0VXdtTnRqSEJNalFNakRLUlBjR2VHS3pCcHlmZFB0WElz?=
 =?utf-8?B?Vzc5WE1CaUp1WkxYTHZvVVlGZEFaTW9FWGhqQnllSlBocXFpWXFmYzY4K1dm?=
 =?utf-8?B?TElQRXB1c3ZDVG9yeSt2S1dERDV3Rkcwbzg2Umo2ZGg3N1VRVExaWkEwVkpF?=
 =?utf-8?B?eDNFU0N3aE9JaVNVUjlsRjkyNnRvZ2VQTmQ5NzY1MW9kRnFMNWwzSmRlK0Rq?=
 =?utf-8?B?ajN4cWx5VjM1WlRWNkZPYWRIaUw1Ym5vNWZyWmVwdlQ0N29rVnAvbk9xQUln?=
 =?utf-8?B?YUNCVXJhSUZKWXgweW52Mkp6dlVYbm12VWkzalB1anlaUDJNNUZEOFFLTjRC?=
 =?utf-8?B?QWFZZ2R5L2JISGpwbjNlbkVZQzd2SUFYMlluZ2ZNOFFlcEUwRnpCV1JVemcw?=
 =?utf-8?B?eGFkU1VQMk8zTWtLWVJMWk1ySTU3b2I5MFczMTRFL0w1ZExrR3F4NXY4V0NE?=
 =?utf-8?B?TEdsVy9MR1VDV1VSbzlqcDI0djFwNnRDZUZTajNIdkpNTzhZV0FKQjJzQjh2?=
 =?utf-8?B?WVJYS01KTzVWTnNRK3hSMDU4ZjJZbWdQVjBHeFhTUjdnUUtSTW9GbHBWUEg5?=
 =?utf-8?B?NE14ejl0d2k4RFk3OWR3VlZZT292UThyU2grVUVWUHBVT1RGY2dvby9vYVlo?=
 =?utf-8?B?WnlJREVUWlQyVUtWOGhYWmU5T2thdUM4WW9BTUVmczFGRjlkbEI2cFdHM2FF?=
 =?utf-8?B?Y2k4bkcxWUNFTS9VSEUxTTNXTVpIdVdtVFNnQVhycmVZREI1a1lXdXFRam9D?=
 =?utf-8?B?eW9odHlBT1ptb25CaFhrS25GampNUmRheXU1YUl6SHk5cFBYTFc5R3lKYmtx?=
 =?utf-8?B?dWxkdmxYbGhOcnNBOUNVWFRXRjRualpjaTN0V3B0aDBzUGZMMG1CTEt3UG9N?=
 =?utf-8?Q?XUFt3YToNzoZ94QcKyIEO1cGD8xyFgIUzdybsFyNO26w?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 624b301c-d657-4335-6cc7-08de0c416c90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:20:26.8485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Kv9FZpnYDuIhvuBZwRx73oEAiDasOuoppSlMpVmBulJTMspRrcROsDXAVvGAAzQkbKXAYet9A3ahHRneRQMww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6218
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

On Mon Sep 29, 2025 at 1:18 PM JST, Alexandre Courbot wrote:
> On Fri Sep 26, 2025 at 10:05 PM JST, Danilo Krummrich wrote:
>> Meanwhile nova-core depends on CONFIG_64BIT and a raw DmaAddress is
>> always a u64, hence remove the now actually useless conversion.
>>
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Thanks - staging both for being applied to drm-rust-next after -rc1 is
> released.

Both patches pushed to drm-rust-next, thank you!
