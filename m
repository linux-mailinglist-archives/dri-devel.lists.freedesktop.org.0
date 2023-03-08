Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2306B01B1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 09:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EECE110E5AE;
	Wed,  8 Mar 2023 08:39:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3238 seconds by postgrey-1.36 at gabe;
 Wed, 08 Mar 2023 08:39:53 UTC
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92B610E5AE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 08:39:53 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3287jVCw022569; Wed, 8 Mar 2023 02:45:42 -0500
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3p6g3usywm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 02:45:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+8UhapOtcjC7W+OgXTrNg/mTvjXJfhuBH5QlYRy+ThKlOy6QyAFj5M5bw6rxDZ4kWsTMgcAaQCmZeO7A+x6VrxrFByi85fDsdNBTdwiciWlWksO4+8drRbCj6xUzCM0gka+WIpeyJDgglzz2BmCXPWbxAsP7k1eSpqg1h/LSPDy9qKxdxZbIoZcWU6Hcc6ImTHvk2Zm9Nhkw/eFRafmtrTjaVPqmdLsm6eOEPK91x+0k7NbU9jXZjE99qzrDW78ZCXwPSLL1nvfV6K425Dtw1ZEzpaBNFji7wYByywvChvx0iEO1jD0dUKxgZJsejQgrozk6mu8/WLDjhCfxFFFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgDuGv5RZ8H3tWRcZMWc7eK76NU6tKE9/tkcr8hKNbE=;
 b=G6lS7MaasxftWLevvJi+0SxSBYCjR5tnwkEEoybSJW7aZzefMbQwweF2apaPkhgsDJprkegdE5kciQzPt+74X8+3LDx3xmhbEjxMnNGdO9Q4qq9Vz8tMW33TQyyf67UZSMrKxjtABwVRpyQhZV4BltdOaJ6u0EBuGyyiiiQJRQzgG5wjxBdKc8I99iOpFvCAREdbT21Nh8I5HPblLmMZ8RJOQvyITtXvE42h2Xm6KtXLH9ceIevF+SQp66/HGTsMOTdug8MRFTEY0ypvCEqnckwHQwqZcnJFveoZfyxSXWqNRJ7Ef12uY/RfstTfyxYOrv4/dRXd3iewPvOLjH9Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgDuGv5RZ8H3tWRcZMWc7eK76NU6tKE9/tkcr8hKNbE=;
 b=sH2wD9WM748C5WoswcQ5EB6CixG+Fo/qcI3lzSH55qOrwLc1a6aPNHFeyD0BVALi7wqzHEPxEfgfFWIe6JnEsaAgXPqk5+qTejGMbFmSiXbgGYjgzJG1v4RszSZZ+6eVAFvaA6dZYaiq3Z7rTMZZxcIc6rZ/EgNyrCEXraqoMQs=
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com (2603:10b6:a03:3b8::19)
 by SA1PR03MB6385.namprd03.prod.outlook.com (2603:10b6:806:1c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Wed, 8 Mar
 2023 07:45:40 +0000
Received: from SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::8fb8:a463:b382:cf41]) by SJ0PR03MB6253.namprd03.prod.outlook.com
 ([fe80::8fb8:a463:b382:cf41%4]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 07:45:40 +0000
From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Subject: RE: [PATCH 02/13] backlight: adp5520_bl: Convert to platform remove
 callback returning void
Thread-Topic: [PATCH 02/13] backlight: adp5520_bl: Convert to platform remove
 callback returning void
Thread-Index: AQHZUZEvMvkD9CvQ3UiuLgB0hTqoDq7wgL0A
Date: Wed, 8 Mar 2023 07:45:40 +0000
Message-ID: <SJ0PR03MB62534EAA235A6006ACBCDC4E8EB49@SJ0PR03MB6253.namprd03.prod.outlook.com>
References: <20230308073945.2336302-1-u.kleine-koenig@pengutronix.de>
 <20230308073945.2336302-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230308073945.2336302-3-u.kleine-koenig@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYldobGJtNWxjbWxjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB6TnpNMk9XUmlPUzFpWkRnMUxURXhaV1F0WWpjMllpMWlZMll4?=
 =?utf-8?B?TnpGak5EYzJNVGxjWVcxbExYUmxjM1JjTXpjek5qbGtZbUl0WW1RNE5TMHhN?=
 =?utf-8?B?V1ZrTFdJM05tSXRZbU5tTVRjeFl6UTNOakU1WW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXlOakV6SWlCMFBTSXhNek15TWpjek5URXpPRE13T0RjeE5UTWlJR2c5SW10?=
 =?utf-8?B?WVdVTklMemhUWkV4WVdUWnBabGx2WW1OaU9WSmpRVVk1UlQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUVhoSFNUYzFhMVpJV2tGbFkya3JNbEZrUlhkclVE?=
 =?utf-8?B?VjVURGRhUWpCVVExRTRSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQlVXUnBhelZSUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6253:EE_|SA1PR03MB6385:EE_
x-ms-office365-filtering-correlation-id: a2a39f75-2bbe-4684-41f3-08db1fa91d0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCOK5CgSP/XsOOgrj7lxhEnZASh1QV4SUE+II3E0MLUrN+4y1S2ZNpMHXWMkDAFW7LlHtRZY4RAfc1UAG3BZg6Bw7FHZKMYcmrmPz3i4bj9p2ZyIHTokq4a17xvhgYgFKTFt+tCVc2YMItSCWi2JjPfbK3r0B0fuwAKsI91Jmi9izczGVZRH0HFiS0cMR+mIUrFCqKRJc3UoKM/n5UxVfFbb/N9G71QcRRyQG3TXJWHM7KWWgI+w1WxDl9cL0dhWsiLybGlqSZp36YUqSpby3905Ptmf+0hzvR5eYLIa8kmV2DDFmitko+43/p0JoeWpQRQwfefStW/MMxUipmBRhFDSp2tZ5mmpPYi+Adq8CMCwbjpHJGi7CXUSaS3qi+DtERq2hwAH1psDbFuE+q6Fgxfi4X4XYoIpwe6BIL8CemtY9sn9oe8brIl8yqWHDN9dVupzhxAcNVqL6pxq2BQBcyQnVTDArvuU/NpJlSuMnz92mtqHcqI5nsZbZFMM1i9Rcj/l8K6sxNfcq6wZrgaoTkHB3m8oM35F+QJX0yg2VcGR/EhsbXSQVao9ty1qYozdsmrWMmfQ+bGf/+SclsgxICex+O7kd5pOmWONBkko0SaKp+LDpcxeYncYWy72rpnzTwUX64VjMh5txNGdhEXfiVZ+EgknXNmcINYlVNwBxnu8hjGohEl7I8ursPMYihwY+hUX0IAGP36N42Lnwxbr5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6253.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(451199018)(52536014)(8936002)(5660300002)(66446008)(66476007)(66946007)(66556008)(76116006)(2906002)(64756008)(8676002)(4326008)(54906003)(110136005)(316002)(478600001)(7696005)(71200400001)(6506007)(53546011)(41300700001)(26005)(55016003)(86362001)(33656002)(38070700005)(122000001)(83380400001)(38100700002)(186003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXV0clc2UDZXUTlYMlZVUFVxYkF6MTFBU1hQNlNZMkRSR1pXcGJ6M3dLc3ho?=
 =?utf-8?B?bDVLN3R4OFpCWTRqMFljSlJZUCt5WWVyODdlS2xkamtKaDN6REVRN0Zwajhw?=
 =?utf-8?B?QzFNOWV2OHFoZ3daL25oenZUZXp6UWVxaS9vL3dQZWRaTUhWSHVWQ1doTHBE?=
 =?utf-8?B?ajdEZG00aTFxUGd1cUVOSDlLbEU4c0k2SDBqRHJDSjZOZDZrQjU3WCsvQW5H?=
 =?utf-8?B?SjRRZmtZalZ1bjcwaEdiVmhhbURDN2tzNjQzcjNRSHhuSWJKTUxGK2pnVm44?=
 =?utf-8?B?dXlLOU84NXltL0F6eXJoNkxNY2E3ZmZ5a1FadU1ybCtMUVpydURHTjRpZE05?=
 =?utf-8?B?Sm52cXREb0xrVVNjSTFIZHJWYVBXUGpYSElGWGhDSEJkL2pvUnFvZktLNTd2?=
 =?utf-8?B?ZlBTV3liaEpwRFY2cHFtcGgrbUFYK2g4RzZ3UEI0SXQ3WjNjMEFCcFR2TC8x?=
 =?utf-8?B?OU5KVTlVems4ZEJjMWttQnRrcmZWM3E3Wlk2QkpIcEUvY29hNzE4Nk5nUXBP?=
 =?utf-8?B?UmFuaTV4dXBuUVR4TU0rUzRjdk05aFVXSG8wREVYNnc2NGN3b2hHUEg1UlE0?=
 =?utf-8?B?enBqZm5WZE5XNHh0UE5wU0dNdld2bnkxMHhqN1pxNkhUNjBESXhaakdsK1JD?=
 =?utf-8?B?Qjd1VkQyUmg1blVDYWlzN3ZycERnNW1zV2IzdGJ5MnRhNnR0SW1uUjdSeGY0?=
 =?utf-8?B?czlqOFhqejBxK1A5MmlydVlHaFRaWVZpVkxOVU5pekNLTXZ0M0NOaDZxQjFy?=
 =?utf-8?B?djRJRTFUWVdvUnVsVGlnN2VSazJ4dWdIdGp2RkdWRW9xRllsSk8zN3lob0Vl?=
 =?utf-8?B?WTI2TmJaSmtUeDdzcUNGU2szcFVESDU4UDJSTnVjNHNxeE0zTEVQUmd0bmJQ?=
 =?utf-8?B?YkJvRi9pQ1VSMm5kY0JVQWQrckV1TE5kWFlpK2hZRUNWbmlxdENxUE5OL1lG?=
 =?utf-8?B?S0taL2hvcHpDbVczUytKTWZnL05OS1EzeE5nY0U0Rmg2M29lYVRicUlSUnly?=
 =?utf-8?B?NzhjeTV3dzZESFFGUkJIWXZMV0VNY21taUNQcjZYUEg4MUg0ZnZxd0Zta3RW?=
 =?utf-8?B?eFNHTXBiVWJZYU9wc1ZpWnZVOSt2cWNMSXc4REVQUG92Sm9jL0V3NlhEb3N0?=
 =?utf-8?B?dS82S1k5elV0dER1cVRyZk9PQUdobllrN3NGOStJbDRZMnBYc0kyQkZrLzNp?=
 =?utf-8?B?WUVRMExmK2s3andNQVl4RXBjNGFDWjhvZTV5V0gzamdpeVBsTk5xSXNrMHNK?=
 =?utf-8?B?eC9jSHFvamYvdXRseVp4VWtSY2tVOC9aWVU0bnNZait2Z0gwOGR6UXU0Zmhj?=
 =?utf-8?B?dW9sYVJ3a0U5TFV1Y2x0WlJ0TG00VTYrWXRPbGdjU2FBdDlQeHNEcHhpZVVH?=
 =?utf-8?B?Mnd4TXlPWU15cmxWUWk5Uzc2Yk1GSWRqSmNmL24xVEdlaTBXbnRLbGNHcncy?=
 =?utf-8?B?Zys4ZmFMSmNLdWx0aFhQSm5mZnpoT3hhQWRuaTdOL3E2R2h1RHhPUjRINWo3?=
 =?utf-8?B?TXkzNFlzeHJMazJnTElkQjBBbXA2bUNRbmlhL0MzV3l6c3RWVjlRM3NFTTIx?=
 =?utf-8?B?UTRVU3Q2RUxGUEpXQk51cXd1QnR0L3VBRVF5SGtqc29yRk1Tc0xJQXBaWUxa?=
 =?utf-8?B?UXBEcW9rR1B6akxWeTMwN3dDWGNSY2tHOUlXRldqcVFMUXFXcEwvOWVGVHFG?=
 =?utf-8?B?ZldCMmFQdmZMNGxPK0ZtSXJGbW04SHBvMHhydC80T0tpcmFHdUNIcjdhODVQ?=
 =?utf-8?B?NjFjaEhYUXZEeEdZTElGY2t4MU9SVWNiaWhkdlM3UGtaM1BTbHQvSHZSZEps?=
 =?utf-8?B?OURpRDJkdGtBdXZpbVBsVHd5RlZlZ3VGRFJtUGliUU9RUC83dmc0bVQ4NVhx?=
 =?utf-8?B?Q0l4eTJPOVdNenJQZEM1Rzk3RmJzRVZVNUVjTmlxdWNlenFnb0xrOFp3amNL?=
 =?utf-8?B?b0RhM1VLOVJJWE43Y1R3dW5NVGdIczdFTDdqa3RWcVB1VW90c3p4alpyUXor?=
 =?utf-8?B?L3BOalpYY01Sc2JaTi9yZGtiOGd6bXVyZHZrTElPQnJwNzJTU2ZHVHhHQzJD?=
 =?utf-8?B?aDNXems0TVNxZ3JYN3A5dXFwWCs0MnBTL0I4TmpPWC9ZR3FUanJNblZMOGdo?=
 =?utf-8?B?RUk0VW5EdFlEV0FWRnEwS3Y2cVJyalo2K0xHMU9KOThMVEVyRFhZcHk4aDNB?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6253.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a39f75-2bbe-4684-41f3-08db1fa91d0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 07:45:40.0217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r3njzUDo30AWAXBMZpZhT5MeOqJ8uW5Cl/gwu7suLEAOcUYKCxQjP+CMh67uGY2CytAtJTPJZPySXGTLBoJuCnwtQjB15VECymjCZ/1ImR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6385
X-Proofpoint-GUID: F0JQ0qxOQieVTls9xu_l7qvvUkgci3dF
X-Proofpoint-ORIG-GUID: F0JQ0qxOQieVTls9xu_l7qvvUkgci3dF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_02,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303080066
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gU2VudDogTWl0dHdvY2gsIDgu
IE3DpHJ6IDIwMjMgMDg6NDANCj4gVG86IEhlbm5lcmljaCwgTWljaGFlbCA8TWljaGFlbC5IZW5u
ZXJpY2hAYW5hbG9nLmNvbT47IExlZSBKb25lcw0KPiA8bGVlQGtlcm5lbC5vcmc+OyBEYW5pZWwg
VGhvbXBzb24gPGRhbmllbC50aG9tcHNvbkBsaW5hcm8ub3JnPjsgSmluZ29vDQo+IEhhbiA8amlu
Z29vaGFuMUBnbWFpbC5jb20+OyBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+DQo+IENjOiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGtlcm5lbEBwZW5ndXRyb25peC5kZQ0KPiBTdWJqZWN0OiBbUEFUQ0ggMDIvMTNdIGJh
Y2tsaWdodDogYWRwNTUyMF9ibDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUNCj4gY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQNCj4gDQo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxh
dGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzIG1hbnkNCj4gZHJpdmVyIGF1
dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZyBi
eSByZXR1cm5pbmcNCj4gYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFsdWUgcmV0dXJuZWQg
aXMgKG1vc3RseSkgaWdub3JlZCBhbmQgdGhpcw0KPiB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNv
dXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEgcXVlc3QgdG8gbWFrZQ0KPiB0
aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlz
IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZQ0KPiBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9uZXcoKSB3aGlj
aCBhbHJlYWR5IHJldHVybnMgdm9pZC4NCj4gDQo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJp
dmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUgY2FsbGJhY2sNCj4g
dG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQpBY2tlZC1i
eTogTWljaGFlbCBIZW5uZXJpY2ggPG1pY2hhZWwuaGVubmVyaWNoQGFuYWxvZy5jb20+DQoNCj4g
LS0tDQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA1NTIwX2JsLmMgfCA2ICsrLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA1NTIwX2JsLmMNCj4gYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA1NTIwX2JsLmMNCj4gaW5kZXggNjg2OTg4YzNkZjNh
Li44ZTBlOWNmZTVmZTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2Fk
cDU1MjBfYmwuYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9hZHA1NTIwX2JsLmMN
Cj4gQEAgLTMzNyw3ICszMzcsNyBAQCBzdGF0aWMgaW50IGFkcDU1MjBfYmxfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gIAlyZXR1cm4gMDsNCj4gIH0NCj4gDQo+IC1z
dGF0aWMgaW50IGFkcDU1MjBfYmxfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ICtzdGF0aWMgdm9pZCBhZHA1NTIwX2JsX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKHBkZXYpOw0KPiAgCXN0cnVjdCBhZHA1NTIwX2JsICpkYXRhID0gYmxfZ2V0
X2RhdGEoYmwpOyBAQCAtMzQ3LDggKzM0Nyw2IEBADQo+IHN0YXRpYyBpbnQgYWRwNTUyMF9ibF9y
ZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlpZiAoZGF0YS0+cGRhdGEt
PmVuX2FtYmxfc2VucykNCj4gIAkJc3lzZnNfcmVtb3ZlX2dyb3VwKCZibC0+ZGV2LmtvYmosDQo+
ICAJCQkJJmFkcDU1MjBfYmxfYXR0cl9ncm91cCk7DQo+IC0NCj4gLQlyZXR1cm4gMDsNCj4gIH0N
Cj4gDQo+ICAjaWZkZWYgQ09ORklHX1BNX1NMRUVQDQo+IEBAIC0zNzcsNyArMzc1LDcgQEAgc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgYWRwNTUyMF9ibF9kcml2ZXIgPSB7DQo+ICAJCS5w
bQk9ICZhZHA1NTIwX2JsX3BtX29wcywNCj4gIAl9LA0KPiAgCS5wcm9iZQkJPSBhZHA1NTIwX2Js
X3Byb2JlLA0KPiAtCS5yZW1vdmUJCT0gYWRwNTUyMF9ibF9yZW1vdmUsDQo+ICsJLnJlbW92ZV9u
ZXcJPSBhZHA1NTIwX2JsX3JlbW92ZSwNCj4gIH07DQo+IA0KPiAgbW9kdWxlX3BsYXRmb3JtX2Ry
aXZlcihhZHA1NTIwX2JsX2RyaXZlcik7DQo+IC0tDQo+IDIuMzkuMQ0KDQo=
