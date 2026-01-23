Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8K+vCmNNc2lDugAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 11:28:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5807450E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 11:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C64C510EA9E;
	Fri, 23 Jan 2026 10:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ey9l+nky";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="nCVrXGnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A80010EA9E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 10:28:46 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60N5pFMw267751; Fri, 23 Jan 2026 10:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=ObMBi0mBOiM7vf3iP6nw6CF8W
 r8V8FoJM5FO5YJMH4k=; b=ey9l+nkyo5W7YNmoQHJFKGfinNN9alg8of6wOmrco
 PZXb3th0dvQml/LFN8F2EVeomoybIC6sFhVruBtaPgTlY2uEJzIy9Apyq8iKwhd7
 eKhTKStG56LRFwbQ1E5IfozvhCJlsOMyLekuzGHk3isEqcAwDs/YnbWwC+HbO+TA
 67UL/N9OQPw2ZfcRkqdLE8S/GV9Dl33L5n1varPJ3B9BhRwvIgkAZFB3aXCqQHU0
 SZ+Qh9VaBC9z5gc7vZ8OvEnyLMaxPYTwAcYdHVweMuOioELzJbbYJLeXf3QLvqHJ
 TipDqNY574cqHHbb5nm9vs8AzduB+3k5xYM6I3+kzUv8w==
Received: from lo3p265cu004.outbound.protection.outlook.com
 (mail-uksouthazon11020083.outbound.protection.outlook.com [52.101.196.83])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4btn4gj114-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 23 Jan 2026 10:28:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/sa+thtgQb/mqMGq9E3uEMPM9HXhSy79OJZHqNaIVCT4Gfmntb8pgdiOP7RBzoWMQjPXZu/nv3kOrlHhBqXXvq3gWrAp3TavT8TdHLeAzDggOdE/DShbdIjlwNXz2nbhP8lH1lwFOR0p7/UwCJH9SEaIZKBAuZRNt9Vz7ZHo7qy23mDPgD4ShjgBp6CzxxhOQhOQswhbDMqe3Bv05Y3XwyDo/n6wzR8v0GleVBzVHl1ijUsfpub37wN8ldUmjRM37G1Q/mpf2U2KAlM4gEUmVkvECZ1UjkpKz9eOmxoMmkcGyfhbjTL0nA8S95tAYyp3uVIVKumQBRGSwehJbpM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObMBi0mBOiM7vf3iP6nw6CF8Wr8V8FoJM5FO5YJMH4k=;
 b=zHnvfWbIVZeq3Kpko/acIv+NMtPuFM+5tVRLUTRKNd8ueP3ITUIWHM7ESupQc39XW+c8aElsnmphKjDb7yAxWQFU8huwfJ40E2Aoc25nqWBB3XTx/6VSfbGp1Sm4Qoqf8NL/K72dIXtJo1jPYDp6VnbpogbpuHPxqVKpdrrqSor7DosQXRffTwQpOQn3EpC5AUoToiiK+A8TGvafVS71Fna2CVsBeO9rRMLjWcCTws2ERe5oDe9kqeumwdEv0orb1RqmqIQPV72nGTTiZdbeb+mRhj/ETF83+hXp9Mdluh/VrJuy2iouPAW/nAYtpGUI/juapI+nt1QHaIiAic45tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObMBi0mBOiM7vf3iP6nw6CF8Wr8V8FoJM5FO5YJMH4k=;
 b=nCVrXGnjifi7sRmaOWfs+QVAnB4vy0RD/3A5yHc2QPVyx3+3ybbqXelBVzlxSK669XB+Yuboe04cfbfxbBrOKGRKfG5wbMkU8jeRzriwTNyccqTnJTne5b22Gu07hOggjidE4oT6IhFj0Ade9Spp+l0u7oPfSXSTxbeSQseKfAk=
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1c9::10)
 by LO9P265MB8529.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 10:28:24 +0000
