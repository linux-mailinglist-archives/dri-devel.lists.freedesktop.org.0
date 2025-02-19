Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4763FA3AECA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 02:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9877B10E783;
	Wed, 19 Feb 2025 01:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KtVBV5UW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2076.outbound.protection.outlook.com [40.107.95.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E10410E198;
 Wed, 19 Feb 2025 01:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XLAJSwU6UiCLA0iqIMurL8+V/ZEEhLGWh+LSkkCiQaqsqXe3E+ypIaaSp2nhT6McLjyEmJNCDQsWehflVQYJ5fUZBfM2SkHbW2yTGZdpLfuY67duRKXxM7oYyGZvXA+CfZJYhklWekfDtROfmu8VRTiSwHH4BV5xPWnCRNYG4M0UpzCSsYgJ2yilpQJVNdvuQz1Tube8whgUX1twJ7PMqotdlEveUhLn6C+RUEO2cXIgKBCwseW22lu/+S55ZwQINH5auVbkrWomFnmtvbyD8h15hAloBXQDfJ2lnMHDQVQ0c6mV4aFkkOvPsLr6ri10XYHbhkrx6308ak440+ip+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUhhhAW7132e4vs7ozelPqy3ZytRAuG043zBXRY+Ifw=;
 b=LXSHhaL+rp/H6KlDD3taoPVHFKoNN2H1WVu4rr0NE0E5SnWaRETqrsgpj2AlSpODB9CUbg52wQy0NTCALLgnsxw+28eU5jB70TWMkVPtol/on2taaS861rHlPbQ8db2E72pzLK0FzFIBMQskqvRyxqYFI+c0F0EacZgqrJXEE3yVeAkDzy6/2BlvJ9ZApP2yUqzFL/CJWI9BwDoN84QEBRq+Q2lgu7RZgg5R68Y4Vid9t9+69KaT+OHEHZGKDV7xR6jJjaMyYuNNhIhZAWl7wejvGv4tDhOr8JDmyv3BDewAqip2JmUGNC4dXIlptePjkffpxby7BMLH2oigt4EYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUhhhAW7132e4vs7ozelPqy3ZytRAuG043zBXRY+Ifw=;
 b=KtVBV5UWgsh5+UWGal5vkhTXP+c5RaWLMSZ3SYIvGPWnrBWE5mdISNojfN0p0knuw6tQIduDR13P1drvXiUhFg3ISyFfAGMf9a14mIwH+a/ga8C3wMrITmP0oIoD31XeMOuFGBERdH+XC54W5JKoMo+2we1M09zNoUtW0+MrXzNAdt1GFqkQsYZj4t3J2YJWZKHXYgMzyiSytBKqNa812DHkpUURVyoX48JwJZyHPYm2r8k0E1VmNjXyyENe8+Vq4Fs5zJ7qX0PY7DPWu3VD+K9UZolwkYX8J6PrmfOHjCrafVVEK+fsD7j9ej9RrBnrHNDRqnQxTBUyExTSBDLo6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 01:21:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 01:21:43 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Feb 2025 10:21:38 +0900
Message-Id: <D7W119MHCCWH.IS600FTIOV8O@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "Ben Skeggs" <bskeggs@nvidia.com>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "daniel.almeida@collabora.com"
 <daniel.almeida@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <C1FF4314-C013-4AE1-A94E-444AFACDB4AC@collabora.com>
 <D7VLMD31YB0V.OKHDSVUPAZTE@nvidia.com>
 <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
In-Reply-To: <1b8921d46f7d70c7467ea0940d60220f05cccc5d.camel@nvidia.com>
X-ClientProxiedBy: OS3P301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:604:21f::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bc1b3b-b65a-45e0-046e-08dd5083c516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3RMN3ZrR0UyakJ3ZEZkd3ErdHpKcURVcTE2M0dsMkNWN1hyN0liT1pLV3Nl?=
 =?utf-8?B?K1JMQUs3NkRpTVNRYmdYSTZNTzBLb2c2aXBjVHBzMXd2QzV3MkxJNzBZbmZz?=
 =?utf-8?B?MlZSVGFrcXlmR0twUUhHQUlvSUtiSDJaaDNPQyt6b2NBMFZVcW9kZm5hNE5a?=
 =?utf-8?B?QjFLcFJTOEFTckx5ZmdRQmp5WVo2SzlyRW9WOVhUZ0VlMDB5Uk9Ldk9abXFr?=
 =?utf-8?B?eVd0YkgzbWxXZmlKaGI0K3FsNk1xT04yNmVpV2N6ckJtVUU2eUhJd1JrczMx?=
 =?utf-8?B?QmE4QXdaN0hKQk5KY0Z3WGZmWmNDT1N6eXZaWkxGVmNuSWdJb01BSGNOSElG?=
 =?utf-8?B?aDhaNitrOEk4YURwSUtRcWFINVMwWmxUOEFzN1VFN25tTXVtMEYvWlQ5ZVJR?=
 =?utf-8?B?UVl5dm5xSkRtcGJKV1VmN05iRXpKOGx2YUxRSjBlVFMyYUNQZjVBQjN2TElG?=
 =?utf-8?B?eHpsY2pwUTRrYWozOHUvSUE2dnBSQVRHWkhoTTV2OG5ZNWZMT3M0TFJtbHd2?=
 =?utf-8?B?VjdqTEFBdjBFN0JNY2N4MFloZU83NEVSUWdqUUJKMjFLbW9rMi9pa01tMmM1?=
 =?utf-8?B?WTFVRDFkYTRwUzFFeTJXOXBEVWJkVzJ1Y1dJaEtTZVNDT0dUeS83S29GNEJz?=
 =?utf-8?B?Z09mNXpNUUltSndOMlFTUVVoY1FseHZPY3FFQzZlMXhUVERhR25tV09uVVBl?=
 =?utf-8?B?NysvbFJPd2pURVByekdIRm56Rk1MalhKQ2ZjbjdjRVlFbGNLdXByeGU5Qy90?=
 =?utf-8?B?TDZ5VGc0OGNFa1QxM21oRlpYd0tucUJ2Y1JRa3ZFNW5QeTZSQjdmVjVVdU9q?=
 =?utf-8?B?Q2IyRytKUG8xSC9KUXExYis2TjZIc0wrcDNjRDJXNk1PK2pCUldHNG5Qdjdl?=
 =?utf-8?B?YnArTFBPMzF5YTN5MHdEbWNwOWtadlJ1UjNVVGRuWTlxQmMyYjMwMk9MdEdr?=
 =?utf-8?B?ZlZyTmZNc240eFFvMVlGanZ6M0JqZDhrb2ZnMFF6NmtBUzFTTXpxaDNuSXZD?=
 =?utf-8?B?a1FWVE9taFNkdGJKd3orNk5iUnY3QXhCZWIra29YMnV0cm0zS2Q5K2NTdTkr?=
 =?utf-8?B?WkdxTEszbnRDeUZSNUNPM3lGcUUyTzdaeEdXbDlPNndHcHZNbi9lcU5IYzVp?=
 =?utf-8?B?bDh2cUo4TWNMNjFNR1pFL0xGeHBNV0ZrZFI2K0VHclRmck9rSEpwWTlGa3BN?=
 =?utf-8?B?QTBCenRCY2pmNGRDd1k4Y0tFL3VBbDMwNmZaa0Z0SVVsUG9rT1ZkZUpVdU4w?=
 =?utf-8?B?VVBlVXhoV2NncWYrYkNOQXpKMDFpb0NJNFpxOHpMWGxHZU0vcHl5NEhrVERy?=
 =?utf-8?B?VS91NUwvVkk0VGJ1bk42YjJjTEppVjcvcTU5OU9tYmtwUGVLcG9CNXViZWR5?=
 =?utf-8?B?aG9Ia3BYdTByRDg1bmtrNVlVRk1uNXN2TEZyNWdHMkpmMWFrTjJ2aitZZThX?=
 =?utf-8?B?SmV1YldJaHExdmNNd0xodEFSWjA4MWhlWGFOSnJiVEF2ZVlIZ1U1amtqQ2Uy?=
 =?utf-8?B?NGZkRVowOWdYVHY1eGtnU3VBN3JhK2ZzUkZDV2tQTXViZUEvbmxnalduR1Y2?=
 =?utf-8?B?VnQ5LzVHTUJFMWNJQ2JvRU56ekJ5WDUvNCtXMHl4MkZOaW1pQ2tpYXBpYVlx?=
 =?utf-8?B?azlsQUNvc29yL0ZXSlkrcGZSVG9ma0JGTXZBcVhrL0E1ejBvcnF0ZEhGQ21W?=
 =?utf-8?B?SXZVL2VlbE1rU1hYS0tDemdQeGNzQ21MSkNxbTQwTU1PZnhrK3UzblhFa09w?=
 =?utf-8?B?ckJIMUd0bkEvY0RaenRuUnZ1dVk4T29Za2JVQjlRbnVxTERsYWNJRDF4RVhI?=
 =?utf-8?B?V2RqenA2bnZQU25zeWJGWTh0MTRtcnAxbmZaUHVPbkcrT1R3WGxmZ2xNMUgx?=
 =?utf-8?Q?5zJGggtZFQ2xr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEkwdzNIYkw1VThyblNMV1ZZTVozaC83dDRZK25DbkpVdXlRR1g4K05KcXhW?=
 =?utf-8?B?LzVRS3d5d0dFTWVRMS9EZlpFZ05XODZZMGpoSGkrb2tNYjRiaWh6WTB5YWJF?=
 =?utf-8?B?UWhxS1NFNC8yVGdjaW5VbVlFa3pFYzlsamxVbmU1YUN2eXcwd0JvSkJidlpK?=
 =?utf-8?B?L21ndXZiOVpHVEZGVUgyVUhJQ3I5UDdXMVpUbzNvNXNzL1l5WmJzU0RxeEZL?=
 =?utf-8?B?eUtDd0dSSUhVVHlEendKRTRCSWZDMEdoWVhGQWo4LzlyYmdtZnZjQUgwL21K?=
 =?utf-8?B?Y1lrRHpkTjVieGJFS25ydWdwbnUwKzNWa0ZhSXpnUWxNeUx3WEdMQ0h1NWox?=
 =?utf-8?B?QUtmVmxKdHVad0UydzNWYlFkSkZ0N2lGWWxJejlFTDhoK0hyKzFDY29IdW5W?=
 =?utf-8?B?MFR0M0JvYWZEaEdKc1FHajRXckFmOXorTWdlUzl3OC94d2ZQTTR3djBRb1Y3?=
 =?utf-8?B?NDMzU2dxSElQaU1qRU1NZjdGcWJqVUxVNWFia1Nic2FWZEV3Y1VVdjV1U28r?=
 =?utf-8?B?YWZTT2czRTN5Um1iOXJUTno0RmNjd1VpSnZkVVExdGpOL2xNS2FObURMSkVX?=
 =?utf-8?B?Zk02OWxESW5IdmdmRFVMdFpOVktVSmJUa08wWEhWSlN0U0M0WTVxUjZHaXZQ?=
 =?utf-8?B?TFRTd3JqejhZTkVFSHhxL2VoMFFrcGd6dGdiZkltaXZTQXFCVTRabUIxVXRE?=
 =?utf-8?B?bVFNdllRM0hZQ3locnU5OGlQcDJ5UCtSYUxHazZBdVQyUHBNQlBaaFZrK1RL?=
 =?utf-8?B?OGhDV3ZyTWNqd1p4aGFWRGtEQTd0a0NvR2NndGhtbkJQZlZ5WWFOWW9kUlVT?=
 =?utf-8?B?WitmR1pZUkZQS2tWNXZmTEZoZTVwa1dURUVNSE93Qm9sUkdmUEdsVVFwaUtk?=
 =?utf-8?B?TjFzS1cwOWplbXAxQ2ZLTTVva2hFdzArTFlZTXJYNWlIR2E4ZUVZbGxaMVcr?=
 =?utf-8?B?eXg2VFVwdFFVWlR2djhVZ3N1S09lcDNSOTJYdmh6RGZ5ZHN5NnYwVm04eUw5?=
 =?utf-8?B?S2ZsREcxN3RNNWw0YURPVklTVVdxbE1meGVlR2R1cldUcFBTekJMTEVzMDRL?=
 =?utf-8?B?ZGNMbmRYaUE0TCt3NHJsRWVteUkxZy9pSDV2WXpMNWlHRjI0ZXpzZUtjaU5a?=
 =?utf-8?B?YkdLVmJCMlRIb0kydW5rVDhDMHpBM0hTRzJGZEF1aGNxSjcrd3BEOTlXVHhS?=
 =?utf-8?B?SWFyN3RsZUdwMHlpdllyYjRZVTlmYS9ZQW11UXZ5RWM0MFJaMis4bHF2V0kx?=
 =?utf-8?B?alhsNlhKbzJYUzlIeUxDRDE5VVBJSzIrM1RjdHlxNnovRTJjUlBHWGtSSklN?=
 =?utf-8?B?WFJaNmZIYy80QythVnpBRi92UDhYV0ljOEJOUXVpU3hYZXdGbUNVVUtmanNw?=
 =?utf-8?B?amRmVDFOc2twNkNIVE5rYm5JOXZBbnlUNXZCaWp4VGlFRVdpRWo1Sk9HUXJo?=
 =?utf-8?B?cjJVdlZHVmVOUWpwRzVsaVpsUTk4U3Z4d0dmYXRmem5jNG1ja0pMMTF2T1hO?=
 =?utf-8?B?SUtCa09KSFRtcmZXQW9vVHBRNFp1OTFVS2tKTUY2QkRoUUVYT2loT1JWQ0tO?=
 =?utf-8?B?QnJrZnVnalNsQ0Yrbm9YeVEydGtORHlTMkJMNjlqY0hHaHV1ckxEMWdibDlX?=
 =?utf-8?B?WS8xdTVaeHdjOExvRzdXQVpmZ1FIVDc2Kzd2Q2l6ZGNBL0VDZVgvaFU5WjdG?=
 =?utf-8?B?OFlSckhKM2ZMNWkzWWdrTnZla3d0UjNpV0lPaWw2UVVheWFYVm9LeHVqbm5F?=
 =?utf-8?B?cGFIVm5UQWd4MitYT3dBMURWb2pMQmpYWmNpZU43N3pzd3BQNVg4eUdZb0JE?=
 =?utf-8?B?U2E4VFhZcmowcFg3VXVraHU0OUtTcW14bXBianFNME9ZbzRDODZVSnBoMGRp?=
 =?utf-8?B?YklTQW1JYXBJMVJwSWNxaFdTUHhlank3aDBTbjd4bUI5bXVnR21zRWx2SGpS?=
 =?utf-8?B?TUk2V1VWb1JOY1g2R3MxMEhxZUE2S29pNjZQSkFLQ1RKdHdDWlFJREFYRnVO?=
 =?utf-8?B?U3p4ZjNBQmRLOWtDYUFnS3BQOERVY2Z1RW9HRHp0bFdBSjF0NWJyTFlsUzZ4?=
 =?utf-8?B?dGFxc2FjaGVDKzJ5bXM4dlpvS1Z0Y1RPWm1KT1JQZTU2eVBISnQ5YXM0cDBI?=
 =?utf-8?Q?1Gbyc66jRybfNhP3ELzVzOLI2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bc1b3b-b65a-45e0-046e-08dd5083c516
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 01:21:43.5878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYLP4VlzOOdK5L/5isSgSq8rZWkw7lVx/LgYhMbSZHaAagbBQ65O0YATdPrDxEx7m/do6uqD7c84nnQg3g4UEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260
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

On Wed Feb 19, 2025 at 5:51 AM JST, Timur Tabi wrote:
> On Tue, 2025-02-18 at 22:16 +0900, Alexandre Courbot wrote:
>> > A proper struct with `high` and `low` might be more verbose, but
>> > it rules out this issue.
>>=20
>> Mmm indeed, so we would have client code looking like:
>>=20
>> =C2=A0 let SplitU64 { high, low } =3D some_u64.into_u32();
>>=20
>> instead of=20
>>=20
>> =C2=A0 let (high, low) =3D some_u64.into_u32();
>>=20
>> which is correct, and
>>=20
>> =C2=A0 let (low, high) =3D some_u64.into_u32();
>>=20
>> which is incorrect, but is likely to not be caught.
>
> I'm new to Rust, so let me see if I get this right.
>
> struct SplitU64 {
>   high: u32,
>   low: u32
> }
>
> So if you want to extract the upper 32 bits of a u64, you have to do this=
:
>
> let split =3D some_u64.into_u32s();
> let some_u32 =3D split.high;

More likely this would be something like:

  let SplitU64 { high: some_u32, .. } =3D some_u64;

Which is still a bit verbose, but a single-liner.

Actually. How about adding methods to this trait that return either
component?

  let some_u32 =3D some_u64.high_half();
  let another_u32 =3D some_u64.low_half();

These should be used most of the times, and using destructuring/tuple
would only be useful for a few select cases.

>
> as opposed to your original design:
>
> let (some_u32, _) =3D some_u64.into_u32s();
>
> Personally, I prefer the latter.  The other advantage is that into_u32s a=
nd
> from_u32s are reciprocal:
>
> assert_eq!(u64::from_u32s(u64::into_u32s(some_u64)), some_u64);
>
> (or something like that)

Yeah, having symmetry is definitely nice. OTOH there are no safeguards
against mixing up the order and the high and low components, so a
compromise will have to be made one way or the other. But if we also add
the methods I proposed above, that question should matter less.
