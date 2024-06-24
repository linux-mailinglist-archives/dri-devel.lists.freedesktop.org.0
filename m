Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5D914399
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5CA610E38A;
	Mon, 24 Jun 2024 07:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=synaptics.com header.i=@synaptics.com header.b="ASipZE86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2096.outbound.protection.outlook.com [40.107.237.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 887B310E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dmFAZQsH4q/8uKs3uxlOuzs1q7i77T3DFuN3spT+INFrTyAUo95EG111XhSVT4snp0pgoiERgKSUOCj6Lsc25DgRZkrpoVlAIxTfXDvMsj9UhXTRBYvbZgRozyof0F5oIspu+PPwjd6OuueacXTJgAJT9z0x+bKCZhlgIbJxArxLNrfwnpwnkcloCk6V/ISoK33Gm5aL3R1jC4cFk3VsmZOamOKslxYLyTSz71K6z36Nm8TxfnrI0oET0KwyxJVh/o0KIBxIl38spndSUqnDT7kSNPLWTlQ9iBvO9kyiWxOVikLpxCnYoJEeYZder3h1YEPlFlWP9ZT6ptC1b/Y0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ioIUhyWZjrbvg09RCncIZgEH+Hew8DYfovuwvpOfdss=;
 b=k5UN4wXzFbzStCTmCOctLjMuREWvsJVWJGWV1Z97j/PaUJ5CI8N8HDV7CnmlH1plSi/YId5FuL7KWuH4aXIH/PksAJZInilNu3zhpy0jH4sBiY2q52eAEOy2/aN30vs2PHAoOCHV3Hlm8dz0up8Z+DaoHyFyvua1qAOt/lFiqpnJLkXAU0XtMrnbA+6uxQfIxnuFOEZh2ReCzvfL6vI0a7OV3RtGGpSdkNz+l4pmgigIJqG+L6OEfwbFiMTQIC93MHZXKZFyFNIT2I1ZLeJNcuPARpbHSPnI9h80UNsfEn11j538zAURsX4NZU5/2WD71x5bjVSu/iPVvPiQir9LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ioIUhyWZjrbvg09RCncIZgEH+Hew8DYfovuwvpOfdss=;
 b=ASipZE868XTUql0yxdutejn98jhs5xDKCvHpYySjBqmAxmH8iUzQQEgE5zNa3YcuJfjyypl7cMgErHAyp0PXHeEbKnAC3CDjmBvfcs9WZgajSaqLFRDpzzHYDlCmeMGIWWD4MzUix/I43cqCXwGURwuaWtjxW606aW8xGveF71M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from BN9PR03MB6188.namprd03.prod.outlook.com (2603:10b6:408:101::18)
 by BY5PR03MB5063.namprd03.prod.outlook.com (2603:10b6:a03:1e4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Mon, 24 Jun
 2024 07:11:09 +0000
Received: from BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990]) by BN9PR03MB6188.namprd03.prod.outlook.com
 ([fe80::7b19:7f50:4645:3990%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 07:11:08 +0000
From: lukasz.spintzyk@synaptics.com
To: dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: drm/udl: Implementation of atomic cursor drm_plane
Date: Mon, 24 Jun 2024 09:10:37 +0200
Message-Id: <20240624071041.5087-1-lukasz.spintzyk@synaptics.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::16) To BN9PR03MB6188.namprd03.prod.outlook.com
 (2603:10b6:408:101::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR03MB6188:EE_|BY5PR03MB5063:EE_
X-MS-Office365-Filtering-Correlation-Id: bbb39e37-804a-48d7-b836-08dc941cd21c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|376011|1800799021|52116011|366013|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qVXBzPRfLrbG+O75FigdLXH8gRVA18QTHYHDI+MXN4BHu4TiouPxJh2+oOiP?=
 =?us-ascii?Q?hj6LUA9pf2knOxFjzmG9fTS0Rn8n8OXyIknCnb2scBTUcTsND9pFsQexpV9w?=
 =?us-ascii?Q?+m4Jy+a1X4Bi4QNa7E6+eBi67RXPZEtq4SULMqcHxRK5CgZP1djckQGlFXqM?=
 =?us-ascii?Q?1PXd0fKh8sNzvVn8ToppiZGwKzLMZ6vRQ58t5P36CpurCpJEhFaZrHtV5ot7?=
 =?us-ascii?Q?f1ys5+ArSbmpKrmHXuEbI7Mxi/ONNa3sCiU+Zc062/VCLHCZKVzdurMgxbau?=
 =?us-ascii?Q?PQ6o7CHd+WcM0Us/lV1gWktJry94zwl4Bj8A6n4nM5TQqvENTpP8p+AOYT7R?=
 =?us-ascii?Q?QzaeFH0+LMr1UpyJ4ma8aeQCP+y8ZL98QsNdVWe2QmUcGMe4+kdZwpyKU5wL?=
 =?us-ascii?Q?mDy4vXSYu4nTM1mWVr8QUxOxYdfQ4soDiPVQCqLZdRpasZdi/fn17/tIvuQQ?=
 =?us-ascii?Q?HgC1q3XxlHNMlxrqjxCdyWEBWGHeyMaCxAz5ZeHWUxMb5YbLy60Mvz5i6rZl?=
 =?us-ascii?Q?dLr9Ag5dCUEhJQF+Bsgoy70CZO6CZJTEphUDICX13CTX4pv8TYgf6Gx4qh2P?=
 =?us-ascii?Q?jq+zc5QnuZoTxlFfV3mS5kUa2HEV59gFL120huUvQW8JioSCxlpKLQ+3eWv5?=
 =?us-ascii?Q?MHeHUtroCiEgp0HXQw/FID5MnQGkk0+iRzMqJ73UTvbTyjalyc3aQ4YTMKDB?=
 =?us-ascii?Q?rvbLn+p3z6t+qhDt/Id17Oxez0eR9Wa/2rq9TLdnvzD0gn4ilxlBjQmmGhW2?=
 =?us-ascii?Q?Z1FecuFmOMIW6PoDKnJkLWsTzI2XSEMG5ZS6VIz7e3J0InZC4Z4EcKXikBhj?=
 =?us-ascii?Q?P0OuKW9juETDu3jzhO7is4vFipoKiRclSN+G5f/MozGt3HJH1fG054NVCCcy?=
 =?us-ascii?Q?w6cP/HHQAwWvpGzL2q01g7GHFUtwqZ3L1M/xdXaqVOt5ZEpixw/zO41fKdrG?=
 =?us-ascii?Q?+zmb6ToMCTfluKIWpLAGtWLpNvY6RzpJxAmXjoc0UnhZfpQHtZH801/kYNfO?=
 =?us-ascii?Q?iAfi7ifqeZzDREn8sxzAG9OIk1VyY5udrvHHE9Zkbdvgc6WYBtFGOymBFpve?=
 =?us-ascii?Q?ICEemIUJ0G1bh5jzWWw0dLL7+1vOTsWyX+2Jcbz0F765TTACz/7YmyHFQ5J8?=
 =?us-ascii?Q?KRZV4vSQJduFlx1+jxjKb5gHVIP1rUbpaKxZMB8wMZ7KYzdWmg4NdJgQcK1r?=
 =?us-ascii?Q?kUrw5nJzwwnN86KNaxbYc8Oi0Op5bpHsig3LEix43cek/xYgxV5EV+bPfHSW?=
 =?us-ascii?Q?73SOsWd01/Pwl4EpxASmOGloikP1zIBCkFdeG3fJMbkzbdLfHfkow8Nm5U5R?=
 =?us-ascii?Q?/AeFAPztF4fOXSgVUr/IReVDWwnvKLpCpAqFGTVavXamGOK4208Aa8cYaCzQ?=
 =?us-ascii?Q?fWMORrA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR03MB6188.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(52116011)(366013)(38350700011); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2pZl+3b4xfRoI0Hvwx95eCFx/oDf2pcUD15yDNzgDDZcZgcB8OpHSwwzqq3p?=
 =?us-ascii?Q?7f40a296JCTQN3H7pf3C/JnHgKVfnjnkU/nyUim0mT9qrgHvrDQbxY/f1/Kl?=
 =?us-ascii?Q?OR41jfm9T/PmCqOEc1ybtGmBp7wCgU4cN1uFmXJPeU3OB831nOwSbXgkN33J?=
 =?us-ascii?Q?2PgNhrtbY2E4wTySfI8LKijmJ4vEGnRhS9OqgP29UZepA4k9mf+wO6NCMVYh?=
 =?us-ascii?Q?cLtPYL8ZqYLkL8XVJt2SChdVVmGE4L8SbWjKll63chV8CY0BKJ310bPbVcG8?=
 =?us-ascii?Q?l6mh7A+5hHmQh0WrQI6Ha5MXvaOpThm2inmzNiow8oYt083EThtAc4f9TPiF?=
 =?us-ascii?Q?cQnxeaLNoAIFqrkekjt92Tu0bk6H7uGEBL57hZneH1aWY2Sn1GSNpQ0y0qmi?=
 =?us-ascii?Q?0T6S3Hv5SOZLzawcyWZ5TwB/vPVSk60CVwbXJORJWCEIffLI8/lawfwdkylp?=
 =?us-ascii?Q?cPpaN+LtZrMyvFy8yvHopouqqhb7QoBtPW73a0TZTJtN1K/9sNCJk8oR3PWe?=
 =?us-ascii?Q?Aj4ZZsqlCvpeHrNwn+uVudWJEkpL/Otxctm0soYukcPFx+0+o6vUyQH+6q1W?=
 =?us-ascii?Q?sjkhJOeC0IrF84T4I6tudHLd1nd6s/Zt4wiaTLvzYk2ChudmbeQnhVtD+lmr?=
 =?us-ascii?Q?8BEG2aoGNTuDsQ2v0K1MpqtrlXBpEB11Baa8bj5OTuw9HD/bU99Hfp9aSwfa?=
 =?us-ascii?Q?Vx+OL2+K4G+rSCytw8YJ6XHLSJB9EpvPhuT87h9BBOp4KACQJDCuVIBjliag?=
 =?us-ascii?Q?O4CjNJVBiDBP39534I5DWL6V1/Z3k5FkX1keY2EZVn9E8UkHIZDL0LExMfmP?=
 =?us-ascii?Q?svhwbejFI4BZ0/GBHXOnrEKUdm4+S6h2xnHnnfeGkKY+kWN1rhDeIaj97C1K?=
 =?us-ascii?Q?DgzfSO2nmjmTbiMRdxTKuSkwJMUFIvaCVuCtMk708JcfbJSWaEIUaot2VHfn?=
 =?us-ascii?Q?pPR4jzR9xdUAHwsrp/XB3YZEWnp8PRrpSdiZ04lcRz/Ta8868/vUS38xBJiD?=
 =?us-ascii?Q?fJfUdQSMmwiqRVO6W0Dh/XqgtJWfFJRDIANrgPdNK17mfM81Z0rcRfuVz1Jf?=
 =?us-ascii?Q?E1DNHRdmBby8ZIyu0i5mvL6INeeLmopKBDFyElus2c3ftmpROIvpQ0V7kYK6?=
 =?us-ascii?Q?/vf9l8roTGrnkxmY8l2JmqlT9S4LEooLOh8uMvUOUgKWEvferxevFU1KLz5i?=
 =?us-ascii?Q?w1/pCxVhLoJLSB6sRTRmVsOnJMYIh82n7xozN4l6X2DW0Fciz4ydNg0dFD1B?=
 =?us-ascii?Q?mM3K8lCdLEBMmAANEgi8X0uK3jkUw8zEJJMbZi4Tps1/zaKk2j0/zgaPtcBN?=
 =?us-ascii?Q?kIZ1jFvbCuQrUjP5kOo6uxbBwgc6VILebpT99JznAvtTUxP7jE1fNONsY834?=
 =?us-ascii?Q?kuUAHZ8KPR/7ZyE+QeIGeIIL5PMJymkE0MMWkFS/ysNhg0NSjtesFMZcqTtt?=
 =?us-ascii?Q?r/y9EjRyaFmnWldHkbwPmoQ4LiJgBy54ekONTtoWplrrw0BFJe3Yxp2oZJrU?=
 =?us-ascii?Q?4TGoyUXboZMOpkIKEaCfTdIoWAmRAgAmzao9KphuYbG4BSTmMui/NUyz83F0?=
 =?us-ascii?Q?lU3f7LWBZG6UqLI31nNfr/f/JYWqywMKHsSW8jyf?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbb39e37-804a-48d7-b836-08dc941cd21c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR03MB6188.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 07:11:08.6937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21kq5GKvPuT+v48fv7p15d6hTG/eKS3VHeY9A1CXb8nEyD4eEAq4h5P3VaUkDsu5p2zH8RpZ05hPrcIA0/1Ohg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-Mailman-Approved-At: Mon, 24 Jun 2024 07:22:58 +0000
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

This brings cursor on DisplayLink USB2.0 device on ChromeOS compositor that requires either crtc'c cursor_set callback
or cursor drm_plane. Patch was tested on ChromeOS and Ubuntu 22.04 with Gnome/Wayland


