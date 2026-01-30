Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHLKFc51fGmWNAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:11:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A396FB8BFC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 10:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A8410E968;
	Fri, 30 Jan 2026 09:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="s2NAwqgk";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="j8U4QPHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 458 seconds by postgrey-1.36 at gabe;
 Fri, 30 Jan 2026 09:11:36 UTC
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E131510E968
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 09:11:36 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60U6X0QW1861229; Fri, 30 Jan 2026 09:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-id:content-transfer-encoding:content-type:date:from
 :in-reply-to:message-id:mime-version:references:subject:to; s=
 dk201812; bh=aFs64QJdLTsdI2cQXPRPtn/iL6W6BD9rgCE2AdZdInA=; b=s2N
 AwqgkVE0PzpyzoEbg8G1LXgCRUEluK7ebcR+INOGSYYy40G89TgS4RTG5d98ncyp
 CVWxv40DX72aVE4I2j3wvVtp0grqWDa2ip6OttGyn8zXAcn1QyNu/tAXAIxTdQbS
 FSKIfJh5GCQztZ427ajPA0bmgeIaeedqklEFkEJvjvvSdMqfUeWiuY9choYvoD3G
 Q6RoKeQHv/xFcNiTUSBLMGnK3xE8ZRps+qoQKDaj2rgx61xtHkobhx+8RerCqmmW
 gKnlRVuf6F1XSmiUpGxcQHhyOB23579dAClOyoZ2BNC2KXyzimPbORv3LJn8+iBr
 J/tWuDPaYKdsgPs/v/Q==
