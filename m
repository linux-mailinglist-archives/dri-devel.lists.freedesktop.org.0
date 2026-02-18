Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLQsCuCblWmsSgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:00:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AA5155BDC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 12:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9601D10E261;
	Wed, 18 Feb 2026 11:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="tmHy66yY";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="d4GTIBys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1DB10E261
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Feb 2026 11:00:38 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61I9HMMF1365824; Wed, 18 Feb 2026 11:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=8kZKVjQjpbm4b9dvOHmHu1UOk
 zLTG3KDlPbGe1fslr0=; b=tmHy66yYiY62Cs+kLu3/fQrCSE8qk+VAlKhqXtreu
 Ueow5jsJ5vwWC8q86sRQUuhyk/p2Ra9NNqrfg6rxnaWZDQ9yyh1cqHwdOo2Qam3z
 rtka/ANydmAVtLmTGou5qAcpfe+qfn6ffXJchgTZ9CGMM2OEfM4AQUSxNEu/TP8K
 kxfWbH+9yY9n6HVumr1AMR0cb8MIJ2KVC3az2d1PjoLZPFSZcBDsub7J7y0V3SBq
 O1SRkh6RjovMs6HvWM4nkrnoPNxdxw5zA6fbLU2YZ7T4rVFYmK5qwQaDoffEfvA6
 x+xAXVOpDJIgJcW1fHcLyTuOwl1ZXgH6h1Of4TVPRsOVg==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazon11021133.outbound.protection.outlook.com [52.101.100.133])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4cc8hgs77m-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 18 Feb 2026 11:00:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woRhmHQyAHYtX9dFwMcIpJlsp4KMdBKYtEeNQ6iekDvIuQjMx90/PeIWcplJvt9k8AWY2WLe5ShwkFFpHAqVUoBEez2AAtQz9gV4t10RXSZOcHxn531E3MJKaeeTu4nbiHRR9nMkNWFpUZiUyDavA4VdFZgAvQ3WdnB1CNDMz5joY5CxZVoye8m08MxBeCPEvm0DirRgPnTaZycQDZj2IpZ1Ub7/vMrD/zRhRLeOVcn1bg9kAC85V1z6OgWS+DBdBSmDidNBncOxEiRTFs6T6YrjGPZnWLvG9lueeUxIIxyGy1qudOBCf2nlSpAOGqKpan/4Wfc1R6yXLFR9NW+PkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kZKVjQjpbm4b9dvOHmHu1UOkzLTG3KDlPbGe1fslr0=;
 b=U0seWJArQGmOzAT+UEiozuBmcV3ULVlU3hP3NCElmRjZgWizrJ1Rc/z36DNgJXwTFp0v365nJKfQj76/YdOGD+RV/u8C0SebUc5N+Mnv+HJ7IvLN246YsSqOAOOM+PopEZUrArVGn6VsVA5pMVAUXEBblbG71G3aqq2jWSHKYjCtWejd+Q3ieO1v/jeVZUsggYfjqZGOSr39kwa9RqIehPMmA6DuIUPR3/WC69m+wWCVktCTqEAfICJnozTRd3F49RWVWqrGZjsCQ0hZwCYyYvdC+twiQ20c8tIQaiZ6eBtrOHgJgr69T77Y37hv9c1lVFqJV2SWppfJCYS5NnZI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kZKVjQjpbm4b9dvOHmHu1UOkzLTG3KDlPbGe1fslr0=;
 b=d4GTIBysFdTJJZbP/TSlOi8Rv+4GBFBHHMYNKRCJ63P9DbqkpW/9tFQLRC+K2vkljp+ixcdlO+iepdAu+sp2lGwjiW2eT58sU6Ho1Zowg57GSFTYi+9KKLpdsaidbsX3+b8jYAcDfqerxgiRYmeKJvWAoql+wbcfM8CArzeeK5Q=
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e2::14)
 by LO6P265MB6444.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 11:00:18 +0000