Received: from LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4]) by LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
 ([fe80::fc84:1ac:e5be:2ea4%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 10:28:24 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Marek Vasut <marek.vasut@mailbox.org>
CC: David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu
 <Alexandru.Dadu@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
Thread-Topic: [PATCH] drm/imagination: Fix build on 32bit systems
Thread-Index: AQHcjFMBeZFqcOmS4EGbbnEbdBdUVA==
Date: Fri, 23 Jan 2026 10:28:24 +0000
Message-ID: <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
In-Reply-To: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO4P265MB3823:EE_|LO9P265MB8529:EE_
x-ms-office365-filtering-correlation-id: 029d327f-8f79-4dcb-3e0e-08de5a6a23c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?NFJnaG9ZL0Y3RFU3N2k3cWwyLzNTN20wc1ZlVWhTU2lqcmh3RkkyWUtldlc0?=
 =?utf-8?B?V2NjN2JiNW5wcEtxdGRUZ1lGNDJXVGd1TEpQYkxXV1ZnOHZuSDhPZVA3aEZn?=
 =?utf-8?B?OWU2SzY3Z3BuY2g3SDNhOVppTUxZODBCS1FoSUlyY1IvaEtRSlVHa2p5ZGxz?=
 =?utf-8?B?cXdVZXVoVGRGeWU0QzR2SDRBckQxQ3BldDJSWG5WZWtoQ0lrVFNhQkV0RjI0?=
 =?utf-8?B?QkxPNitHU2pSTFV0QUNpK0Z4N2x4TTJOanlCSlVxTE5qRU91b1ZuTHJ5dDRr?=
 =?utf-8?B?Ymc4OXcyOGZyUzZZQlE2bEpONmM3aXY1OXpXWU50NWVhamFSRTU4WDZPeHVM?=
 =?utf-8?B?U2l2ejB6QVViQ0l4OXhZMkFNSktVVkdEOFFYenB4Yy9HUTY1bnBhYThEK1NQ?=
 =?utf-8?B?RUVOeVhwdG5xakwwK2I5b052aEptSlZucGd1S1ExYXduRDB6bjZkTHc5TXN0?=
 =?utf-8?B?cnAvQ0R2S25SZjFTZko2QVR4M3lTMEFUQmFnUkg3VVc3emZKQ1lZWE5LbXBL?=
 =?utf-8?B?OTB6SEVVaUxCMHFyYXhzVHpOYVRrRjcrc2kyWHl4SS9yUHR6QUNWQ3ZGUmpl?=
 =?utf-8?B?cURrdWpRNVdEbWpVUEM0eHVZZlhpU2EwaWdOMEYwUGN0OVNhSnR0ejJra21H?=
 =?utf-8?B?azg5TlpXVFAwbWIvd2NnSmhIOUtUS3hKY0VBb2xzV1JRVDRmRWNybnp3eENR?=
 =?utf-8?B?UkVsa3N2R1YwZG9IV1JVR0JCZXZ4Y0FpNmlqVWd0WmtVRmc4L2ZmR28vSG95?=
 =?utf-8?B?S09kMkJLYmtLc201cFBlbHBxZkErTlUzRmpoK3hHWmRqUW9IdGMzRlBRelNR?=
 =?utf-8?B?QmtDZnVkNG42RnU0cmtXdlJwSkxLZWpHNTRaeFg0VXltOVJvTTd6bGhPQjRG?=
 =?utf-8?B?SDlFbWw5cVJjdG9GbGZQaEZKY3ZncnF5K2YreEdrc2FzRDc5d0JNZytoTXJP?=
 =?utf-8?B?UzVJZWpJUUNXdTVjT05tU0tyWnJlMS84dllNZHBjajd5OVpkdUJsUE5xWDhW?=
 =?utf-8?B?cXE0UTUwQURvaDRjNWFBVWtxZHE2Sndzb2V2K2hWZDVhSEMwY2JjYjBDVkJK?=
 =?utf-8?B?eTYwTmpjTkdQSzFFcEpiWlBWVWxmbEFndkRnL1o4dVlLc2VPNXJrand6akpY?=
 =?utf-8?B?MS9lSVV2bnk0TUdHVEU2djl1MGNCdXkwZWtsaXkya0srcTVsY1VXR0k5dFlx?=
 =?utf-8?B?TExIc0pJZndPdkxNS2k5dURhODNPU25NanhwWEZMaWJSZ1NDOUFrdERMbzlV?=
 =?utf-8?B?MksyUW1SbUMzU2lWUjBheDZ1NHBIMGhpOHFxSkJOT3JTQ1ZyV1NXeFUxVERs?=
 =?utf-8?B?cWIrRTR2dm5aSXBocjByeGFaNi9sbmo5ODhnK3llQ3BHU29TVERiM09yWWlR?=
 =?utf-8?B?OEJJT2wrdmx5M0dIMmJ1WEoxU0dxckhjV0psWlFuT2JVUDNVMlJuclZOamlE?=
 =?utf-8?B?VXNUNnQ2ZlBYWkVSSTFQc3dHcUc2UHNzUnR0L0c5V0UyWHJqT1d0ajJBc1Rh?=
 =?utf-8?B?a241dU15SEZBRVZidnFQczV5TCt1TVdPbkVYdDZoQnQwVEEzVnJiYWs3a2Fz?=
 =?utf-8?B?RXVBcE5MQzMwdHVvazNia2JHQzBlQjI3U2piVXE5aTErU0J4bVJ6eEpHMHln?=
 =?utf-8?B?R0R4N01qbmptTEhmdE80UFpTNzJjZFBES0p0UTl0RWNlcFByNzJReEEyQkJn?=
 =?utf-8?B?cjZwOTR0cW43RWVacGlHL1BYQzYvQ01sODNOOVptSTR3YXZFTGo2ZnE2d2pL?=
 =?utf-8?B?NFZvNndQdmhxWmR1SThjT3pMdXV2ZUVlZWdYdlRxdGYwQkxHY3RFdFVYejRC?=
 =?utf-8?B?ZVlEa3JOWVpQRUdoZ1RzUFBrSjJBN3ZQTjVrQXdlYU5Hd1FoWG5aRWx5UzlZ?=
 =?utf-8?B?c0dwWkh6MUo4TkZ4VWVuU21xRlVxSXoreUN1eEhFRTZpOVR3dGRDWmp6UUhD?=
 =?utf-8?B?cFllOHA5U0NqZDc3VHJSQjBZRGl3eVdVRE1kWGh0dG9FOVRtaDd5REJwcWlN?=
 =?utf-8?B?WlQxVWhucmtDYlluTUcyMHdOMU5tM090b0QxSUtGSjZWSEYrejk4N01VWUoy?=
 =?utf-8?B?T1lEL21zMmFYTnhlVjJSRGk5Ylh2Y0habWtlRzFUd2VZblBVRi9TYXo2U3Aw?=
 =?utf-8?B?Z0pZVDhnai9YUk53QllLWEx3bkQ4c2sxeFZoQkdISjFKTEdDSG00ZmpJMERl?=
 =?utf-8?Q?swPPVnu9HoIsyNfjMYVakUo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmIyYStlSk1sVWpqa3Q3SEQ0ZVVjTVlEWEFUNEVEbzNic2ticzFXT0l6bERu?=
 =?utf-8?B?OVZHUXlBVzVpK1BCM1dkbkRWdzhPVFd3dUtVUUlwbWI1RXZUZFljcStnLysv?=
 =?utf-8?B?Y1pySzN6d1lVVWpBcFBPYkcyMlhWMlBLS2lQL3l0TnlLeHRoUmRRaWd2WFIw?=
 =?utf-8?B?V0NpcHMvWmNNb2pwOHZsS0RqSFBHVEtvUVQxOXpvaTZrUU41Vkk4NVFkTlBk?=
 =?utf-8?B?ZmQ5cGxuWWErQnlPbEpiK3BVQkRrUk5sazRBbEJYMmdiL01QY2h5T2E2S05K?=
 =?utf-8?B?Z3lHK3NRZkxCTnI3LzlsTDBSa1N5dnN4WXFlVVl0R0VVbHN2R2dlU0NqWkpt?=
 =?utf-8?B?U3E1a2lkMTV5ZTRCenJBUDdvc1E1d3M0ZkFwL1ZkOUUwOXB1dDNhNHFQcVFQ?=
 =?utf-8?B?U1lHK2NxZlplekRIa1NBeHlMTXNJa254K2VMVkZWUlV1WllacWswYUlWaDUy?=
 =?utf-8?B?YXJDN0pQa3paRVNRZlFRcUxoMWxQc0RLT3hKVENZRU4vWXpvajJJWjJaVHZG?=
 =?utf-8?B?OWxmYmc1ajdEMjBvaUZZUVJSZmJpTHBrUnl4RXRIRldCSzV1SXAwbzNkMEpT?=
 =?utf-8?B?dFgzVjI0Nnd5NzJ4eHlCSXUwY1JabW1OaElmTzdRRTcxcmEzbmtENWdJMFRZ?=
 =?utf-8?B?UUFnZlEwN1dqSW1TcXJidno0dHFNby9LYzlBeG9kMHpFem1wUlhMWXhwRTFu?=
 =?utf-8?B?ZG9paXpHZFR1b3NpK1JwOEswdFZDLzNmRmZER0MxbWFBcUpxNmloRThGOE9n?=
 =?utf-8?B?WTkrdVBwcnZ5YXhHRjY3SGVubWhST2gvQTZtVXd4QWpEUC9NWmEzYkJ2ODFx?=
 =?utf-8?B?cDBYV01qTE9YLzBSSURaUTFrVngrYVVRV3p0eXFqMnh0MjloeGhUU2xSWFA3?=
 =?utf-8?B?ZXlmWTIrb09iMEJ1dXFFRDY1QUVxMUljaHpSLytZSTBORm82cGRteVMxbmlE?=
 =?utf-8?B?N1U3SCtuQnNBZk1IbUF2cDVScHp5MW1NeUhNcnMzdEErZkZqK0hQb2R1c3k2?=
 =?utf-8?B?eUN2Y25hRFN5dEZTTjJGcTk4SjVsNTNoRVNUVkJOVGhOQnRhNlN0V3h1NEdU?=
 =?utf-8?B?WHErWW5VVXlqM0FQbW9tOElSdGwxWkJtcUVUQVFkN0xzek5uSStJQ1RObERj?=
 =?utf-8?B?NS8rcnAyYmlxeUphYWEwZnI2bEJPVk8rS2ZWTjdtK1p5M1g3elYvQm84YWhY?=
 =?utf-8?B?STdSRnNMWkZWZVl5MDFPdXgyVHNHVE5uK1Z3aHp6RGhMUy93NktZM21zTHkr?=
 =?utf-8?B?MjE2SUlDWVp1WlFsN0N2OHE3dzhRakdnWWJIZzZiOHozYTVOcTlZVWdkTTYw?=
 =?utf-8?B?WkZ2QmYrN0tKelNNWVBpdUROQWEyN0NWMS8wSmxqcTRuUDh0bE1LR0tpM1ZY?=
 =?utf-8?B?Tnpaa2pjaHZiRkliM1NubzdRWjh2V1IrZE8wK0xqNnYvaXNQaCtRS3kvWlZa?=
 =?utf-8?B?WHNsdGRFVlZJaXRWeUhWcVNPU05IbncxZVBGWGl1dkhmOXB0SWpWTXRzYmU5?=
 =?utf-8?B?MUtNbVJOWm9rUkxrWWMwTDJhWko5VWE2Y2VqQXlhdnFOdjVjSCt6cGZsQ1ls?=
 =?utf-8?B?cWhYbVQxNG5EZldUdTVpTnVDclNiaDZHUWkrYlRmSis0ZFl1VnY5bmxFMHN6?=
 =?utf-8?B?RjZ0T05pc05WejlvRUtCQ2c0ajFCVTRmUXJPUnNHcWV5anhtY0pDMTQ5SE1a?=
 =?utf-8?B?S2ltNmIzSEN3UURmNE1pVmNSV2NqK2dBR1NabnllTGorY1FwRFR6L2lHZjJ2?=
 =?utf-8?B?UG1QbkNoWlRWcUlXcDBKQVlLTjl5Y0tOTUVGai8yZXdDa1gyVG84WE9rTmQx?=
 =?utf-8?B?Tkt2K0JRMUhVQTVsREZ1MGZhT1YzQzdjYjU3RU5hTkdlUDZaNnViSnFrMDhM?=
 =?utf-8?B?VUc3V0UvMUpmRHdZYmxFSi84bUI2Yno0b3loODFvZnlCbU9UMXBiKzZlOGwr?=
 =?utf-8?B?SkdFejdCN3RQN0ZwZEJrcGsvWHlMRGJKU3pBRHhRbXBNUERORmwxOEE0UVFp?=
 =?utf-8?B?L2FOQTBEeDBpRzQrOUZmRncxQlVSTWFwT3kyQW9YWksvUHpMak5xWWVqSGpl?=
 =?utf-8?B?Sng3bU1KVFRZNjh4TDhveDV4c0lLam02eFFaUXFoc2NJZFpJNEk0STByZ0Y4?=
 =?utf-8?B?TGZFVHlzdTJ6cEFyTWVqdzJPNTRoOGdhUkVJUnIwRi9Vd0JlU0RMSWhidDJQ?=
 =?utf-8?B?Y25mdG0yM04wbTNtRC8xWmplRmtTRHBUVlZTVG9YdjRnd2cxbDNhVWhScmdq?=
 =?utf-8?B?WUFiTkx3ZHNwR2treCtVU0Y4ODloSUNxZHV0RHB2TW50emJNUTNHNzFIYW1I?=
 =?utf-8?B?MGtoRmwrZ3plVy9zY3dGdlhtNytEbUh0NWpKUDZnL24xWWx3RUd3TStZMmtI?=
 =?utf-8?Q?v9mSf9v1FwTf33HM=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qPdQ01b3wUPMvLq3moCTUAgb"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO4P265MB3823.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 029d327f-8f79-4dcb-3e0e-08de5a6a23c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 10:28:24.5664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQTeTzLZbiekxpLjYAMOXTWLRgcBmfx2IcJCeziIxn3byl95SBymvNCKOx1ml+ZKNz/5Oi/y7iw80+dSqPcSsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB8529
X-Authority-Analysis: v=2.4 cv=E+LAZKdl c=1 sm=1 tr=0 ts=69734d4c cx=c_pps
 a=xQWqvUiSSpc2N4B0059lMA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=b3CbU_ItAAAA:8 a=r_1tXGB3AAAA:8
 a=U7EU0tfPisnkVTVYd5kA:9 a=QEXdDO2ut3YA:10 a=it59daBhkrbyyMWv4fYA:9
 a=FfaGCDsud1wA:10 a=Rv2g8BkzVjQTVhhssdqe:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: Mo_oSPEGRXfjQ_s0CV7lKQ2vVBYXtg6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA4NCBTYWx0ZWRfX5aGi5+povD+R
 NVD8RusugXysq6DC2iiM3spK/YNY2TrybPAWHwK6omQ6dvE+gRFw+zOMLZx9A5yyt11qpezFyKF
 hjoPH/Osl0Kpt6QRcF7kWf6xNO+PAKaPTvvyYZYzB9e06+dxUA816M/+DleM32+rKGqUhgci+dj
 Wgd/eLqpy7fNyU1kw+x9yKECywIZoeYhzU4WuLEyw6lRS8jlrUSEDz6E616mkV3fR8uNunDTmOC
 q0tFdi5rASQvmZBHNvhoG3uKgp1fWSPm3Zk1j7Oyugt015g4YZdhSFDAnbX01w4w1O0D7vSgire
 /0rC4lpq1kJn0a/mGR1FY3S9OxsXRh9mDfXl/WsCInRT+ZSnDm1ni6QdeQIKNdjVJ8Y1PFA44VJ
 kqPfopzIq+876+KytRmwylpVY6basytPPPjQNDbnaBMZHCdG3eS3zPesKOQnn3H2BpuwFnVvDH+
 4kaljVTeeV0jhVFcJhg==
X-Proofpoint-ORIG-GUID: Mo_oSPEGRXfjQ_s0CV7lKQ2vVBYXtg6W
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
X-Spamd-Result: default: False [-4.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,imgtec.com,linux.intel.com,kernel.org,ffwll.ch,suse.de,lists.freedesktop.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:airlied@gmail.com,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.079];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email]
X-Rspamd-Queue-Id: 6B5807450E
X-Rspamd-Action: no action

--------------qPdQ01b3wUPMvLq3moCTUAgb
Content-Type: multipart/mixed; boundary="------------0uQS41h9CosZ0n0edsGQ1P7D";
 protected-headers="v1"
Message-ID: <bcc4b571-3c14-4c2f-8e47-127c35946a64@imgtec.com>
Date: Fri, 23 Jan 2026 10:28:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Matt Coster <matt.coster@imgtec.com>
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Alessio Belle <alessio.belle@imgtec.com>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
 <666b75d9-108c-42cf-bce7-b7efdb25e027@imgtec.com>
 <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Content-Language: en-GB
In-Reply-To: <3af6990f-3b3e-4dbb-aa9e-1cd86341e0f0@mailbox.org>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI

--------------0uQS41h9CosZ0n0edsGQ1P7D
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 05/01/2026 16:34, Marek Vasut wrote:
> On 1/5/26 2:09 PM, Matt Coster wrote:
>> On 06/11/2025 23:24, Marek Vasut wrote:
>>> Fix support for build on 32bit systems. Include linux/io-64-nonatomic=
-hi-lo.h
>>> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accesso=
rs, and
>>> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
>>>
>>> This allows this driver to bind on Renesas R-Car H2 which contains
>>> Rogue G6400 BVNC 1.39.4.1 .
>>>
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Hi Marek,
>=20
> Hello Matt,
>=20
>> My apologies, this one appears to have slipped through the cracks on o=
ur
>> end.
>=20
> No worries.
>=20
>>> +++ b/drivers/gpu/drm/imagination/Kconfig
>>> @@ -3,7 +3,7 @@
>>>     config DRM_POWERVR
>>>       tristate "Imagination Technologies PowerVR (Series 6 and later)=
 & IMG Graphics"
>>> -    depends on (ARM64 || RISCV && 64BIT)
>>> +    depends on ARM || ARM64 || RISCV
>>
>> This seems fine to me. Do you know any reason why the single change
>> below might *not* be sufficient to support non-64-bit riscv? I can't
>> think of any, I just wanted to double check this had been considered.
> I do not have any 32bit RV to test this on, I only have 32bit ARM (R-Ca=
r H2).

I appreciate that you'd like to work on getting these older cores
supported in the driver, but as it stands there's no real way to test
this change beyond ensuring that it compiles.

I've asked around internally and the consensus is that communicating
with the GPU on a 32-bit platform requires more consideration than just
using the shims provided by io-64-nonatomic-hi-lo.h to avoid introducing
races and other potential security holes.

My suggestion is that this patch be shelved for now and used as part of
a larger series later which adds basic support for a core on a 32-bit
platform.

Cheers,
Matt

--=20
Matt Coster
E: matt.coster@imgtec.com

--------------0uQS41h9CosZ0n0edsGQ1P7D--

--------------qPdQ01b3wUPMvLq3moCTUAgb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaXNNSAUDAAAAAAAKCRB5vBnz2d5qsJMJ
AQCGS2m4g96oLzGiAI8eCvrHbloSlFV5RxOAB1kIWKeQ4wD/a+c4l7OPCLBn1WHwS2bHLvYcIXim
R67MwxOEsVtd8gA=
=buja
-----END PGP SIGNATURE-----

--------------qPdQ01b3wUPMvLq3moCTUAgb--