Received: from cwxp265cu010.outbound.protection.outlook.com
 (mail-ukwestazon11022130.outbound.protection.outlook.com [52.101.101.130])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4bywv0h2ws-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 30 Jan 2026 09:03:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qr2NV5rwp6/fT/rCdS3JyfvDULvp+uREOWmaNG+Du5dmrVYC1qTNCeWOq/B2jqn/1YWd+uh2VaivzbvuNowg/90f7iChGFBSwfDl9+eY+n8ni7XX/9Y0BbHazjYyMK0CAnHums6wxCjGmdDXKrmQInOrqH1bljH5dPrH8G9Baxg17KdjrMOhmGIsT5IXpFjWoPvCR1PX2agRE4ApORd/wwWGYGEj3ewoTp9KynoRjZt9dpyVnk+N+8DP+ZWn8fZBzLQsKulEgqOjJrH1cY5U5DvrBkwjcJSxvG9a/CJJpH6AvKNPmn8ZYM6BdD19WqBXWegG7gpERbpeaUQU0OACEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFs64QJdLTsdI2cQXPRPtn/iL6W6BD9rgCE2AdZdInA=;
 b=wrgxCG/4lOZc98Lz88J1DlHs+NvKAeNJ4lFr3JjlE7X/DdAtye0bUq7xoTsD7SXs0HzrJ/GH7sb/1qZUWy6MIgm/fEUyr5TvEt2Xg7WpLatLoraD29qTlV5dVJ/IwbT3PiJp5WMFXO7Yh2GTAwd1ZmYKakdl25vSD1QZj3kqt7MJQ2h/bPjwkPB/ULss8b+znKREtc+AwEFEZg4sBd6Fgt2f5GKLPnzbVewD5201uJLil5gTYwkvGJ+u4iKF0JjK5uMdHHICGx81pyJ056KUaFZpJDojYldPCCuGiRMW5wjJ7l9JHUYPYHAD9wXIyeoUN8K98P2mSvWSLiCvqkVdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFs64QJdLTsdI2cQXPRPtn/iL6W6BD9rgCE2AdZdInA=;
 b=j8U4QPHtcOCnNV5aFNutYWJCIfXp4qWwnzkyyNKd7aJngItSWUfT+HiM+GBQJgvvgs1aP29Q/DmgZmJ0cr5sj+kXSVq2BiXYmVqNgti0i3pAUfStKcnOmDrP0mqetLWSXLhPxj3RsYpSGD4e93Ztrzu8U2jyUzsSSR6BNzDyyIY=
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:449::15)
 by LO9P302MB1750.GBRP302.PROD.OUTLOOK.COM (2603:10a6:600:3fb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 09:03:35 +0000
Received: from LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e]) by LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
 ([fe80::3585:13b4:3133:1e3e%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 09:03:35 +0000
From: Alessio Belle <Alessio.Belle@imgtec.com>
To: Matt Coster <Matt.Coster@imgtec.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "geert@linux-m68k.org"
 <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Frank Binns <Frank.Binns@imgtec.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Brajesh Gupta <Brajesh.Gupta@imgtec.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Topic: [PATCH] drm/imagination: Use dev_pm_domain_attach_list()
Thread-Index: AQHcjHbfex5S6jFqf06eNWs4OQN+r7VqdbCA
Date: Fri, 30 Jan 2026 09:03:34 +0000
Message-ID: <848896564152798716484225d49df14255cde64e.camel@imgtec.com>
References: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
In-Reply-To: <20260123-pm-domain-attach-list-v1-1-d51dd7e43253@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO7P302MB2107:EE_|LO9P302MB1750:EE_
x-ms-office365-filtering-correlation-id: 091adaa9-e3ac-4025-b23b-08de5fde72ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cnp5WjdrM1Y3cFE5VWh3bVNLT2F6bjNVWWRXSDZuU2RmN2t2d0t6OEppL1d2?=
 =?utf-8?B?SmhWczNWaGswakorcCsvcTllQmkwY3MrbnBsQnQrNUlXYzJ1SnIvNDhoZ0Rm?=
 =?utf-8?B?d2JXcHViMTQ3YWtUUHNMMk5NcitsSGJCWlRwRGQzR0Rub1lNZm5hOHZpek5h?=
 =?utf-8?B?RWRFU0RPLzJ2b0k3V2dyKzhTckFzOTFZSUFtZjBhZjRnazYzQVJVNjIyckpN?=
 =?utf-8?B?ZTU3R21La0R1T1h1THVZTlVnVGM4aWxOMWJkL1hpenJUNk1LYlBhN3d6cnIv?=
 =?utf-8?B?eHB6NnpNSnQ4ZU1EY2YweHZNYkIyaG5xY2lVVUUyVCs2ZFdoakdsZmJqNW0w?=
 =?utf-8?B?YUlyZDRkcFlwTDJjZ3lOMm5IRXZTUFZwY3krWEd0TnhNRkdBaEVIVjEzcWFP?=
 =?utf-8?B?MVhQOEk5K1pqYXhBc2NSYzlOc0s3QlFaR00yVWtTc1dFYmJQTjNCSS9RR1k0?=
 =?utf-8?B?OE54OUgyS21STUdadjhSdEpmOEdybEJjQTZjVHVXOWEzLys1VnY0Wk1lejAz?=
 =?utf-8?B?Nk0wQlJEZjN3SmpGMlZFb1pJWWlmc0drbFRBbzBtZDhIc2NHakRjR2UzVmFP?=
 =?utf-8?B?TlpFWDhudWFrVFl1QWxHdnM3QlFPN0ZvL1duSVByZ1FwaU5Kc056emVZYnp4?=
 =?utf-8?B?WGlCZzRGU2lxbHJkQlRFZDFaSytjVU9tK2wrdGRKRUk5eE15NUwxSkdkN3h0?=
 =?utf-8?B?U2VzSXZ6QkhlNlYxaFQ2VW5yYXc2RGJVS0w1aWNDT3czamwvODNTU2h1a1A3?=
 =?utf-8?B?czVTV0tQbzF2cVlkTjlZQ0Jlc1l4MG1IQmR0disrWVpMdHFCTXZaMEQ3bDVk?=
 =?utf-8?B?Qk9zMXQ5aW5xSExrM2xZcG4wRVNvbjVZVytGMkRLZHlWV3hqZjJheEZMbHJo?=
 =?utf-8?B?S3BzMzdxTmFmM054MEtvemRkYXcyS0hpYWhkNzBxYUJXL0xZUHo3SzdyaGM1?=
 =?utf-8?B?dHhZYkQ5dWg4azFYaTZoSWdNQkdUMDVwcnIySi9oQWVVNFUzTllQbXAwb0JO?=
 =?utf-8?B?U3pEcUxLRzM1Mlc3OThpbXc2WVdJbjQ5Z3VySDZsaFFIZFBDb0FMTjBOUCtF?=
 =?utf-8?B?cEZFcDYzWDRjQ2NzWkFobWNoaHZTZnQ5MjhoeW5uRHVCbDlFQ29WWXZObXV5?=
 =?utf-8?B?OHVEb3VOKzFOL1lOMjBrOEZVK256eW5PWU1hU05zRVBnVk5hd1FwbHFrQ09w?=
 =?utf-8?B?WmVtMU15WEtwTFV0b0hKNFdKZTcwSzJsM1k5NFpEaDB2SG5zTi9IS0tmZzB5?=
 =?utf-8?B?U011V1NRZzY5WmZsVVBhcjZCbnE2MkV6aG1lTHBocHJ6em1nYitad0huUk9E?=
 =?utf-8?B?a084bEtxY2lOMHFVaUJ6UGhMZzlZUGk3QWlzYVZvZ0JCQkE5OTVSU0oxb0Js?=
 =?utf-8?B?bTV3SkZrbE1lcXhLSGtJeUFMRzBUZFBoSHhkbHZSbE1yWHB6eHRMWkhrcGNF?=
 =?utf-8?B?UzRKalZSVWRTUUYwL2YrMjVPVEFNNC9tRkRHTzdNSmxrMERMUTRtMHRUMjUy?=
 =?utf-8?B?NEMrTlZENU51OUFNLzRUNmFUdTN0SGRkMTRISG1NN1pJa0RiZHY2dVk5L25a?=
 =?utf-8?B?NlBjVStLa0ZDZzdMZGZrYmcyZjFtWGNLN1VxNTNOOWF5dzE2WHRxb1ZoVHNy?=
 =?utf-8?B?Smd0UlVSbm4wK1NKS1E0YTZHcU9GdzJYL3dac2xTaWR3bmhiQmFkOVkxMzBD?=
 =?utf-8?B?SHk1T2FWV3ZPRVY2MVp2YzVRQzE2QmN3RHJJVTk1RG1aT1RUVzI4ZlNIZnkr?=
 =?utf-8?B?bnpNbW4vVlFoajk1NGpnV2VocVJmNFZUQzh5cmRoZ1B6eXQrbmZ4YTVPTGYr?=
 =?utf-8?B?bEJaNFZqSUNwcXhOWE9CV2VuWWlYVFd5L1NROTFiSWw3MWNjQmhYR1FlYkRq?=
 =?utf-8?B?MXlTKytINGwzczdSWTNDUE9aQTZxY29sNFBlUllwMEdBUVg0ek0rRW84bTlo?=
 =?utf-8?B?eGdBb1d2YVlob0oxMmRBemlaTmhGbkpybGN2Qk93Y0pCZDZzbWhueEtzZHM2?=
 =?utf-8?B?TjJKeDF6YkZDZUVONmNXSjlMS1VkbjByNmhpUFpwY1VOQ2p5YWtZLzhHbmMx?=
 =?utf-8?B?MWIydnNmOTJWYkxZcm1OS1BMR0hjZXpiSThwbXdLTk0ySENSSjl5UTRUdmh3?=
 =?utf-8?Q?1vCDGj0eUbQGXsrpJYsMQl1DY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QkZXZXd6c0ZmS1I0bnBpc1lFTmFFYk13V296M3RQenV3L3FHU2x2WC9pdG9F?=
 =?utf-8?B?NWY5WFFydlhNUzRMTzFWYXZyYlZRMzd6R0tWZ0xJK1ZYaEtBbWM1UVlyMHBN?=
 =?utf-8?B?dkE5eFAvQzFWT2JmRXBMMmltK3ZSNy9Tekp1WXB6Mk15RzdpM2xSWE5Cb1hD?=
 =?utf-8?B?SE41dTJmWW1aN3RsUkh6SDExR2xldlNtaGtTNVlxYk94bTE1K0QxdEk5citz?=
 =?utf-8?B?b0Q1elNjRG1XS05zaEpqbVNLZ1F6NFkyQ1Z5QVRZaEdxTHN2RUk4U1J3TmFG?=
 =?utf-8?B?ZWlxYUwySTR3NlluaTdxR0I0TGo1OXJTWUkzcExTMnY5SzNVYmJkUW5YNC9x?=
 =?utf-8?B?SVUyRXNDM0w2UWRKZXE4cm00T2FIOXBYMVBMcUJNNTdTMEt4NGxIMVBVUWFz?=
 =?utf-8?B?TzY3MzQ3d0ZGV3puSnFrWjlkb0h6VDdOZHZKTzRtT0RmN0d1d2d4RnJHNURF?=
 =?utf-8?B?UWppQTdoQ2NLYndCTFVoejNsTGJzbnhDT2Z1ZG9YZi9xK3hINnR2UjlDdmI0?=
 =?utf-8?B?WG9yNE5kVHlXRklseFk4TjZ1bXBLV2Z2UEdta2hDZTJaZ3pOeVpsZjRsMmF1?=
 =?utf-8?B?Mjk3SGp3aVVxcFBkN2tMRmZUeXQxbXRSYjl2VTgrT3JvVTR6aGpSSjRZR1JZ?=
 =?utf-8?B?N2JCRTkyT2dGNW15RkNUcFpONEZUa2tKejB6Q2k5ODJWK1dHVDhVdUoxZ01I?=
 =?utf-8?B?STJXWktsTGp4cWVjcFl3azdIWUNjRHZWcTNQNC8zT0N6WkgzRHVEL2ZzUGVw?=
 =?utf-8?B?U1YwSlJlNkZLMm1pTEdmRFZlQ2phRmY4dHZKR1dMckxBejdrcWp1Zi9yVEpt?=
 =?utf-8?B?QWJyOUY3ZTc2NHJUelczU3FjK3hYS3hEYWliL1dWTnN4VFE2U0RoSGpTNS85?=
 =?utf-8?B?WDkwb28xWkpQOURjMDR0SjNsLzRTZGc0OU0vQXhtZDRwNTRMNFJRQ1NxcW0r?=
 =?utf-8?B?amN5RHgwQllXaCt6d3dZTThRbGRkSDdmOENjQVlnNSt1N2JaOGpvSCtvTHox?=
 =?utf-8?B?WEpUZTBXTWVvU2VwU09HYWZGa2hjVkJXMDdwaGJyM01lS3VxY09lTzVVOFpX?=
 =?utf-8?B?Tm5jUllCTFVKUVYyNkVKaHI5RVFpZWxlK2k0SytMd20wN1l1MW5OQU9sRDIw?=
 =?utf-8?B?dStDVlpFNFIzYWM4QVhidStvanBrZk81Smw3NFdQL3NDdzZjR2t3ekxvSWcr?=
 =?utf-8?B?NHYrcUI2MjZCdzY5cDg3MzlSb0EyVEFQTGVDUUlhY2Uxa29PVDZoTUlaSFpF?=
 =?utf-8?B?aFJxc1RzYkpDRUx6SlJFa1NHOS9tZlJWa3B2aTc2OVBxbDJHc01wQnVUSU1D?=
 =?utf-8?B?cnQxeW5ON25FUXI5YjYrOFZPaWR6MlIxaU0xWFUwT09VMjYxSGZ4ajhWeGlD?=
 =?utf-8?B?QWJGcjJDVWswL2h0aXpwc2VHbkFBeUY0ancyV0hZaFIybCtxK254cjNtZTVN?=
 =?utf-8?B?RTlxZkg3ZDJmWHVsUE1rQnVKRlRhdFlQT0dwcm9CR3ZVMWtSSFo0K01xalFm?=
 =?utf-8?B?cVVPQVVMcEROWGJhMVdFSXBnZktEeWpJNzREMzU2dkJ3Q2hrWmtmVjlaUFZ2?=
 =?utf-8?B?a1o0WU91YWxRcFFOTXRmTDFMVlRjTVkyalVhK0VLMFljS1JaakRXaElWeTNT?=
 =?utf-8?B?ZTR0R21lOXExM254WGdNYkxpM0dmd1JvRmtlbC9vb2xsdWV6bXZZcTN1cDBS?=
 =?utf-8?B?M0xONTVKOG5kYW0xdVY4Zk1aeEJPbFFOZ3dDZkJ1NDRuK05lK21ISnJLcVlF?=
 =?utf-8?B?YkFHckUvZlFKeDg0ZFpNbnNkUTBtVWN2bnBZM2YwRVZkUXdlUXAvR2lUamw2?=
 =?utf-8?B?ZW1QbFUwYzdjc0gzbjRJQ0oxRytBNVdSMERGYVJkVUZQNEcxTXluTGFFN211?=
 =?utf-8?B?eDlZYTVHN1FIZzM1RDFrMGp0dW9PYjh3OW85bDFaTzVlbm5pKzFJMnBSdlhE?=
 =?utf-8?B?WXE1emJJM3ZvTThKNGZGZ1dxYjRPbXJCaGoyQ3hmWFk0UDJKd1V1bjdjT2U5?=
 =?utf-8?B?dWR4djdieGk2UVBZemFmMDlveUU5S2Z4K2hMZ2JZcWtxbnV5OXB4MEg1K0NE?=
 =?utf-8?B?dE02ZDZ0YkJLQVRFT2s0aVgrOGgzSDNLUWtKdlFpdWpVRm1IWmRZNmVkOEVZ?=
 =?utf-8?B?MTNJb2YxM3BnUHRycms1VU1Fd2s2aUJUNGZNL3dPVGJSOW04czVzR2lUOUU0?=
 =?utf-8?B?UFZ2VWVSVmJaS2RZdlZENTBNVGhhaTdXTTQ2ZFdyT2FnMUZiVHZBRG9wMFpw?=
 =?utf-8?B?R3MwSHpyR3dsYWFTeFdCSGtrNnk2T1o2RXpYNlhZYnpUMVZDOXhyLzZnUy9C?=
 =?utf-8?B?RGo3SnQxMVNCOXpqWGFIMGdmSkdCb0YzRWNieXNiOTJ1SGFURFFkLzlPWHVl?=
 =?utf-8?Q?hcZnUBhfWhXRR/9A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <854D87F69E322D449AFD6D36D5841F89@GBRP302.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO7P302MB2107.GBRP302.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 091adaa9-e3ac-4025-b23b-08de5fde72ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2026 09:03:34.9706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Axb5a7O+GWSHLW/1Memjigt8USCFM9TAPZUurUF/JezVLwqzDqd6O6GXG2J43thY4ykKEryosNRrMzcoOHenE0YZl4oBnyG7H62om2cgih8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P302MB1750
X-Proofpoint-GUID: FIJuQjC14Z-f8F-C0nWhNti6sBPqs0_L
X-Proofpoint-ORIG-GUID: FIJuQjC14Z-f8F-C0nWhNti6sBPqs0_L
X-Authority-Analysis: v=2.4 cv=eNQeTXp1 c=1 sm=1 tr=0 ts=697c73ea cx=c_pps
 a=SQcvmgF92I7+BpmpxxIovA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=ZUYnMWc1lQzIZHWXgZsA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA3MSBTYWx0ZWRfX/exi4xNRtQ1c
 cjuks9ew+FrRaJHVubeTOFXDTt89yOui01sAeV5eyFtkK2ngnhOSOyn0DzA6p+p0XSul3DTvZp4
 yrcNFxqhZZyK2Jyxsk/U+2KnDWNso+MipcPxjc4ZJPuRiN2MW7l2yPPMO7cdTTTL2tjgqc2aGeT
 5B9f8ZSxQ55tOcmrZbRLaW8xCTyg5nY2YGgkoqbL9fjzua2fH3t/L0HcMsNB7FA2DeoZsuKJqIp
 IM4a0ZrpxuGLqvgdppp+pXEIcndle/JOcUcXobufCzbx6eduaK4QfdA35PKv320TL97/rXFSEgE
 qqapKsMb9QlTNAQ61PShfHVLwj3DPkBcM7AIs6exiXk7xGNNzYpKyYOq+J0sraMHIzTUgsDow58
 M+imUZq0LqQt/0w9/kIlcRkhiZL3OrlrgM5LcWchyeYKlYp+FQmnbQktVxxNbp9AuAB/8kxws7L
 Y515PaLIlH/bGbV7k5Q==
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[suse.de,ffwll.ch,lists.freedesktop.org,linux-m68k.org,vger.kernel.org,imgtec.com,linux.intel.com,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Alessio.Belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Matt.Coster@imgtec.com,m:tzimmermann@suse.de,m:simona@ffwll.ch,m:geert@linux-m68k.org,m:linux-kernel@vger.kernel.org,m:Frank.Binns@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:Brajesh.Gupta@imgtec.com,m:mripard@kernel.org,m:airlied@gmail.com,m:Alexandru.Dadu@imgtec.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Alessio.Belle@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imgtec.com:email,imgtec.com:dkim,imgtec.com:mid]
X-Rspamd-Queue-Id: A396FB8BFC
X-Rspamd-Action: no action

T24gRnJpLCAyMDI2LTAxLTIzIGF0IDE0OjQ0ICswMDAwLCBNYXR0IENvc3RlciB3cm90ZToNCj4g
VGhpcyBoZWxwZXIgaGFuZGxlcyB0aGUgYXR0YWNoaW5nIGFuZCBsaW5raW5nIG9mIHRoZSBlbnRp
cmUgbGlzdCBvZiBwb3dlcg0KPiBkb21haW5zLiBCZXNpZGVzIG1ha2luZyBwdnJfcG93ZXJfZG9t
YWluc19pbml0KCkgc2ltcGxlciwgdGhpcyBhbHNvIGxheXMNCj4gdGhlIGdyb3VuZHdvcmsgdG8g
c2ltcGxpZnkgc3VwcG9ydGluZyB0aGUgdmFyaWVkIHBvd2VyIGRvbWFpbiBuYW1lcyB1c2VkIGlu
DQo+IFZvbGNhbmljIEdQVSBjb3Jlcy4NCj4gDQo+IE5vdGUgdGhhdCB3ZSBzdGlsbCBuZWVkIHRv
IGNyZWF0ZSB0aGUgbGlua3MgYmV0d2VlbiBwb3dlciBkb21haW5zIHRvIGVuc3VyZQ0KPiB0aGV5
J3JlIGJyb3VnaHQgdXAgaW4gYSB2YWxpZCBzZXF1ZW5jZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxl
c3NpbyBCZWxsZSA8YWxlc3Npby5iZWxsZUBpbWd0ZWMuY29tPg0KDQpUaGFua3MsDQpBbGVzc2lv
DQoNCj4gLS0tDQo+IFdlJ3ZlIGhhZCB0aGlzIHBhdGNoIGtpY2tpbmcgYXJvdW5kIGludGVybmFs
bHkgZm9yIGEgd2hpbGU7IGl0J3MgYmVlbg0KPiBoZWxkIHVwIGJ5IGRpc2N1c3Npb25zIGFzIHRv
IHdoZXRoZXIgd2UgYWN0dWFsbHkgbmVlZCB0aGUgZGVwZW5kZW5jaWVzDQo+IGJldHdlZW4gZG9t
YWlucyBmb3IgdGhlIGhhcmR3YXJlIHRvIGJlaGF2ZSBjdXJyZWN0bHkuIEFzIGl0IHR1cm5zIG91
dCwNCj4gdGhlIGFuc3dlciBpcyB5ZXMuDQo+IA0KPiBHZWVydCBzZW50IGEgc2ltaWxhciBwYXRj
aFsxXSB5ZXN0ZXJkYXkgd2hpY2ggZGlkbid0IHJldGFpbiB0aGUNCj4gaW50ZXItZG9tYWluIGxp
bmtzIGFuZCBzdWdnZXN0ZWQgd2UganVzdCBzZW5kIHRoaXMgb25lIGluc3RlYWQgb2YNCj4gcmV3
b3JraW5nIGhpcy4gVGhhbmsgeW91IGZvciB0aGUga2ljayB1cCB0aGUgYmFja3NpZGUgdG8gcHJv
Z3Jlc3MgdGhpcw0KPiBvbmUhIDopDQo+IA0KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMTk0NDY1ZWRhNTRkMWY4NTJhOTIyNmNmNjkxZGRjNWFhMjA4ZTBhMy4xNzY5MDk3OTc3Lmdp
dC5nZWVydCtyZW5lc2FzQGdsaWRlci5iZS8NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1h
Z2luYXRpb24vcHZyX2RldmljZS5oIHwgMTAgKystLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9wb3dlci5jICB8IDgwICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
DQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDU3IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNl
LmggYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2RldmljZS5oDQo+IGluZGV4IGNm
ZGEyMTVlNzQyOGUuLmQ1MWM1N2NmOTMzMjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfZGV2aWNlLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2ltYWdp
bmF0aW9uL3B2cl9kZXZpY2UuaA0KPiBAQCAtMTUyLDE1ICsxNTIsMTMgQEAgc3RydWN0IHB2cl9k
ZXZpY2Ugew0KPiAgCSAqIEBwb3dlcjogT3B0aW9uYWwgcG93ZXIgZG9tYWluIGRldmljZXMuDQo+
ICAJICoNCj4gIAkgKiBPbiBwbGF0Zm9ybXMgd2l0aCBtb3JlIHRoYW4gb25lIHBvd2VyIGRvbWFp
biBmb3IgdGhlIEdQVSwgdGhleSBhcmUNCj4gLQkgKiBzdG9yZWQgaGVyZSBpbiBAZG9tYWluX2Rl
dnMsIGFsb25nIHdpdGggbGlua3MgYmV0d2VlbiB0aGVtIGluDQo+IC0JICogQGRvbWFpbl9saW5r
cy4gVGhlIHNpemUgb2YgQGRvbWFpbl9kZXZzIGlzIGdpdmVuIGJ5IEBkb21haW5fY291bnQsDQo+
IC0JICogd2hpbGUgdGhlIHNpemUgb2YgQGRvbWFpbl9saW5rcyBpcyAoMiAqIEBkb21haW5fY291
bnQpIC0gMS4NCj4gKwkgKiBzdG9yZWQgaGVyZSBpbiBAZG9tYWlucywgYWxvbmcgd2l0aCBsaW5r
cyBiZXR3ZWVuIHRoZW0gaW4NCj4gKwkgKiBAZG9tYWluX2xpbmtzLiBUaGUgc2l6ZSBvZiBAZG9t
YWluX2xpbmtzIGlzIG9uZSBsZXNzIHRoYW4NCj4gKwkgKiBzdHJ1Y3QgZGV2X3BtX2RvbWFpbl9s
aXN0LT5udW1fcGRzIGluIEBkb21haW5zLg0KPiAgCSAqLw0KPiAgCXN0cnVjdCBwdnJfZGV2aWNl
X3Bvd2VyIHsNCj4gLQkJc3RydWN0IGRldmljZSAqKmRvbWFpbl9kZXZzOw0KPiArCQlzdHJ1Y3Qg
ZGV2X3BtX2RvbWFpbl9saXN0ICpkb21haW5zOw0KPiAgCQlzdHJ1Y3QgZGV2aWNlX2xpbmsgKipk
b21haW5fbGlua3M7DQo+IC0NCj4gLQkJdTMyIGRvbWFpbl9jb3VudDsNCj4gIAl9IHBvd2VyOw0K
PiAgDQo+ICAJLyoqDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24v
cHZyX3Bvd2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3Bvd2VyLmMNCj4g
aW5kZXggYjlmODAxYzYzMjYwYy4uYTA4MzRjNTUwYTg1MiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9wb3dlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9pbWFnaW5hdGlvbi9wdnJfcG93ZXIuYw0KPiBAQCAtNTkzLDE0ICs1OTMsMTYgQEAgcHZyX3dh
dGNoZG9nX2Zpbmkoc3RydWN0IHB2cl9kZXZpY2UgKnB2cl9kZXYpDQo+ICANCj4gIGludCBwdnJf
cG93ZXJfZG9tYWluc19pbml0KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQ0KPiAgew0KPiAt
CXN0cnVjdCBkZXZpY2UgKmRldiA9IGZyb21fcHZyX2RldmljZShwdnJfZGV2KS0+ZGV2Ow0KPiAr
CXN0YXRpYyBjb25zdCBjaGFyICpjb25zdCBST0dVRV9QRF9OQU1FU1tdID0geyAiYSIsICJiIiwg
ImMiLCAiZCIsICJlIiB9Ow0KPiArDQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBm
cm9tX3B2cl9kZXZpY2UocHZyX2Rldik7DQo+ICsJc3RydWN0IGRldmljZSAqZGV2ID0gZHJtX2Rl
di0+ZGV2Ow0KPiAgDQo+ICAJc3RydWN0IGRldmljZV9saW5rICoqZG9tYWluX2xpbmtzIF9fZnJl
ZShrZnJlZSkgPSBOVUxMOw0KPiAtCXN0cnVjdCBkZXZpY2UgKipkb21haW5fZGV2cyBfX2ZyZWUo
a2ZyZWUpID0gTlVMTDsNCj4gKwlzdHJ1Y3QgZGV2X3BtX2RvbWFpbl9saXN0ICpkb21haW5zID0g
TlVMTDsNCj4gIAlpbnQgZG9tYWluX2NvdW50Ow0KPiAgCWludCBsaW5rX2NvdW50Ow0KPiAgDQo+
IC0JY2hhciBkZXZfbmFtZVsyXSA9ICJhIjsNCj4gIAlpbnQgZXJyOw0KPiAgCWludCBpOw0KPiAg
DQo+IEBAIC02MTIsNDYgKzYxNCwzMyBAQCBpbnQgcHZyX3Bvd2VyX2RvbWFpbnNfaW5pdChzdHJ1
Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAlpZiAoZG9tYWluX2NvdW50IDw9IDEpDQo+ICAJ
CXJldHVybiAwOw0KPiAgDQo+IC0JbGlua19jb3VudCA9IGRvbWFpbl9jb3VudCArIChkb21haW5f
Y291bnQgLSAxKTsNCj4gKwlpZiAoZG9tYWluX2NvdW50ID4gQVJSQVlfU0laRShST0dVRV9QRF9O
QU1FUykpIHsNCj4gKwkJZHJtX2Vycihkcm1fZGV2LCAiJXMoKSBvbmx5IHN1cHBvcnRzICV6dSBk
b21haW5zIG9uIFJvZ3VlIiwNCj4gKwkJCV9fZnVuY19fLCBBUlJBWV9TSVpFKFJPR1VFX1BEX05B
TUVTKSk7DQo+ICsJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gKwl9DQo+ICANCj4gLQlkb21haW5f
ZGV2cyA9IGtjYWxsb2MoZG9tYWluX2NvdW50LCBzaXplb2YoKmRvbWFpbl9kZXZzKSwgR0ZQX0tF
Uk5FTCk7DQo+IC0JaWYgKCFkb21haW5fZGV2cykNCj4gLQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJ
bGlua19jb3VudCA9IGRvbWFpbl9jb3VudCAtIDE7DQo+ICANCj4gIAlkb21haW5fbGlua3MgPSBr
Y2FsbG9jKGxpbmtfY291bnQsIHNpemVvZigqZG9tYWluX2xpbmtzKSwgR0ZQX0tFUk5FTCk7DQo+
ICAJaWYgKCFkb21haW5fbGlua3MpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+IC0JZm9y
IChpID0gMDsgaSA8IGRvbWFpbl9jb3VudDsgaSsrKSB7DQo+IC0JCXN0cnVjdCBkZXZpY2UgKmRv
bWFpbl9kZXY7DQo+IC0NCj4gLQkJZGV2X25hbWVbMF0gPSAnYScgKyBpOw0KPiAtCQlkb21haW5f
ZGV2ID0gZGV2X3BtX2RvbWFpbl9hdHRhY2hfYnlfbmFtZShkZXYsIGRldl9uYW1lKTsNCj4gLQkJ
aWYgKElTX0VSUl9PUl9OVUxMKGRvbWFpbl9kZXYpKSB7DQo+IC0JCQllcnIgPSBkb21haW5fZGV2
ID8gUFRSX0VSUihkb21haW5fZGV2KSA6IC1FTk9ERVY7DQo+IC0JCQlnb3RvIGVycl9kZXRhY2g7
DQo+IC0JCX0NCj4gLQ0KPiAtCQlkb21haW5fZGV2c1tpXSA9IGRvbWFpbl9kZXY7DQo+IC0JfQ0K
PiAtDQo+IC0JZm9yIChpID0gMDsgaSA8IGRvbWFpbl9jb3VudDsgaSsrKSB7DQo+IC0JCXN0cnVj
dCBkZXZpY2VfbGluayAqbGluazsNCj4gLQ0KPiAtCQlsaW5rID0gZGV2aWNlX2xpbmtfYWRkKGRl
diwgZG9tYWluX2RldnNbaV0sIERMX0ZMQUdfU1RBVEVMRVNTIHwgRExfRkxBR19QTV9SVU5USU1F
KTsNCj4gLQkJaWYgKCFsaW5rKSB7DQo+IC0JCQllcnIgPSAtRU5PREVWOw0KPiAtCQkJZ290byBl
cnJfdW5saW5rOw0KPiAtCQl9DQo+ICsJY29uc3Qgc3RydWN0IGRldl9wbV9kb21haW5fYXR0YWNo
X2RhdGEgcGRfYXR0YWNoX2RhdGEgPSB7DQo+ICsJCS5wZF9uYW1lcyA9IFJPR1VFX1BEX05BTUVT
LA0KPiArCQkubnVtX3BkX25hbWVzID0gZG9tYWluX2NvdW50LA0KPiArCQkucGRfZmxhZ3MgPSAw
LA0KPiArCX07DQo+ICANCj4gLQkJZG9tYWluX2xpbmtzW2ldID0gbGluazsNCj4gLQl9DQo+ICsJ
ZXJyID0gZGV2X3BtX2RvbWFpbl9hdHRhY2hfbGlzdChkZXYsICZwZF9hdHRhY2hfZGF0YSwgJmRv
bWFpbnMpOw0KPiArCWlmIChlcnIgPCAwKQ0KPiArCQlyZXR1cm4gZXJyOw0KPiAgDQo+IC0JZm9y
IChpID0gZG9tYWluX2NvdW50OyBpIDwgbGlua19jb3VudDsgaSsrKSB7DQo+ICsJZm9yIChpID0g
MDsgaSA8IGxpbmtfY291bnQ7IGkrKykgew0KPiAgCQlzdHJ1Y3QgZGV2aWNlX2xpbmsgKmxpbms7
DQo+ICANCj4gLQkJbGluayA9IGRldmljZV9saW5rX2FkZChkb21haW5fZGV2c1tpIC0gZG9tYWlu
X2NvdW50ICsgMV0sDQo+IC0JCQkJICAgICAgIGRvbWFpbl9kZXZzW2kgLSBkb21haW5fY291bnRd
LA0KPiArCQlsaW5rID0gZGV2aWNlX2xpbmtfYWRkKGRvbWFpbnMtPnBkX2RldnNbaSArIDFdLA0K
PiArCQkJCSAgICAgICBkb21haW5zLT5wZF9kZXZzW2ldLA0KPiAgCQkJCSAgICAgICBETF9GTEFH
X1NUQVRFTEVTUyB8IERMX0ZMQUdfUE1fUlVOVElNRSk7DQo+ICAJCWlmICghbGluaykgew0KPiAg
CQkJZXJyID0gLUVOT0RFVjsNCj4gQEAgLTY2Miw5ICs2NTEsOCBAQCBpbnQgcHZyX3Bvd2VyX2Rv
bWFpbnNfaW5pdChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAl9DQo+ICANCj4gIAlw
dnJfZGV2LT5wb3dlciA9IChzdHJ1Y3QgcHZyX2RldmljZV9wb3dlcil7DQo+IC0JCS5kb21haW5f
ZGV2cyA9IG5vX2ZyZWVfcHRyKGRvbWFpbl9kZXZzKSwNCj4gKwkJLmRvbWFpbnMgPSBkb21haW5z
LA0KPiAgCQkuZG9tYWluX2xpbmtzID0gbm9fZnJlZV9wdHIoZG9tYWluX2xpbmtzKSwNCj4gLQkJ
LmRvbWFpbl9jb3VudCA9IGRvbWFpbl9jb3VudCwNCj4gIAl9Ow0KPiAgDQo+ICAJcmV0dXJuIDA7
DQo+IEBAIC02NzMsMzEgKzY2MSwyMSBAQCBpbnQgcHZyX3Bvd2VyX2RvbWFpbnNfaW5pdChzdHJ1
Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIAl3aGlsZSAoLS1pID49IDApDQo+ICAJCWRldmlj
ZV9saW5rX2RlbChkb21haW5fbGlua3NbaV0pOw0KPiAgDQo+IC0JaSA9IGRvbWFpbl9jb3VudDsN
Cj4gLQ0KPiAtZXJyX2RldGFjaDoNCj4gLQl3aGlsZSAoLS1pID49IDApDQo+IC0JCWRldl9wbV9k
b21haW5fZGV0YWNoKGRvbWFpbl9kZXZzW2ldLCB0cnVlKTsNCj4gLQ0KPiAgCXJldHVybiBlcnI7
DQo+ICB9DQo+ICANCj4gIHZvaWQgcHZyX3Bvd2VyX2RvbWFpbnNfZmluaShzdHJ1Y3QgcHZyX2Rl
dmljZSAqcHZyX2RldikNCj4gIHsNCj4gLQljb25zdCBpbnQgZG9tYWluX2NvdW50ID0gcHZyX2Rl
di0+cG93ZXIuZG9tYWluX2NvdW50Ow0KPiArCXN0cnVjdCBwdnJfZGV2aWNlX3Bvd2VyICpwdnJf
cG93ZXIgPSAmcHZyX2Rldi0+cG93ZXI7DQo+ICANCj4gLQlpbnQgaSA9IGRvbWFpbl9jb3VudCAr
IChkb21haW5fY291bnQgLSAxKTsNCj4gKwlpbnQgaSA9IChpbnQpcHZyX3Bvd2VyLT5kb21haW5z
LT5udW1fcGRzIC0gMTsNCj4gIA0KPiAgCXdoaWxlICgtLWkgPj0gMCkNCj4gLQkJZGV2aWNlX2xp
bmtfZGVsKHB2cl9kZXYtPnBvd2VyLmRvbWFpbl9saW5rc1tpXSk7DQo+IC0NCj4gLQlpID0gZG9t
YWluX2NvdW50Ow0KPiArCQlkZXZpY2VfbGlua19kZWwocHZyX3Bvd2VyLT5kb21haW5fbGlua3Nb
aV0pOw0KPiAgDQo+IC0Jd2hpbGUgKC0taSA+PSAwKQ0KPiAtCQlkZXZfcG1fZG9tYWluX2RldGFj
aChwdnJfZGV2LT5wb3dlci5kb21haW5fZGV2c1tpXSwgdHJ1ZSk7DQo+ICsJZGV2X3BtX2RvbWFp
bl9kZXRhY2hfbGlzdChwdnJfcG93ZXItPmRvbWFpbnMpOw0KPiAgDQo+IC0Ja2ZyZWUocHZyX2Rl
di0+cG93ZXIuZG9tYWluX2xpbmtzKTsNCj4gLQlrZnJlZShwdnJfZGV2LT5wb3dlci5kb21haW5f
ZGV2cyk7DQo+ICsJa2ZyZWUocHZyX3Bvd2VyLT5kb21haW5fbGlua3MpOw0KPiAgDQo+IC0JcHZy
X2Rldi0+cG93ZXIgPSAoc3RydWN0IHB2cl9kZXZpY2VfcG93ZXIpeyAwIH07DQo+ICsJKnB2cl9w
b3dlciA9IChzdHJ1Y3QgcHZyX2RldmljZV9wb3dlcil7IDAgfTsNCj4gIH0NCj4gDQo+IC0tLQ0K
PiBiYXNlLWNvbW1pdDogMTViZDJmNWQ1MmRlODkwZjc0NWFjMGM2MGE0NGNkMjdkMDk1YmIwZA0K
PiBjaGFuZ2UtaWQ6IDIwMjUxMjAxLXBtLWRvbWFpbi1hdHRhY2gtbGlzdC1lZjRlYzEyYTkyNzEN
Cj4gDQoNCg==
