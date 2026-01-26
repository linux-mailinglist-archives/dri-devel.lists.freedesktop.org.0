Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e4fnCBbBdmnOVgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 02:19:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EA8348C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 02:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EAD10E0CA;
	Mon, 26 Jan 2026 01:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qWP2MkUK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9046810E0CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 01:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOZH6AMN+A4FtaGJ7KQ95LNn2MeUcG0gfoQgn2pMoRRqH21luq4onkvrdb4ls23K9E+szu4UqdJirx7N1rFYNtYZLbml8BrqQqdgNH5bYrJ8Fi49ej66cSE2ITW7gkP0+p49JF+fijqFsMua5Pzv09T83USIeH9j42mCrA7sgXvs8KFSSIg+Pxsw65O5sl/+K8KP2+2f8iRA9JVPhQzeDW72JPMK3At+n2UDSSNz0378yKtouk6AetiWpz0H/86DBrwZn59L/vKkvGDz2J5bmAedYqkkf/tvszDPXRb13yDZjrdDflC/x+AyDFLrA3WPAbe7cy29jWOPe9YPgxyDjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ap1ghe6HBHSH+oswhGVsFLL14OGsVcdRTLjoYHiA28=;
 b=CarhUBYzdpIXAglZ5z+Sr5ann22xfW1Log6pV/X63F+cPiMGSfcRhQCgK9jJBbgbxehmrGdbtQEJhkROuaiIpoUMNrBXJzinQ5JaswDR3+ZpzcedWO/OqVL3ynYAdGG4zIY0wHyZtA10COdPkCMbJsMQ14RYaxUW66W8doLUmItiYjA75hb3iAo8fZmMHGhjN11BOTI0nHH49gi6w75wuFZ3oCJBLbq/j/RELDm2hiJ8uK2hMjaAbw1QIuJYUWfvblcNkArtHaQJl8shFevsIpFZ4DKOU9X4gQr/ui4VHV5DBRv/YgJEOJP5t+QqwybkggSaGyiXEi5SKSEQs/xTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ap1ghe6HBHSH+oswhGVsFLL14OGsVcdRTLjoYHiA28=;
 b=qWP2MkUKTm3tJvnur475cpssZe7OE6qnEdhFWqjNsB7e5GKi6jbk7dJHaI/DfDmbI+oVOjjoTq83rBfFXkFUC8Fy7C9S1+iAWRofTFujzo0HB8xmwXan1OtIChi0AVXVpsq1CwSPN0ol8dqKMr0HcemP03q43BE74IZX3zgJmDKSnkPbuYcBwBgJIwxvRJMJnRCv+TgKYeFkmgDvtGu7JoeKPnjxKEWgsgLpb81IsyjwNHPD/ZE/li6kmDx232emvcuQQ1wMO5JzEDx9qEni9UHXKfr7k/pqVZMFBZB6ociiBoUGrU5TWPRvz2ob7bkMhwpUokc+d8357yhsgEOkHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SN7PR12MB7252.namprd12.prod.outlook.com (2603:10b6:806:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 01:19:10 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Mon, 26 Jan 2026
 01:19:10 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
Date: Mon, 26 Jan 2026 10:19:04 +0900
Message-ID: <4092608.jE0xQCEvom@senjougahara>
In-Reply-To: <20260125131323.45108-1-clamor95@gmail.com>
References: <20260125131323.45108-1-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SN7PR12MB7252:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fbcae3b-014c-414f-826d-08de5c78e8bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTQ3QTRPOFdaUlFqdHltLzIwdG8zZWtUbXlnajFkSUFEUFNodXB2eUJXR1da?=
 =?utf-8?B?ZDNXRkdSeHgySDBoNEdZWGpSYUxSbEJDYmRnVWF0a1BPMVgzTytnSmY3NEkw?=
 =?utf-8?B?dERoQSttNlF2ellSRkFtVnR0dWhmMVdmbkFqN05BUjh6OVhyVmlLOFVJQi9D?=
 =?utf-8?B?ZUwxME1scDdXSzN3NTl4S0hiSDJ0Y2xlS2MwczdKY3RZTTM0NzROdTFyQWxB?=
 =?utf-8?B?V1pQRzd1NU01RHk3Vk1yd2NyaTg3dTBRSkRISkhFaVpxdkFsNDE4a0Vscmt5?=
 =?utf-8?B?Y2xtZkVDS0J2eitpdFNBL0RLWkFYRWd3STZPbVVTbWg3NDZFN2JJblV2a0FT?=
 =?utf-8?B?SlRvTzFnWmNaNjN6TG1hNUNvQndjbmdJaVBnSTlqSjJ1REJoNml5ck5sSjVW?=
 =?utf-8?B?b2pBMUFyN3NaVjFPaGNHQUJEVG5EMGpMRnY3UE1IQU95THFoQ0FvQ2RsQU5v?=
 =?utf-8?B?bnVoWGZDYjVhOXdVeHcyam9OeWkxUS9PeFhTR1lvTlEveGxWMVlGUVVXSVlU?=
 =?utf-8?B?c3BSOHM4cGRncitvTlovZ0VDN3Bzd2xCbGRLVDZKVFpybDhqaHBlSUQrNmo3?=
 =?utf-8?B?MGZXTWVqQTJnc2xvVytqQVREZGh5VGk0aDhSZzVYN2pvSVNscmh6dnV5SEZq?=
 =?utf-8?B?UDB1d3ovMkhpZlZpS05iWmIzOTNQZk90MkpKbUsvUTk0OHYvWUlORzAzaXR5?=
 =?utf-8?B?cnhZaVRmTTJ3Tk96cnl4MzJKQWpiWk4zbkYrRXZJTHlPNm1WSnJXcXFjUGNw?=
 =?utf-8?B?RHR3VUUwZ0ZGNStaVE1QMFJ5Nzc3RFJzMUZ1RVdMRlowNlgxdHB5MFYza203?=
 =?utf-8?B?ZkZLSjZhTXBFSE5TbzQrOTA1eGZsR1FBT3hZcS9xMlJtTGh0ajRoNGdSK3BH?=
 =?utf-8?B?V0U0dmtHQzgvYmZKMkdaN1RpVHYzZkVDdXk1U3F2OG1wYmcwM1hGajhXTVpD?=
 =?utf-8?B?OG9sN1dsbENYbWNORlhDcHhTNVlvZnlCa0N5SzNkNlBMVVV0N1p1ZlBYZUc0?=
 =?utf-8?B?RnBUbHJKbmZldnJuWTEvV2NzNTU5ei8ydWhXd0dRaG5QSjVPazZBMmd4aEFk?=
 =?utf-8?B?N1hPTVltSE5MenFvanhCa1VSZURCc2l1UFJtUUpmdzJEYVNTZXRsQnVSdUNZ?=
 =?utf-8?B?dWhuUXFKOG81ZlNoL2NtZ0N2TmFhdmt6bFFqQlArSmpDQVhKUG5IZ3pzYXpo?=
 =?utf-8?B?UEJRejZoS3F4YWsyUHdxdDVYbTFTYnE1cmhSSlRSRnhSY2dkd0JXb29oZ1VW?=
 =?utf-8?B?RCt6TDhRK0RvVTdHNHZ6RVBLaFJ4ZTF5WHIvMTB2ZU1iaUFHOHNna0ZlN2lu?=
 =?utf-8?B?cHlwMVNLdVBLMkdqMktaTCthakNCV1UrU1NLRTZadFdmUEk0SGFSMVlsK3hR?=
 =?utf-8?B?SWVHN3k0YUpzWWI3RlVHcTJiUjRDKzd2YldPaUQ4d3pUWERCV1lpUE5NMFdU?=
 =?utf-8?B?MEtLNGU3ODF0L1RRWUpVWmgxU0JudkxxN0ZGdkFVWENDQzMwQ2lQK1NOZSt2?=
 =?utf-8?B?Rm8xcnlUNjVoNy9JTE1XZmNXZk52M3RkQm9yeUg5cS8rbFp6VERCQld5ckdk?=
 =?utf-8?B?TEp6V3AzUnlsMzlhbGQ5SzRyMko2enpHSlFEVjB5YlEzZVVrTmY5N0VtUXRT?=
 =?utf-8?B?anpYcXpwWGlRM1JyZGttVVJyLzI2QWdmNVBvNDlTakZlZWJlNTdKUUR4OHVy?=
 =?utf-8?B?YmpzY3NYcjVlQjZDZ1diazBieG9RajdaNHAxTktZd3RsSTJ2VzVlRVJLakVa?=
 =?utf-8?B?Tm5qRHNhTkpDaE92eW1acFVhOVZDSGw3M1pVdVBjSW83T05kZFQ1ZlZOSG55?=
 =?utf-8?B?K2h2WGtJY0k1cUhvK1hqYmNQUkQ4VDd5UEE5Y1BXellUdW0rc2FROWoxdExK?=
 =?utf-8?B?d1FmeUc2Uzl0aFAzbElwdVNJdjRQb01MYU0vTnNGdkw1azV4TEI3K0d4WWti?=
 =?utf-8?B?Umd5T1FsQm1VZzRIRUhXejBBUHI5OFFVTmlza0pheDdYZGJFRHpPbWp5NjZF?=
 =?utf-8?B?TDBsemRaMFEycktOY0tTWHdVVkt1TEg1OUdlaHdTcWdwM2xhUmlLckRMWU95?=
 =?utf-8?B?MjJqOC9WREdPMXpOVTJNMnRlaGZVRTc3Mkp0QUlwcWxUZ1ZFbEhwcCtNRzJN?=
 =?utf-8?Q?ftTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJQN1hSbG5SdFhWYzRkdC9lU0c2K1E1Q1o2T0tzYU9iWXlhbGtpbWhiT0po?=
 =?utf-8?B?S3Z2ZTAydTBTS2lwL3hGMmRJQjhMZ3BEYk5aRzRGMC9YTlh5c0FMUGhuVXcy?=
 =?utf-8?B?WmZueFFOMkNBZWpXSW41MzdEWmJEM0Q5TnZVNGp3VVNaL01YNDR1T3pYNC82?=
 =?utf-8?B?ZzFMRHNoVkNNcEZJYTJwOWxncjJwekZCNWRibXhVbEZOdzdCNjZIUkNUdDNE?=
 =?utf-8?B?S1VzdjFweHRpaTc4VTV6S0pyejlhR3pmSFFMMXJZbmo2UVhxanE1bGJLZXFV?=
 =?utf-8?B?dzJMTGxWTVVjdkd4Mk9oRUJObjdrc3BFaUwxa3dhcWlnMTVTcUlKcHIvanUy?=
 =?utf-8?B?YXNuQStON0xJSG5VbzE5T2V0SHZRWU55bjIrV0drSE5taVkvWHRuQ3J0czdZ?=
 =?utf-8?B?bTlveDZWZnlMTkQvd01PbHlVVzQ5VEhGOVc3OTdsMDRLeXVkcDNOUUxDd0lT?=
 =?utf-8?B?a3N3S3diUUkxQWx1Qi9xNHA2RjdIaVhYZEVpTjNHVVd6YmNOUE1Id1RFV3NK?=
 =?utf-8?B?NnVETzBNV01hZUZGNVFFcVBPdS9kMHlyaHE3bi9jQ1h0RVc0cVBXeU1NSDdk?=
 =?utf-8?B?cGJrbXM3U0lEY2RsNVBNWFJqb0J3ME9PdXhFcFJQRnZ4ZzlOWElDdmJkQWl3?=
 =?utf-8?B?Nm50SkJPbzY4U29vbGFReU15YWxDVWU5SmxmdUFNVWExa0hPTXZMbjJVVUdz?=
 =?utf-8?B?a1dqYk4xNjdSSnVnd0tHQ1l1Wnpia3RtYVhUYnJZekEzbVU2YnhBckdjQWlt?=
 =?utf-8?B?L3ZEQVIzTGxkbFlPdG5JUGRzcVllWFNUODJHZjVWbFJFYll4ZWxvK29JMFNZ?=
 =?utf-8?B?cG9MelJHSXduSFFOWEdaaUVYQXdpd0JJSXZUeEEyVE1xNWdUR1lxVDlFNDNy?=
 =?utf-8?B?eGpEOURSdk1PQVEzK0lHL2lGVUFwZnNpeGYrVmZhbnhodGV5TzFyVzQrc3Na?=
 =?utf-8?B?ZzloU3JsM0RRZDdVVUNmMXUzQjExTmF3Rkp0SjFKV2ZKYTU5dkxZelFWV3A4?=
 =?utf-8?B?bXU5RVN5cU5nenpub09BR2QveVZ0cE5id0hNeXlHaFhvVExMc0FyQ01BVHY3?=
 =?utf-8?B?bVBGbVQxWkhUdjB1ZC8rSWRRRE9oVThuV0RlV2N0YVpWeDloT2NvUVJvcGRq?=
 =?utf-8?B?SHBLcDEzS3N2eUVpNmxRdFhFSm9tc240Qlh3dkU0NkwxcEp4S1E0TXUyS3c2?=
 =?utf-8?B?L0RjR2dHTDdpdjdaN3djV1Vtdit6RVN1SlN3bHROVmxObHRrcFd6WUV2emc5?=
 =?utf-8?B?Z1RGQlZMK3lCOFM1MW5YN2gyd3Y3UTFzT051TGVNUTNKYVZaaG96OEUzRTR4?=
 =?utf-8?B?K1JwQUg4S2l5dHM3aVZRdW5jMnJySFdQV0lUVUNSakw3Z1cvOFNRTmtHbnAx?=
 =?utf-8?B?Y2JXNU4wdURLMUdMN29kUno5SHUvN1ovTC9wSE5uSWNDaC9EclJrbldOWXoz?=
 =?utf-8?B?NTRYMXR1NU5ZaVp6bVBtbjQ3N2luTWswNUFIS0JobVVsVDJEd0NOcnlLSFhK?=
 =?utf-8?B?MVpwNWZNRVU4WG5tekFaZG50VFhOK2Z2NW5QdmY5OHdoajlzVWhQRjZ2bjZl?=
 =?utf-8?B?UDZxeituVWFkYTlxU25LYURsRUpSNEEwMmVtNk93bW80S0dnWmpHckI1aytY?=
 =?utf-8?B?VVFNb2JSNzFSa0VHZWwzcy92azNQd045eUlSYUQ1SVpTMEtWK01tNXljRkda?=
 =?utf-8?B?QWd1VERaMEpOYUtpL3hpNUFSSk4rdGtINjhzenBWekZWMUI5U0ZZbGwza2or?=
 =?utf-8?B?d1lsYzZ2Yi9BNlhpZHFhN1MwSW9Bb3RjeStSVkUwOUVXR3pxbHJpMElNN2FB?=
 =?utf-8?B?MXU3cnhMOS9BR2dkbDhxQU9CVGNCQXI5ay9tU2ZIeTNBS0JINTF1b1VVblNt?=
 =?utf-8?B?NXE0S2lTTVRsWGZ6WlFYSVd4S1lCU25iUGZSN2lueHB6bWRGeVRJSk9GOUtE?=
 =?utf-8?B?d1ZySjV4bHBsVUZUTGo4cldMS2RBM1paZGNxVzhHcTI4ZTZHQU5qNWxBRld5?=
 =?utf-8?B?cnlHR1UwS1NlckZOMjVQNXJ0bm1CMHF5OFlrRytxTEh1K0xKMkc2NkQwR2Zp?=
 =?utf-8?B?Y3ZEeXhyR1FPZWFSanhEbTRTWUNrVkk3RmRGZTkvVDNzWHlzMjF5cys3YXRr?=
 =?utf-8?B?QjAxdGVNZDVya1draHkxNG9TSkkzL2tncCtZd0lpWDA4TnBKYU1oNDRVYXFp?=
 =?utf-8?B?TkxyM3BEV0ZOa3FIV09MV0xCelNzN2x6dmZod0VXcWFpa3E1WXMzSyszcE55?=
 =?utf-8?B?NkZPSHlkYkNpczlSbHM3Ylg0TC9SYlFGVFlhUnpXUU9GNlRQS0ZSc2xXaUl5?=
 =?utf-8?B?VlZEU0VUOXE0bFA5Z01yUEorQVU2ZEY0WGR6VFNyNFhlVU9IRkMvUlEvRUFr?=
 =?utf-8?Q?diQNfzaJJKT6Xl0Ux273OPtEkWyO7ADXbI4w8EwW7ty2N?=
X-MS-Exchange-AntiSpam-MessageData-1: yIpavJ+bX5Lpww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbcae3b-014c-414f-826d-08de5c78e8bb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 01:19:10.4978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+Lay24g8v01us1GRHoArn7altR+P38UF7VP4QwdUfqNtvgtP1+wvsCt0uWOONOCyRo4Z4wRE6pzOwORnCo8kA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7252
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch,nvidia.com,tecnico.ulisboa.pt];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.reding@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathanh@nvidia.com,m:diogo.ivo@tecnico.ulisboa.pt,m:clamor95@gmail.com,m:linux-tegra@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6F4EA8348C
X-Rspamd-Action: no action

