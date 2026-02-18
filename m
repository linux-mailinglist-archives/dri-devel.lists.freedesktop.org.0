Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEzWNmNplWm2QgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:25:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F105153A6B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 08:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB6310E569;
	Wed, 18 Feb 2026 07:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i7wJfvJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012042.outbound.protection.outlook.com
 [40.107.200.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 386D810E569;
 Wed, 18 Feb 2026 07:25:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH6Xcqt8/nEZllbrXQsc5J+KTMcMuuThCo8mMouPIHKCo37jorOmMzeHjPhlvgqRGcrgbhOUO7dc2bHWp4Ij6wq9PYb4nMyQwH1Sm3wIEbQQOq8x9hmy39+qhpiJUMWj1GmxTTQM7F1OkSI9Jmq23cHL0EY0zerDiHxEVZvEsXpPXiGecCzxwxlmBrNlTJDvQy9vEPDJXKuNDMNCsiGdogOFsBQ5muxq0+DRGs3drBnZS1e62N9S5JZwssY/ipdb1HpGoezRXa7+7T8Xc//RGeuhhUHI9B1k90f0J4zdrfWTGNjPrUInuQ1GaeTvJ5jmN9e3r/LfoVL+CY7S23Pkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1LVGznbFaxzZitUzv1Ms1cDnirl1MxBpeQMnKw0DS4=;
 b=zRDAOnK2Dhn8fRd0xH5Gg9UGRjzoeuoY9z+vh8nL3LjJpPIXqpRksCbmkg5ler6b+0W26mNBNhIqYwNiuF5NnQWSJY09G2i9Ql917OBW5hdBAp+5BnHGrJqEuORzA0DB+i1tudReCY40NlYiHZiohp5lmkBD3NCPk+df4srEOEFtv7HdAYv4VsZslHg0m+qchjYpROUrvG4atxxG39FxFHP9ILvmoiFEjZYW7h4/Hen1lxTLDkM99Bzzkcwk44bxyB4MrfwbggTINa+QWWBX5lC1P0QgRnioOwaPEnsSTVfQ4PoOHjpjSk+F6JRv/1rP62/JyCkHDvDeY14MAeq+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1LVGznbFaxzZitUzv1Ms1cDnirl1MxBpeQMnKw0DS4=;
 b=i7wJfvJQmshxU6eUEF5gYMZLQNPxTDJKvUjUO1bv9zJdJds/wKKe6CBbeEI827OV46l+pLCeaB5UzUgxkqx+BmS+pSFyJguqBCiphPh/7dtoLJZNA9gB4CR5y/f1H+8KMQKZqtWapM3kneUtW9D/1DbTAYNCjeyic3l/yyTXi7UKzLjfSiMvnbvv+9EDkKummyQdb/YB5NqhRaSd0ZL6SbmnzLwnb8Mat7pyli5F6pv3qax24TZGjGUrqzE7l8lWPvCKaTB+LwLUCTDElftxTCh+dL04oN8QLxMLLaCBfD5EeWu6ys10X0ih7eoQ5Ob89/8V5hzvsWdq/pnz6wnq2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9086.namprd12.prod.outlook.com (2603:10b6:a03:55f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 07:25:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 07:25:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 16:25:11 +0900
Message-Id: <DGHWPX5CVY7I.13DMDV642PCC@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/7] gpu: nova-core: gsp: add checking oversized commands
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
 <20260212-cmdq-continuation-v1-3-73079ded55e6@nvidia.com>
 <DGHRKO26RWX3.12AQHBX801G0T@nvidia.com>
 <DGHVZCZ3D5DY.35YV1XN6UK2QQ@nvidia.com>
In-Reply-To: <DGHVZCZ3D5DY.35YV1XN6UK2QQ@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9086:EE_
X-MS-Office365-Filtering-Correlation-Id: cc589224-35cc-4d78-0916-08de6ebedba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEVJZEdNZ1U3UWJWcDVSbVR0SGtIYVgxTytCZ2dzaldwZTZFQmNyOWQ4VThs?=
 =?utf-8?B?V1pVSlQvVmYzU2RNNTdSa3o2Nnp5aVRraU9vVDRLU3MyVUNpbThIekt0dk5X?=
 =?utf-8?B?WVdMbXd5bzdUbzA3RG85TEJBVU00cU5xcXQwYStOQS9pNDgzNUYwYno0eWNI?=
 =?utf-8?B?ZW9qc3I1RitTRTFueDhQVWdaZlREaUV2UWk5NzZGSjQza2N3cThxZnJWVFMr?=
 =?utf-8?B?UW8zTDZIbFZzVjY4OEVSVGdKSExnM1ZNazBneVpFNDZLU0pidlhhN3JyM0l2?=
 =?utf-8?B?YVh2WVBLdjVWeFN2bnJEYUkzbFRCVEdOalJ5UTdrSmJrRzVVOS9NaW02S1RT?=
 =?utf-8?B?WlRINjNnQ1VVYTN2bUlMdzE5Q2ZkODhjeDQwckt0RzNRZElxc3gwQnZMWU5u?=
 =?utf-8?B?NlFjS3lURG1YM1ZXZUoyY29kU0dkQ0QrYXZIYXczVHh6aWdRTXpYT0VNVVlr?=
 =?utf-8?B?eXJ5aW1JNVdpUTVVMVorZzdiMGlHUzdZc3VGTUw5bW05V3dVSEJpMWVUNWxJ?=
 =?utf-8?B?OTBoL0RYZm84bmhuUWw2aUdiL0l6d3dQYXFVU0M4czQyODF2S2poTzZjeGYz?=
 =?utf-8?B?dEZrNGdYVmRibXIwbkNScThvSHI5bEtueEZCWE14dHlMT3JBQjFQQ1o1eVcw?=
 =?utf-8?B?Q1pHUVlXNDJhL0hGZzBRZld3elVVWXBNSlFqK1c2bTJuQ0VGbEpCZG5nQys5?=
 =?utf-8?B?azJuTEE4UHJUb1oxZkhlb0w4UkZ3UFkrTTA5UUpac3lmRVhCMXdrdml6ZCs4?=
 =?utf-8?B?Q3FoUVd2WkFFelZlMUtINmNmVmtzNkxuUUN3YzB5ZjRDaW13M0grU1hGSi8x?=
 =?utf-8?B?RHFHVnpGcENEUTN3RkIzZTc4dStkTUhXN1UxcXc3QmpvVWdMOUJtck9Vcno3?=
 =?utf-8?B?VFVqMTNvaXJUNW5NQ2d6TFprbXF2RjFVRkQ4N0FSSno3YlhuZk9PLzl0RXd0?=
 =?utf-8?B?UnlDRnpvMG9BRDIyVXhxK3pLaWt1NGFCY25OTHJ0dEhQbVF1Z0pudE1ZaFRw?=
 =?utf-8?B?OThKNWFKdFJyY2Z3a05IYVdQWktDK0k4aER0Tlk3OHU0ZzVUMmNlVmZ1RXRa?=
 =?utf-8?B?Nmgyc2ppT0w5NWdRTmozSnRlRVNHWU80VExWdi9yVkFuVnR6V2NEVkF1dTVs?=
 =?utf-8?B?RWhzUWJ1cXloTmVrS3pxeG9UeHo2TnZ2bDVKNlJrSEtpdEJwU0M1VkQ4eTlP?=
 =?utf-8?B?Nk1vd0FVc1R2SWVNZlE4emUySmFyQWhIREVKdnhUZ2svSERaVWdkVmM3ZCt5?=
 =?utf-8?B?aldiSHdEbUdzRDA2WmtaVk5Hd0xzNWlMVU1PY3grS0dxSTBFK3M2RVcxUDl3?=
 =?utf-8?B?MTdYampRQnRCK21WRmxLN0tCY2VrT2xXZGFvRDlWSjV0a01zalhwN3RpVXBy?=
 =?utf-8?B?MlZvV29HcGJsUmRhSzUzWm1QeldXQnViUDhqditDd0s3SURFNlI4M1JsbXdJ?=
 =?utf-8?B?RnUxNitjbGpJUFcxWWFOS0JMb0trbEd1Ym5CV0pOWXhuaWpxaDBqVDVsU2Zv?=
 =?utf-8?B?SEY3VnNLeEN5R1kxaEdXN3c2S2EycmhqMWorOG9Bc2xmSkl4Tm1aMzc0OE92?=
 =?utf-8?B?NnNOd3ErQVVvcG1ONG41djdjbHoxeHdWOGt0Y2FGS1JVMTlSTGg1QzUyejdR?=
 =?utf-8?B?SlMwSWs2bzN1WklPeVk2U01QUjk3WjJaM05MTWZhb0ZYdnEzY0pPTkdMc2My?=
 =?utf-8?B?VDdUSXFpajlySjgvNDVaRzBwVGR0SERsZnY1b0o2SmNqOTJVNTVBL2NrTVJ3?=
 =?utf-8?B?aERQZHdiUk4xSHFrdk9kQ0lOakx2YUk0QmRyQUJyUXQ2aFVEMjNhTGRacmly?=
 =?utf-8?B?RTl3ZGIyVzB2MjExdmRCdDduV2FXZUxtRlgxOURmMkpwdG1vWllsT3ZpRkNC?=
 =?utf-8?B?cVRVNjRyUGJ3ZDMrRyswM3ZRRDJNMU11eVMySk1xWDg5Q2pvMklKc2hVeW1O?=
 =?utf-8?B?bzN6d3JuV2grU1hBOUVySGhQa1dxK1M2S1JBSGRvWGxkMnUxV1JmRkZwZ0Vs?=
 =?utf-8?B?OGFvcWlWZkNWTnBIWlRZaXlGNUE3VkVuK1c5c2VSZXVSSVF2SnN1UFI3S3BG?=
 =?utf-8?B?cDdnOVpKeUxHZEdXVGtnRllnaXZkRnhPcWtOU3dJQk9qb3lNYXRFUFEwbzFh?=
 =?utf-8?Q?USm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBhYXl5NlhZeVVuTE5vTmtoUWR5TFM0QlNOU1N6SG16LzJOY1g1RXFnMlIx?=
 =?utf-8?B?bWRxNXR4dTRtSDZhSldUZGdVNlhRb3owMy9OamRSNzh4NEdwMU9naVVCaHNn?=
 =?utf-8?B?cS83a2ZVbHJQYmREdEl1SkErQlhQazRyQkkvWjNIZ09ma1NYZGdKUEtOcVpv?=
 =?utf-8?B?dXROczVHRTVjTnNlcjZiVFBrUzhXS3ducDR2UG9WbUdkeDRHUXJPNXBQVGta?=
 =?utf-8?B?OEpCd3MvMjRMSmVkUkkrcjBlekE5M2poenhVN1F5M2NSSWpvRFFQczV5UUtH?=
 =?utf-8?B?eTVGdFozQTRNaW5uQU0xVm5LanVnWG9NZ2YwLytqL1J5SlN2M09qc0hkSGp6?=
 =?utf-8?B?OW5DcjN2UkRIZzl6MUZOWERxZUtCY25nNzV5SHhWbG92dUxZZWVpeW40bi9u?=
 =?utf-8?B?UHpSdkw5MlU3dHRBMjFESys5TGVPRkNFMEVjV0p3eEhDVG9DaUxOaGNZdWFn?=
 =?utf-8?B?cFR3TWZhZGx3S2duU0hFOGk0ZjFVSy9LdXlpMFlTUW15RzdKMk9mT29mME8x?=
 =?utf-8?B?L0wzUiszZDQ4UGh6dlUvUEc4T25kQWlKcmlQNWZINVlYSFREYWtlQVlPWVlv?=
 =?utf-8?B?ME9kOFdNcXYza0xGa1A3d01obW56MXdXT2NXZWFpYXo3SUNrUHRzYytIdXMr?=
 =?utf-8?B?WS9yN0NDYSsvaW1DV05mdDJKWGZXanlBQi9EZU1rTEI3dUs5T3VYUkZzRVZz?=
 =?utf-8?B?NkZ2eSt5ZjA3bkw5Vm0zd0J1b0xBTTZGSjhoNzB5TW41OWFXSnFFZ0F2bzJw?=
 =?utf-8?B?S1U3MmdkRFVKbUFma1JMNUVCZUppUUhGZTArdWJPVUJGUUliZDdrUHNvY3BW?=
 =?utf-8?B?dGdNc0dtNk95aWJZOHdKUEpPek5qdjA3VGY5bHF5b2MzMmRZSzVCUkp4ZTlu?=
 =?utf-8?B?WUdpbkRQQmdLSGRzbkFyQWdPakFUZE9QYW0rbmU1ZmJHLzR3YitDTUJJcDdw?=
 =?utf-8?B?aUxMY2g4WUNmRTcwVUxpSDg4dC80c3luNjExS1ZLNnBaem01MHI1ZlNiejZo?=
 =?utf-8?B?cEtnazBRUCtidTlPdnpzcjYybjhtWmJ4U3hTdlc1b3RHNFNpZGpUZGc3S0JT?=
 =?utf-8?B?a1VxR1NDUU1oYm5JeC9NeHUrVHZEL2YxdjN1WWpqaXdtQkZFZ2tYdzdlSUNo?=
 =?utf-8?B?cldacUxRWmpEeTBBYzNTbTcvK3dINURzK3BKRis2OWoreHJmWWpMeTB6Ty91?=
 =?utf-8?B?ZXJvS09CdmNZQjA3eThDTXVzMXlCeWdSRDZiRkE3Wkg5UjQ4OE80SEdpQ2dR?=
 =?utf-8?B?VmdnbkRKMXhHbUhlVDFaaDN3NzQ5d0xya3NENjQrb3VhRkhMWkV3QWd3Z1BF?=
 =?utf-8?B?cTZuYlZHN1E0UGw4VHJvZUQ3SmdXM2c4WDRWRjM2b0VJRlhITXdBMDZVazBX?=
 =?utf-8?B?SzdEdE1KMzdIS1ZOdXZlc2RmeGRKMGtROE0zYjFFWXI4VTM0TVMvRmFLSlZM?=
 =?utf-8?B?M1dSK0hXS2k1ZkVWUHNNQ0hiQk1hS05sRUxITXFOclU0clBVc2wzNlFnUmd5?=
 =?utf-8?B?K25mYVhSU0E2cnBaT2VHdlJ0dEQwSWVoQ3ZxYXZSVXVPTldZU3o3QmJidFlB?=
 =?utf-8?B?Z240NllFWkJNSUMwcndiNk5aQmhZMkNJaXdZWHBnWVNIUEVHYWQ4MmNsUzYv?=
 =?utf-8?B?WGJ6TkZCR3lvN1lGdEZVY3JSQklTSjBlZ0lDOXh6NVVnOHNMdUFlT0YxZ2J4?=
 =?utf-8?B?eHFQOEl4WkVCNC94QlArMU1yMTcvb2E5M09Sa3hSbHhNM0l2WnRBcTk0RS9W?=
 =?utf-8?B?Vm1qZklWRTRnUms2Y2V1Z05mei95aTF1UHZuekVHdmhtUGJJVW1vOThFMng4?=
 =?utf-8?B?aUtOZ3pJQ0xEVTVDOWNiNzM5dnBxdEVBWDdYWklISjE0WFczT3BMRmpEdkpq?=
 =?utf-8?B?b1BRNUdUUDNMb1lpdHJIaDZ3RG00S1ZuYjdEUFNIV2pZcUs0akF1L2dsZWRa?=
 =?utf-8?B?RkkyZHpQenk1RnloOTRpbmxoNTRHMHdBR2pKTk50aTlYUFF2QnRGZmtmN28z?=
 =?utf-8?B?eHZBMHAzYy9KSXlnUDI4UHI5VjdDZEN6WTZXSUdGaUJ6SnRXbnJPN1Y1MTVK?=
 =?utf-8?B?ZG9QZ0UyQlhma3RCaXNlN1A2cEJDdTFDek9wNGlCMHdNTSs0QVkybE9kODQ3?=
 =?utf-8?B?TklTcjBPbjJ0M201bHJDaDFNTWlNRXRjQ1VEVnlDVER6a1FmUFRUTHpnYVlS?=
 =?utf-8?B?VmFkOUtFQUMzZ2lDQkhkcjkvWUdDNUpPM1NMRUtNVHk2bDBsODJhMklvd2dX?=
 =?utf-8?B?OGZtMk1aLzc3RUEvaTl3NXg2ZnhlTXFNVlJhMEZVZ1FqMWYzS1RYS2g4WTZJ?=
 =?utf-8?B?bmNFS1lJOUhqT2c3MnVLcUZDejBZNzhXb3dZMGpoMFd3MVh3S0FkTnN4WjE3?=
 =?utf-8?Q?ZmKtinmXRHM70JJmv5Ab9q54GbEH5w764Ts7gNyhg6fau?=
X-MS-Exchange-AntiSpam-MessageData-1: DM5+rf/CtdVnrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc589224-35cc-4d78-0916-08de6ebedba5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 07:25:14.2408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cXA0F1k6hLthOpXmj+QaT3jaYeJdAuu/+1z6WXvwZgtIUi8Q/R2zxP57AXlNvhGlICChH5Y4RX9nY4t64w9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9086
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 4F105153A6B
X-Rspamd-Action: no action

On Wed Feb 18, 2026 at 3:50 PM JST, Eliot Courtney wrote:
> On Wed Feb 18, 2026 at 12:23 PM JST, Alexandre Courbot wrote:
>>> +/// Maximum size of a single GSP command in bytes.
>>> +///
>>> +/// A single command can span up to 16 GSP pages.
>>> +pub(crate) const MSGQ_MSG_SIZE_MAX: usize =3D GSP_PAGE_SIZE * 16;
>>
>> Where does this limitation come from? Is there a value in OpenRM that we
>> can add to the bindings as the source of truth?
>
> This is a GSP protocol level limitation. And yes, there's a constant
> so I'll add that to the bindings. Thanks!
>
>>
>>> +
>>>  /// Circular buffer of a [`Msgq`].
>>>  ///
>>>  /// This area of memory is to be shared between the driver and the GSP=
 to exchange commands or
>>> @@ -329,8 +334,11 @@ fn allocate_command(&mut self, size: usize) -> Res=
ult<GspCommand<'_>> {
>>>      /// # Errors
>>>      ///
>>>      /// - `ETIMEDOUT` if space does not become available within the ti=
meout.
>>> -    /// - `EIO` if the command header is not properly aligned.
>>> +    /// - `EIO` if the command header is not properly aligned or sizin=
g is impossible.
>>
>> `sizing is impossible` should be its own error - probably `EMSGSIZE`
>> (which would need to be added to `kernel/error.rs` in its own patch).
>> Also the wording sounds a bit confusing to me, why not say "if the
>> command is larger than `MSGQ_MSG_SIZE_MAX`"?
>
> Do you mean in its own patch in this series, or sent as a separate patch
> to a different tree (e.g. rfl)?

Please send it with this series, it is small enough that we can probably
get an Acked-by and merge it through the DRM tree.

>
> Tangential but I feel like some of the errors in this file are a bit
> odd, like the existing EIO if the command doesn't fit (which it always
> should). WDYT?

There is certainly room for improvement - if you see room for improving
(or better, removing!) errors, please don't hesitate!