Received: from CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6]) by CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f32f:ed34:4f98:6cd6%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 11:00:18 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Frank Binns <Frank.Binns@imgtec.com>, Alessio Belle
 <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
Thread-Topic: drm/imagination: genpd_runtime_suspend() crash
Thread-Index: AQHcoMXEyUEwU3GsmUCK2BGJniZAbQ==
Date: Wed, 18 Feb 2026 11:00:18 +0000
Message-ID: <0256cf2b-ac62-437c-a6ee-7768e56a35fb@imgtec.com>
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
 <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
In-Reply-To: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB3393:EE_|LO6P265MB6444:EE_
x-ms-office365-filtering-correlation-id: b4c1cfe2-5ad1-492f-8078-08de6edce75d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|6049299003|38070700021|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?L1lmQmczejNndng5ZHIwQ1NMU0toT3IrSlRZY2ZTYkMwaTBmRHd6WlZkMUgy?=
 =?utf-8?B?R2JGd0pucC9QWVlEUEp0aXVSaEhyTzNqT3c1UnBTam9tZGtsMEEwRVBJV2hM?=
 =?utf-8?B?eTZMTUdBR2pmQkRRL1B0YXhaVUpVV0o0UHZqMXhpQjAxbnFSMSsrdnEyOWky?=
 =?utf-8?B?UnhSMHlQVEUzWkNxWUowejNMVklWc1N4ZElQVE9qUzZIeWpSL2ltS2tlT3NQ?=
 =?utf-8?B?MmRwWVFjRC9BS1VmLzc2cllCZEtOTVRBbk15SXIxS004a3pReEVBK3JTblpP?=
 =?utf-8?B?NzcvOEVVUHlBMXZVWjJsRUxIcU9ObDUwNm9mVUJNSHNRTE0zVjRzdXBXei8y?=
 =?utf-8?B?RFlCREdud1g4MFdDSU1SYlBoeVBFbTN0RjFxUWhrYVhEaDQ2ZTVTVmNrcC95?=
 =?utf-8?B?elN6NUhWZ1RxcjY2OUx0cndZTWM0b2pKVktjdmdRNnJvak9aMHVoYzVSWFJw?=
 =?utf-8?B?eis5MTdwY25kZHNaMXFvN2N6NUw5RFRQOWxaQjFpWndTUDFKdUFnNHEwY1lC?=
 =?utf-8?B?Y01zOUNFTzJRS09ybE9QdUQzei91ZG82blEwS3lqMUw0eCtIZFE2aUhjc3g3?=
 =?utf-8?B?dEQvNWlnZy9rL0lKd1FRc1BqeGJ3OGRtRUR6T2E2eHAvMUNMTVZRLzZFN0dJ?=
 =?utf-8?B?SUlvZWo4Tm9jT2dOYVNNd1VyMXBhNXFER3diV3I0QUJMeDhycVQ2VExCd2Vl?=
 =?utf-8?B?ZUlKWWp5K0luSk5HczdWMTk0Z1g2L0JjTXdDV3ZpU0lBVWNBV3RlQTJ1Z1RE?=
 =?utf-8?B?cWhraUQ5dWJQcVZLdXh3bWlTRmg2S2RmM3Q5YkIremNUQTVzbDM3TW1nSzJI?=
 =?utf-8?B?T3Q2d2NhQXpNdVdlZEtGekdFZXY0NWsveWVZT3EwSUVVa3BFVFJXYkZmS1Ez?=
 =?utf-8?B?amVyTVdJOXNSMjlRcTUzckl0cEcwMzI1OERjKzhPNU9aN25uU08zeitWb2Ez?=
 =?utf-8?B?QVBXVUtuaGFTNlZ5U1JRMFhQYmY3SnZIdTBjbm1qb3VLRVNqMXlyRUlaVnpW?=
 =?utf-8?B?NkZBRHZFNFBIeGJhZ2tJeWlvcWRpQ2ROR0JUamdWMzNnWTFIdkI2UnRsR2pp?=
 =?utf-8?B?RmF1Z0NYa1dnV293R0R6d25CYXJiejZhcVR1QVhpa0NWMzExN0lFanRCSURQ?=
 =?utf-8?B?ZXRkZyt1WlE2NUl6RTc4clJPcGpEQ3ZSNFkrYm5rUVlqU2p1Tk9wT3FBVk8z?=
 =?utf-8?B?M01BdEhWRG1yOHZtdUtYbWhZZmxSWjhYZHpiUURoU3lTNyt5S0t5UkVKdmNF?=
 =?utf-8?B?MWQyR3Z2L01vN2hFRHlUK25PVFFIcC9XcmEwbXEzMHNnVGp4TjJSWUNsUWRp?=
 =?utf-8?B?MldNcTdRRUVxeXl6VUdudnhET0JnZVY2d1dOOEkwS0dibDlWYmJpdVVDZVBu?=
 =?utf-8?B?Qml6Z0w5c05xV1ZscHd3NWNIdllpWG1CUHZIMk1mMWpTQWEydTVodVdUc0wz?=
 =?utf-8?B?SUtIaFRkdm5TQ0xkbzYxMy9OeXRYa0RnL3cxeXFEUHJab2s2cGZJcFZqRm9M?=
 =?utf-8?B?RnZZTEZ0QmQxVlJBUVpMd25qczRjWGtSekovK3RMY1A1emNXQm1jMFFhRTRa?=
 =?utf-8?B?YncycTJBbTJMUURTUTRReXlLSzBKSXJWd2ZuMG5iZmE2ODk1NnY2ZEtQeXRL?=
 =?utf-8?B?VXJyeGE5bGo4QTRIZGhCUCtyMnVOeFBXSkpGRFJNaVc4bTZCQyt4YzhjYnVX?=
 =?utf-8?B?dkxZSEMyU09uamUwQ3JHVHdZOXJyYmNOYUpUYXRRR3VhRW9BamIwWVcxWDdp?=
 =?utf-8?B?M1ZteTZ1Z2I2UGpqbW9hSnZXdW1QTUYzUCtnOGE4TEhOaklFYVAva3N3ZDBO?=
 =?utf-8?B?ZmxDVmZlWDUrQjYrY1MvZ1F5K3FzcTZISFQ3cHFVZGZFNitwWWQ4eHNSWTBx?=
 =?utf-8?B?bktDRmsvLzVOWFJiNEJpT2hWVzRIODRtV1JhVndPUUJtdnR4SnFkalhFR1pJ?=
 =?utf-8?B?SWhkS3pvNFV0SjF3ZzE0Y01WY05HN1ZWTFBZSzJmVUNPcW9WYzB2SzcwaG44?=
 =?utf-8?B?K3ZYdWZrSVJxRzZUY1JYZ1RRbU9GUTAxUUdPRVl2QXRrZG5uNnBGYTlscnRi?=
 =?utf-8?B?b2NsejNtcDZXb3lPc3RrRm5ZaGRlbWxTU0dSV0p0VFdFMDBpT2hSeW5jUUlr?=
 =?utf-8?B?L0owZnIxaUh2akdWY0IySWZJelJxTXUxaXZ2MVJMMHJqWHFQWE1UY2xJM2ta?=
 =?utf-8?Q?toJb+yDbRXINFsim3N80OLc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(6049299003)(38070700021)(4053099003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXJFYUhDSnZacEVhcVRoZGg4TC9Well0L3Bnelk2Zk9tcnNjTDRVaW1wOC9H?=
 =?utf-8?B?WkkyUDBTWmdsdlBCdFhnTFRlN2xmZmdQb2JUaUZuNSt0RisvUnFuOWtLc0Rj?=
 =?utf-8?B?bXk1TEZFMDZpRG9nem5xNm5iOUdVRDNkMEJiZFlnekdIUHVGMGFnSGVBZThX?=
 =?utf-8?B?Rks3dDh1UStnaU9UbU9IdGdvdTQ1WnlpRkt6SHpyeEorMmZXUWlOdGdzNUNj?=
 =?utf-8?B?Z0hKYzJzRm94bitrQnRnTzI5VUYzSHczcldTbXc2cjlQVnNvZHkxNXdseDk3?=
 =?utf-8?B?dWk2ZFkwWU8rZ2RUSHFWRGFEd2RDNit3VDVzTDRkeTRJUjl4ZmlsQkQvUGpl?=
 =?utf-8?B?WElNdkdLbkdNVFgyV1JjTFVqWkxnRzE1VkNIYURTZXFvekpSbndLQWpDMDJ6?=
 =?utf-8?B?ekUvemJsQ3BJd0pRUzc1WkRsUi9IaVBhaDMrTm9wOVIrSjcybXFQQmQ4Wkp2?=
 =?utf-8?B?VFlpNDRpd2RrRm5XTU1SOEEveWRsVGNsSW1mVVYxTkl1dlhHWEhFZkdQZjRS?=
 =?utf-8?B?OGUwSFF5Q0tEdHQ5Wkl0ZytBTGs0M2dJVUFxdG02QU04OUtyeFZaTEZ1QUV4?=
 =?utf-8?B?UFZldGdiNEpuUVo3aUlzdnBhQUtaOEtVUCtWNnRXMUE0eWZyZUF0emd4bHRo?=
 =?utf-8?B?V3ZIMUh0V2xqQXhOblBvVmV3aTJMbjVXZ0hNZWtDMXRDam1PUVpVeUdRcDh5?=
 =?utf-8?B?UEJQdVV0MTlHbHlhNklnTXFXRE5qR2VOS0QzMlpVekc4WVVzYzFoVEZabWJ6?=
 =?utf-8?B?QTJJY0lvUzhtZ3FOSHdzZDhUdHpIZk1Pa2w3UzVXMjV6RG81UENBbUphVUg3?=
 =?utf-8?B?NllSWXNiNDlKdXRJeEZDeUJ5TDVoOVRQWUtwd1BrODRqdjB0K3B0QXNBczBH?=
 =?utf-8?B?T2dTLys5bzBNdHlkTTBveWN1TC9WM2MvVnA2UzVocnhlUVdSOVZKcnB6S1RY?=
 =?utf-8?B?cDNZZmNCcFNOM2xIbEgyYTF6QVF3Y1dzekh2RmZVK0wyb1U0cVZHZXViNkUv?=
 =?utf-8?B?OEc5ellzcUNjQ3dQUXhjTUdSVVpMUGhiVlY5WVA2SWhBc3pQeGc1Tmc1bFM3?=
 =?utf-8?B?SWRFQXpYTzNselBpaXFjU2pBTzVkNFJ5blpabEczZVNuczQ5Y2ZSblREUnEy?=
 =?utf-8?B?eGFsdEdzM3dOYzl1Nm5wRVZlYmpaSUJ0NTlHY2oyMUwrNHRhS0pzbWZMaG1k?=
 =?utf-8?B?QXBjOGV0Nm1EMSttN1ZRSEpLaUZzZDRWbUYrNTJIalZBM2Y3ajNtREYxYndm?=
 =?utf-8?B?SnB1dFVxOXZGWlNiejJKQ3RPQk9IWGovendyZ1FoNzdzTmtUVU1iakNZZG9S?=
 =?utf-8?B?cXJFeVhXcCt2cCs4OFVjeWJXQWdYeVAyUzBiMTNkazlqUnpuakNoRUVpL3pY?=
 =?utf-8?B?b2FMSUIxK2ZsZUV6clhHeGppOFRmeUp2djkrWHZueW5PUytNWmdWQTF3ZC9V?=
 =?utf-8?B?Zm9UbGNBTXVpdUZsN1dUM2g0Z2licGtjRkRWdFlvRGFubTkrMG1KSTNVKzAz?=
 =?utf-8?B?YVVQSUozZ1g2dldiWEp5Vk5Sc1VxdlEzNkx1WmJyajdEbytReFpkSnNXY1c5?=
 =?utf-8?B?SzhhcHBDbWV1RlBRd1hFRmJLeCtMWWovSm4wNHVIRXF4THFhQ0w4VDVCQVkw?=
 =?utf-8?B?YmoraldDRWlhSTRMSVZ5L0tKd1RxQmovZDUvalVsTVlJVjdFdCs2WW9KdU45?=
 =?utf-8?B?UGlNL01jMDRRb3Zlak52M1dvRVBRRGdocEd4UFptU1ZReVRYZ3VVcW5sb1Fu?=
 =?utf-8?B?TUxvNkNoR2xVMlBsQjR4WXVQYmJZQzlsMDZDMUpQVHFVN3VBbnhhYmdlWW1F?=
 =?utf-8?B?UVZBVSs3ZWhuNVUrRzRMbG5KbDdYc2RPeVhuSE1FdjA1WXdERS8yOWdwd0xw?=
 =?utf-8?B?OG5tYlYvb0N5YnNESkIvTGJiMzNDdkl6TTJ1c214K0JJQ0FSZlVaYUs0MVBP?=
 =?utf-8?B?ZGxOSzBLSkFDNHRiQXkvOG1xclBOeDZ2QXJ3TU9QbkpiRXB6R0grOHpXdG9K?=
 =?utf-8?B?Q0J3WXJBcUlMY05xUnpocDlxNW9sTkpKSWIyOXV6elJBeFZJNE9McEZCYXFz?=
 =?utf-8?B?SU1QenY2N1JPekpCV1lHYmFHakMwNjRWSFpIVGdWYkp2aVZCZ0xab3FVb1BD?=
 =?utf-8?B?UHBBRlllSDJNSHUwQTV6YWtxZmlYS0ZBRmFJdmNIbVdRSS8rbWJ3aTVpck9Z?=
 =?utf-8?B?cDMvVjhZSXhhaVJjVktER0t4MWI4cjQxTnpFbmoxZC96LzAwUHNoZjJTSWFC?=
 =?utf-8?B?c1RoZFdIUmQyRWFOd1hPWFZKaCt1WDUvYW9jSFk2WkxFbWNWL01pR1MwSVJF?=
 =?utf-8?B?UlppNXo0ZTdaMEx1K1JNa1FWZHJKV1FIRllmYTZiaGw4bXgrUjZVN1lVVWVj?=
 =?utf-8?Q?Lnkp5HOJYoUWWMYI=3D?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dkvieTnkg6pMYBKl0CyLCg34"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB3393.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c1cfe2-5ad1-492f-8078-08de6edce75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 11:00:18.6144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4HTejvMF5VpqZ8zWktXRURMMOm4VwS5Q2bKl3/C7eaYmqGar6ZO3o5A2uK/olmyrFlSzVZg7UT7jpcVvV7rshg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6444
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NyBTYWx0ZWRfX4DN8exgLYZra
 kT6dPIwaCvRCAqYXNcmQpLcznzb6Eeid8d/TpU0fqreenVUWwrBhYZQ9DReo6T12hK+6oDFnYu5
 tbzN6AdIN3EMe4lmk3AswqKAe4B0LGKFTAYg9ia1IJWdaRpKDm3p1H6ML2mA6SIVUON/p0f9WF1
 EV/yYV3C9vs88tPLM1bnlnnAArY1vnp+k70NcrZJyJp8BQfXB7vCR0xWkTjY2CaQU8JG2Okso/S
 GylYGvZj/JtTMoXzNfs/+juEgPbYfIRLh5/c8Gc3zuF946veAh7tfiyQLswFVwrjMMTH4wxFdC9
 RU6NcgmRHpU9euFJgGatW3tGpe5pe64G6fdzNWMe0Ht0koSQzV70iI7L6jk0O/ciZ7/iQPlbiKc
 9568LBtj6pSsF61Sxa/2BaaE83Jkv8n8VjE3/QFcsT/pIMr91CSrX+RkADDXGO+m2+xmmknYY/E
 Ij6z1CLG5Ii7mfqTWFg==
X-Authority-Analysis: v=2.4 cv=Y5f1cxeN c=1 sm=1 tr=0 ts=69959bc7 cx=c_pps
 a=Ci7k6HNobu9TjXU6iQDTAA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=NgoYpvdbvlAA:10 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22
 a=qZQ2PDNLMSdLoqI-hfl9:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=r_1tXGB3AAAA:8
 a=vmRjTF1aZ_ZcGhvexJIA:9 a=QEXdDO2ut3YA:10 a=-nNqpxLF0C1J9Fse4nsA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: HEzUcnN1p-N7t3YCGJh0cqqnuR8fTxHk
X-Proofpoint-ORIG-GUID: HEzUcnN1p-N7t3YCGJh0cqqnuR8fTxHk
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
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imgtec.com,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[imgtec.com:s=dk201812,IMGTecCRM.onmicrosoft.com:s=selector2-IMGTecCRM-onmicrosoft-com];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:Frank.Binns@imgtec.com,m:Alessio.Belle@imgtec.com,m:Alexandru.Dadu@imgtec.com,m:ulf.hansson@linaro.org,m:rafael@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
	FORGED_SENDER(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[imgtec.com:+,IMGTecCRM.onmicrosoft.com:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[csi2.fe500000:query timed out];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Matt.Coster@imgtec.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,fd000000:email,fe500000:email]
X-Rspamd-Queue-Id: D0AA5155BDC
X-Rspamd-Action: no action

--------------dkvieTnkg6pMYBKl0CyLCg34
Content-Type: multipart/mixed; boundary="------------48kOU9Pq0Hvp10iIc5H7ZYkG";
 protected-headers="v1"
Message-ID: <0256cf2b-ac62-437c-a6ee-7768e56a35fb@imgtec.com>
Date: Wed, 18 Feb 2026 11:00:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/imagination: genpd_runtime_suspend() crash
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <CAMuHMdWapT40hV3c+CSBqFOW05aWcV1a6v_NiJYgoYi0i9_PDQ@mail.gmail.com>
 <6854ea2b-b316-4711-b849-038d532f00c1@imgtec.com>
 <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>
Content-Language: en-GB
From: Matt Coster <matt.coster@imgtec.com>
Autocrypt: addr=matt.coster@imgtec.com; keydata=
 xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLbkxJDF5DN
 JE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMWCAA+AhsDBQsJCAcC
 BhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmgHpowFCQlsaBoA
 CgkQdH8KkDb5DfqxDgEA81pbVLJDmpFyFZLRhAGig9rgoDY6l774yhTzRVm/SvkBAJLzpSlm
 wyQaQuB668TKOX9XvRLKFGjSq5kkdQcxqjkCzjgEYl2lchIKKwYBBAGXVQEFAQEHQCaVC8X5
 7NOv2jNbeXqjP9ekY7rzy7auiEZ5PxaDWUQVAwEIB8J+BBgWCAAmAhsMFiEEBaQM/OcmnWHZ
 cQChdH8KkDb5DfoFAmgHpowFCQlsaBoACgkQdH8KkDb5DfoK+AD/Q4aN/zUvP72RRE4cNWpM
 MXeRXg+LTN+OJ24U10LltxIA/2w3kDqMC/0t1oqO8TM+c2LMWO/x2IBkG7oRZ/hVw1QI
In-Reply-To: <CAMuHMdUdYidx7u2FOFUmiijp-YeYaQQw_Lrj_E-BoUubuxxR_A@mail.gmail.com>

--------------48kOU9Pq0Hvp10iIc5H7ZYkG
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 31/10/2025 08:43, Geert Uytterhoeven wrote:
> Hi Matt,
>=20
> On Thu, 30 Oct 2025 at 13:18, Matt Coster <Matt.Coster@imgtec.com> wrot=
e:
>> On 29/10/2025 14:08, Geert Uytterhoeven wrote:
>>> While playing with the PowerVR driver on various R-Car SoCs, I ran in=
to
>>> a crash/race condition on Gray Hawk Single (R-Car V4M).  After adding=

>>> the GPU device node to DTS, the driver fails to probe due to lack of
>>> suitable firmware, as expected:
>>
>> Thanks for the detailed report! I'll make time to look into this. Do y=
ou
>> encounter a similar issue on other R-Car platforms, or is this exclusi=
ve
>> to the V4M?
>=20
> Yes, I managed to trigger it on Salvator-X with R-Car M3-W, too.
> Reproduction steps at:
> https://lore.kernel.org/linux-renesas-soc/CAMuHMdWyKeQq31GEK+-y4BoaZFcC=
xJNac63S7NoocMj1cYKniw@mail.gmail.com=20
>=20
> renesas-drivers-2025-10-28 is available at
> https://web.git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git/tag/?h=3Drenesas-drivers-2025-10-28-v6.18-rc3=20
> My aarch64-linux-gnu-gcc is gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~=
24.04)
>=20

Hi Geert,

I've managed to get some time with a Gray Hawk board today, but I'm
struggling to reproduce the original issue. Can you share the DTS node
you've constructed for the GPU? The patch below contains what I put
together based on the previous gen3 DTS changes and the V4M TRM.

That said, it's not all clear sailing. I hit this error way before the
original reported error could occur:

  renesas-cpg-mssr e6150000.clock-controller: Cannot get module clock 0: =
-2

This is emitted when attempting to dev_pm_domain_attach_by_name() for
the first domain (A33DGA), and is reproducible on the tag mentioned
above, as well as the master branch in renesas-drivers and drm-misc-next
(as of this morning).

Cheers,
Matt

> Thanks!
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20

diff --git a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi b/arch/arm=
64/boot/dts/renesas/gray-hawk-single.dtsi
index 2edb5cb3407b..7c54094344af 100644
--- a/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
+++ b/arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
@@ -864,3 +864,7 @@ &vin14 {
 &vin15 {
 	status =3D "okay";
 };
+
+&gpu {
+	status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779h0.dtsi
index 4dc0e5304f72..b66d3fc56f9d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1859,6 +1859,23 @@ gic: interrupt-controller@f1000000 {
 			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
=20
+		gpu: gpu@fd000000 {
+			compatible =3D "renesas,r8a779h0-gpu",
+				     "img,img-bxs-4-64",
+				     "img,img-rogue";
+			reg =3D <0 0xfd000000 0 0x800000>;
+			interrupts =3D <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&cpg CPG_CORE R8A779H0_CLK_ZG>,
+				 <&cpg CPG_CORE R8A779H0_CLK_S0D2>,
+				 <&cpg CPG_MOD 0>;
+			clock-names =3D "core", "mem", "sys";
+			power-domains =3D <&sysc R8A779H0_PD_A33DGA>,
+					<&sysc R8A779H0_PD_A23DGB>;
+			power-domain-names =3D "a", "b";
+			resets =3D <&cpg 0>;
+			status =3D "disabled";
+		};
+
 		csi40: csi2@fe500000 {
 			compatible =3D "renesas,r8a779h0-csi2";
 			reg =3D <0 0xfe500000 0 0x40000>;

--=20
Matt Coster
E: matt.coster@imgtec.com



--------------48kOU9Pq0Hvp10iIc5H7ZYkG--

--------------dkvieTnkg6pMYBKl0CyLCg34
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCaZWbwgUDAAAAAAAKCRB5vBnz2d5qsOQp
AQDCTodn6IeuoWe4hpG3qE98G4Vr/uFk0XKFbYqb7frCxwEAwWCV+asPSswpJ6OCvAfZ5b6zCsV6
/IT0hCs4hjIUdQw=
=zkzE
-----END PGP SIGNATURE-----

--------------dkvieTnkg6pMYBKl0CyLCg34--