On Sunday, January 25, 2026 10:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>=20
> This patchset depends on Tegra20/Tegra30 CSI bringup since both share
> MIPI calibration logic. Ideally these patches should be picked after
> CSI bringup but they will not break anything even if picked before
> CSI patches.
>=20
> ---
> Changes in v2:
> - removed all MIPI calibration, it is handled within CSI bringup
> - added per-soc structures into of_match
> - added fix for hang caused by register access with uninited hw
>=20
> Changes in v3:
> - switched from version DSI to boolean flags
> - added comment regarding Tegra30 clock configuration
> - commits were picked:
>   "clk: tegra20: reparent dsi clock to pll_d_out0"
>   "ARM: tegra: adjust DSI nodes for Tegra20/Tegra30"
> - commit adapted to recent DSI changes:
>   "gpu/drm: tegra: dsi: move prepare function at the top of encoder
>     enable" > "gpu/drm: tegra: dsi: re-add clear enable register if
>     DSI was powered by bootloader"
> ---
>=20
> Svyatoslav Ryhel (2):
>   gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
>   gpu/drm: tegra: dsi: re-add clear enable register if DSI was powered
>     by bootloader
>=20
>  drivers/gpu/drm/tegra/drm.c |   2 +
>  drivers/gpu/drm/tegra/dsi.c | 116 ++++++++++++++++++++++++++----------
>  drivers/gpu/drm/tegra/dsi.h |  10 ++++
>  3 files changed, 97 insertions(+), 31 deletions(-)
>=20
>=20

The subject prefix for both patches should be 'drm/tegra: ...', and for pat=
ch 2, the Fixes trailers should not have the separating empty line from Sig=
ned-off-by. Otherwise

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Maybe Thierry can fix those while applying?



