Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762373F0A63
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E046E866;
	Wed, 18 Aug 2021 17:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3C6E5AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:13:46 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17I80UIT023964;
 Wed, 18 Aug 2021 09:13:42 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by mx0a-00128a01.pphosted.com with ESMTP id 3ag9e6g1nj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 09:13:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JGWBPnRRzogC9fQKlafxEwlgyumYZOD2Rcb/JxGQlBE31LD/thceCXv5y6B5SiUaw10sUd8E3t6D5uTZVB9t4hWQR3xWIb5NN8cwtv90/4vb+YJ2IRXNALCitqhOjorGWRBM6+Bm0jXFSaPwKht8adnIddwLtcgabc10jDMR1nyacYKO37DowskLr/Dhu/1znUx1OKBfUeNjzJDCZb7QN5PbulhH/fIs7YFceoXYqpWf0a/UQSj+hG+j+/6s9vC2Nyxvtzwn0vxS4nJ+5WtoRmFbV3F9FpbO1LQaJA2sUb0tSG3TfSKj7ni4Zw0K5QrKP7tqSuR5Vh1am3jB0lmgwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qpNJKWiR9Ho5U/mNb6beKPoABR0T09eVvLJ5AuyZW4=;
 b=Z36Oag81OoYRXXRggtAj/pZgvkCGN+Y6AJ9xILd93U6NBz8ztaZlY9Jjg06PutFux2+5dwO261gZq5Tvgudt8s+6FEzkek9AyNYx48sVGYkLbEZJiOH3/2XU48acqhp/IPacufzJXjFq5E1vDxkrFIyiITAdLGynqi+S17EUzGBHiXEBzbTdrxf9uPSEGMiwG8KpFTODoyqCTuDfW0gCvgWF4+x9OKcFqCkcOI8bnrZNGXTP7U+1P340brGRvuFggM0BYMr0iIE/4cpkHXtHUTatAFvhE5qznWRH5uHYl9WTuOIg5UV3MmlAd6Ux+PcBgnOAHoymekHEAFMpk1hhtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qpNJKWiR9Ho5U/mNb6beKPoABR0T09eVvLJ5AuyZW4=;
 b=06ioc/i0zON8aNu4tIwCurJk2dZPi3Tige6jegR6WIFa4s53bmocbrt2lSdd2moZ2gDLmkviVEuIEFkxlAbeZW5G5pZ5BuP6pGZLk9SLzR/1rk68xetdAm6LyLoKne0UXVhdsov0yC5GYlZdp3ktjBaKZONMfY/soSwnbsLq8SE=
Received: from SJ0PR03MB6359.namprd03.prod.outlook.com (2603:10b6:a03:399::5)
 by BYAPR03MB3525.namprd03.prod.outlook.com (2603:10b6:a02:ab::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 13:13:40 +0000
Received: from SJ0PR03MB6359.namprd03.prod.outlook.com
 ([fe80::a010:2cb7:9a3d:d930]) by SJ0PR03MB6359.namprd03.prod.outlook.com
 ([fe80::a010:2cb7:9a3d:d930%4]) with mapi id 15.20.4415.022; Wed, 18 Aug 2021
 13:13:40 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Rob Clark
 <rob@ti.com>
Subject: RE: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
Thread-Topic: [Linaro-mm-sig] [PATCH] dma-buf: return -EINVAL if dmabuf object
 is NULL
Thread-Index: AQHXlCn8mzGVzHF6DkmWVLy/KuhAOat5LOrAgAAEtwCAAAQ4AIAAAx8AgAACfmA=
Date: Wed, 18 Aug 2021 13:13:40 +0000
Message-ID: <SJ0PR03MB6359BBEC317B7DD637C9509A99FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
 <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
 <ed0bf7fd-de49-f94a-3eda-0c1fac50153a@amd.com>
 <YR0BMCMFcwXLjNAe@phenom.ffwll.local>
 <74802a7d-9105-006f-bcd8-3bbf97035704@amd.com>
In-Reply-To: <74802a7d-9105-006f-bcd8-3bbf97035704@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE1UZzROREkzT0RJdE1EQXlOaTB4TVdWakxUaGlPRGN0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhERTRPRFF5TnpnekxUQXdNall0TVRGbFl5MDRZ?=
 =?utf-8?B?amczTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTmpnd01T?=
 =?utf-8?B?SWdkRDBpTVRNeU56TTNOall3TVRjek1EYzJPVFl5SWlCb1BTSndhSEpDZDBa?=
 =?utf-8?B?dFdsVlRMMGcwTm5KeWRFOURRMmhwUkd0TE9XYzlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZKV1VSQlFVUnBlV1UzWVUxd1ZGaEJaazFaWTI5UkwxUk9TMEk0ZUdoNWFF?=
 =?utf-8?B?UTVUVEJ2UlVaQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkJWMEYzUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVUpQV1VkalowRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlNqUkJRVUZDYUVGSVNVRmhVVUpv?=
 =?utf-8?B?UVVZNFFWcEJRbkJCUjAxQlpFRkNjRUZIT0VGaVowSm9RVWhKUVdWUlFtWkJT?=
 =?utf-8?B?RkZCWVZGQ2JFRklTVUZOVVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVVZCUVVGQlFVRkJRVUZCWjBGQlFVRkJRVzVuUVVGQlIw?=
 =?utf-8?B?VkJZMmRDY0VGSFJVRllkMEpyUVVkclFWbDNRakJCUjJ0QlluZENkVUZIUlVG?=
 =?utf-8?B?alowSTFRVVk0UVdSQlFuQkJSMVZCWTJkQmVVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGUlFVRkJRVUZCUVVGQlEwRkJRVUZC?=
 =?utf-8?B?UVVFOUlpOCtQQzl0WlhSaFBnPT0=?=
x-dg-rorf: true
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1141740-7cd3-4738-7d64-08d96249ff31
x-ms-traffictypediagnostic: BYAPR03MB3525:
x-microsoft-antispam-prvs: <BYAPR03MB352505BAD15B9C3B1C06DE6C99FF9@BYAPR03MB3525.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:284;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7mmuranP0VMzQr9MFDVIhhhABFp+nIxPNRcRxr9w4m4JB8O/XDveKcfakeVjbeoHvCeFJLdpmcGgm+6bFUtLxJujt3te03UWmC19AB2xUUVv4OO1kvANp5xRL4LjO6TXFNQudTqh6NvsfalY2/hqc0RqAm2OdvjZevbtZyHNTEnwxSSefSNA5INZY11X4v5A8qrlS3aHNMzbv7FcPhWxYBDBIG208SThCpz14rKTrXZyiiaRDDA7d1zWKIARv7bzuxEGlYl5l/PjfL8ASBFo+7xhxW3dj9dLgoLLso+C9u4CowD8rjX0tXT6tSDqdc+SJkXIY3isIqfJu8Yxe3RdY8XhKDEj1xCF+4++l3pdpnbiLaLCGMNSwTwoIdp7LHRz1sZfyL7IFW6A9HEWkRKG42gXConoD+mTOjA9+Ty41KKLB+rVK816JHHzcGWAT6qXnXLMFarmHuV67LPQ6LD5XuuNFNkfSRowSR19JqcmL2iFABH9nxd7rFFAtWz7LXqD9fGsPiXCyL5yWuroX1sXYKbPnT8gct8RTsOaQwVMQbPqYOzRZAqCXQIfj0a7QDBMvACVtt8dgKtdHkskynLAPPnSrqpUBFu2R8b33mno7YoLfGYmbIKjoq5zL8nc/hPt5Vfl1TuqDzGG+JqPeCKgrY0yebkihLw4Go6J7vGZmfyen8l/sVSM5PkuAXaei+3g3H9tdf30ZzCqs/A0bH3UftPw2kubESU5Z4ddgY06V/dX+liOmi9xU2/ep9LS3hLeiereu70IMoUPZnA3MJW9rXtaGZ8v1BXtjQKPUmX7Fpk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6359.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(86362001)(66556008)(38070700005)(2906002)(83380400001)(26005)(66946007)(186003)(66446008)(64756008)(76116006)(66476007)(71200400001)(54906003)(66574015)(53546011)(19627235002)(6506007)(8676002)(8936002)(478600001)(316002)(5660300002)(38100700002)(33656002)(122000001)(52536014)(9686003)(4326008)(45080400002)(7696005)(110136005)(966005)(55016002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RnhPbGFRajNRWk1oSmNPQ3F4cjMzMG13V21jVGJ3VmZiZkpBeU9yRXNlSlRS?=
 =?utf-8?B?eTU5cWRFd3ljMnBHNzl2VjY4YzRHQm9ld1Zxd0dvaW5haUVRMjFrSUlab2RQ?=
 =?utf-8?B?YnNsSWZJZXhqcFl1UUtpRGIvKzVRUU9aeGpVQ1RvVnpWWThiVFU1OE1XWWtl?=
 =?utf-8?B?WXAyRVpBNitadEpSRXZwcWdTTUJuYUpjTkNRd3ZlK0NyWGFqbGQ3b09iaDBK?=
 =?utf-8?B?amhWem5GczRpR1ZmbVVPakthdXU5d1hwMWVmWnNCNGYxTmV6OHZNUEllWGxw?=
 =?utf-8?B?b0VSKzBmMGZvL25PaElEY1VwenRTMlczSkgrVnM5UE94ekZLNnVMNjNzOUNk?=
 =?utf-8?B?MDBaN1U2VkVOUkRraVRMQUtEUEoyeTYxSzRsSG5TL2xUY0YrcHUrQ1BjcjNL?=
 =?utf-8?B?OVFDcTRWWlcybDBaZ1ZYM3doVEdxUmVLcmRTRWM0c3djc09tUC8wdTFjaUVD?=
 =?utf-8?B?c3ZIWTNKWkxDdVJJZXUzYVpuTlJaVHNpSytReGhEWDM3Z0NrOXkvSjY1YnRD?=
 =?utf-8?B?bkVVL2RnRm5IOWYxMjVnUVp5UUcxOTZYMHhMZmxlOWJnWnlLSTdKYzRvaXRp?=
 =?utf-8?B?TXFVelRqRklpU0xFU0IvcnZKMXBrZWJJeEI4MEZLaUZSRFQ4VEVXV2hRa2pk?=
 =?utf-8?B?VENGdzZwSWdRZ05rWTJRandMaGJJSURodVh4d3EwQ1NncG43VVkxbTRZTnJE?=
 =?utf-8?B?djFtK0cvcnprWmFRUXJiY3ROSmIxNnA4cVhubmYzdmRIVzhCMGpmRnZkbm83?=
 =?utf-8?B?VHJKNExTakJXc0oyRGtkZFArY2daSHdYOEVNMksxMVh0VklxaFZOdWkwWlA3?=
 =?utf-8?B?K3RNSjd6cWd5N2YwV2Q0NlRENTNlb1MvbWVXY2RvRDlDL3hSZWFUenFGejds?=
 =?utf-8?B?UTN1cng5aDJUMG90MXZaZm9ldnBnNnRUMldrUm40c0ZkbjdBOUEzVXE2a2wv?=
 =?utf-8?B?TEE4YnlvTGhLQlR5MXNnRDJUSFNjY0RnVDV5b1c4bVZKWC9NdG9kQURmTFhX?=
 =?utf-8?B?QndZMnRSRHJTR1NmVmhLUUJrN2c4Y29xZU5YOW5jb1Y1dCtpRjU2ekZZeGYx?=
 =?utf-8?B?bCt3bWxOS016MWVNUnkrTDNhYkRySVBOK2duMDNyN25ZRTdQQ2E1QjZkUXdw?=
 =?utf-8?B?YmE2YlFRUUtuM3l3Y2RiMVlQV211cU5CaFhLR0phTjgyeE9lTytPSzNEaDZP?=
 =?utf-8?B?dDdKM1N0dEdZS0pPWTdGd0FDblVaeTZaRG5DcmorNVNldExjRTk4bHRaWldL?=
 =?utf-8?B?aGxlSG1VOE5lSkR0MEZ2S2VHVWttSDZGOElhcm8wT1lhT1c3VTgvclhKMDRo?=
 =?utf-8?B?WG16ZWtiR0FNZnhVeGhYZmFKNVpSYy96dSt4L25lclFoUUI4SVY0SHVZVENx?=
 =?utf-8?B?RjFjL2FRRFBJWXFBUTY0OTB6UjZEUFlDdG5EWUtiZ3NkZjc4ZGZIeUtjcFNs?=
 =?utf-8?B?eW9BUWFGT3NWTTNWYjhyZEdpeERDNmRPU0tmRVlqL2E4Rk9lRFV5dEErNTJS?=
 =?utf-8?B?djFLQjMvYXd3VG8wd0RuSFFSOWRSa1huTWk2am5rejdYUzZTSU05QTA2MlRY?=
 =?utf-8?B?Z1hlSjRQL25TODhZWUxEV05tWGljZlFDUWpWU2gxS1ZGTU9HSVlaUWNVakJN?=
 =?utf-8?B?RWRiNHpGTXhyUVR1UmhJekQwL0NyOXNwZWxMYU9KbFdwV0orN1I5VUx4Sm5X?=
 =?utf-8?B?S1VlVUJQM3pMQ3BhOHVoSkdGK3dzWDRBYVgvVTJFczZHZkpnSlFXcFA0ZFZO?=
 =?utf-8?Q?DQ+k9ar/HIzbEhQ/Ck3Gx6udkumRgu93uVWWy/a?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6359.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1141740-7cd3-4738-7d64-08d96249ff31
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 13:13:40.1421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NJ/ZBosdgtTExvQz7tLfd+U/cc1PzimLefSThvYSwdhyuR+39fx/CTLGVHZ4RvoS9eKXcRDpOHytLG9hhkTtkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3525
X-Proofpoint-GUID: 9HXTBe6SMbFHP56lOSNpcqR5XPxQ5fOP
X-Proofpoint-ORIG-GUID: 9HXTBe6SMbFHP56lOSNpcqR5XPxQ5fOP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_04,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108180083
X-Mailman-Approved-At: Wed, 18 Aug 2021 17:40:22 +0000
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

PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgQXVndXN0IDE4LCAyMDIxIDI6NTggUE0NCj4gVG86IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IFNhLCBOdW5vIDxOdW5vLlNhQGFuYWxvZy5jb20+
OyBsaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmc7DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgUm9iDQo+IENsYXJrIDxy
b2JAdGkuY29tPg0KPiBTdWJqZWN0OiBSZTogW0xpbmFyby1tbS1zaWddIFtQQVRDSF0gZG1hLWJ1
ZjogcmV0dXJuIC1FSU5WQUwgaWYNCj4gZG1hYnVmIG9iamVjdCBpcyBOVUxMDQo+IA0KPiBbRXh0
ZXJuYWxdDQo+IA0KPiBBbSAxOC4wOC4yMSB1bSAxNDo0NiBzY2hyaWViIERhbmllbCBWZXR0ZXI6
DQo+ID4gT24gV2VkLCBBdWcgMTgsIDIwMjEgYXQgMDI6MzE6MzRQTSArMDIwMCwgQ2hyaXN0aWFu
IEvDtm5pZyB3cm90ZToNCj4gPj4gQW0gMTguMDguMjEgdW0gMTQ6MTcgc2NocmllYiBTYSwgTnVu
bzoNCj4gPj4+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQo+ID4+Pj4gU2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTgsIDIwMjEgMjoxMCBQTQ0KPiA+
Pj4+IFRvOiBTYSwgTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPjsgbGluYXJvLW1tLQ0KPiBzaWdA
bGlzdHMubGluYXJvLm9yZzsNCj4gPj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4+PiBDYzogUm9iIENsYXJrIDxyb2JA
dGkuY29tPjsgU3VtaXQgU2Vtd2FsDQo+ID4+Pj4gPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0K
PiA+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRtYS1idWY6IHJldHVybiAtRUlOVkFMIGlmIGRt
YWJ1ZiBvYmplY3QNCj4gaXMNCj4gPj4+PiBOVUxMDQo+ID4+Pj4NCj4gPj4+PiBbRXh0ZXJuYWxd
DQo+ID4+Pj4NCj4gPj4+PiBUbyBiZSBob25lc3QgSSB0aGluayB0aGUgaWYoV0FSTl9PTighZG1h
YnVmKSkgcmV0dXJuIC1FSU5WQUwNCj4gPj4+PiBoYW5kbGluZw0KPiA+Pj4+IGhlcmUgaXMgbWlz
bGVhZGluZyBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+ID4+Pj4NCj4gPj4+PiBSZXR1cm5pbmcgLUVJ
TlZBTCBvbiBhIGhhcmQgY29kaW5nIGVycm9yIGlzIG5vdCBnb29kIHByYWN0aWNlIGFuZA0KPiA+
Pj4+IHNob3VsZA0KPiA+Pj4+IHByb2JhYmx5IGJlIHJlbW92ZWQgZnJvbSB0aGUgRE1BLWJ1ZiBz
dWJzeXN0ZW0gaW4gZ2VuZXJhbC4NCj4gPj4+IFdvdWxkIHlvdSBzYXkgdG8ganVzdCByZXR1cm4g
MCB0aGVuPyBJIGRvbid0IHRoaW5rIHRoYXQgaGF2aW5nIHRoZQ0KPiA+Pj4gZGVyZWZlcmVuY2Ug
aXMgYWxzbyBnb29kLi4NCj4gPj4gTm8sIGp1c3QgcnVuIGludG8gdGhlIGRlcmVmZXJlbmNlLg0K
PiA+Pg0KPiA+PiBQYXNzaW5nIE5VTEwgYXMgdGhlIGNvcmUgb2JqZWN0IHlvdSBhcmUgd29ya2lu
ZyBvbiBpcyBhIGhhcmQgY29kaW5nDQo+IGVycm9yDQo+ID4+IGFuZCBub3Qgc29tZXRoaW5nIHdl
IHNob3VsZCBidWJibGUgdXAgYXMgcmVjb3ZlcmFibGUgZXJyb3IuDQo+ID4+DQo+ID4+PiBJIHVz
ZWQgLUVJTlZBTCB0byBiZSBjb2hlcmVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlLg0KPiA+
PiBJIHJhdGhlciBzdWdnZXN0IHRvIHJlbW92ZSB0aGUgY2hlY2sgZWxzZXdoZXJlIGFzIHdlbGwu
DQo+ID4gSXQncyBhIGxvdCBtb3JlIGNvbXBsaWNhdGVkLCBhbmQgV0FSTl9PTiArIGJhaWwgb3V0
IGlzIHJhdGhlcg0KPiA+IHdlbGwtZXN0YWJsaXNoZWQgY29kZS1wYXR0ZXJuLiBUaGVyZSdzIGJl
ZW4gcGxlbnR5IG9mIGRpc2N1c3Npb25zIGluDQo+IHRoZQ0KPiA+IHBhc3QgdGhhdCBhIEJVR19P
TiBpcyBoYXJtZnVsIHNpbmNlIGl0IG1ha2VzIGRlYnVnZ2luZyBhIG1ham9yDQo+IHBhaW4sIGUu
Zy4NCj4gPg0KPiA+DQo+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGwNCj4gb29rLmNvbS8/dXJsPWh0dHBzKjNBKjJGKjJG
bG9yZS5rZXJuZWwub3JnKjJGbGttbCoyRkNBKjJCNTVhRncNCj4geU5UTHVaZ09XTVRSdWFiV29i
RjI3eWdza3V4dkZkLVAwbi0NCj4gM1VOVCozRDBPZyo0MG1haWwuZ21haWwuY29tKjJGJmFtcDtk
YXRhPTA0KjdDMDEqN0NjaHJpc3RpYW4uaw0KPiBvZW5pZyo0MGFtZC5jb20qN0MxOWY1M2UyYTJk
MTg0M2I2NWFkYzA4ZDk2MjQ2M2I3OCo3QzNkZDg5Ng0KPiAxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCo3QzAqN0MwKjdDNjM3NjQ4ODc2MDc2NjEzMjMzKjdDVQ0KPiBua25vd24qN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMDQo+IENKQlRpSTZJazFo
YVd3aUxDSlhWQ0k2TW4wKjNEKjdDMTAwMCZhbXA7c2RhdGE9YWp5Qm5qZVBSYWszDQo+IG83T2Jw
QkF1Sk5kMDhIZ2tBTk05QyoyQmd6T0FlSHJNayozRCZhbXA7cmVzZXJ2ZWQ9MF9fO0oNCj4gU1Vs
SlNVbEpTVWxKU1VsSlNVbEpTVWxKU1VsSlNVISFBM05pOENTMHkyWSFxaURlZ3g0c3ZQVU1acnZu
elVvDQo+IFg3Vkt2dkZwRGNlZEg5Z1liUkNpV2ZlX04zZnc0enBtQTU0cXhlZnZNaVEkDQo+ID4N
Cj4gPiBUaGVyZSdzIGFsc28gYSBjaGVja3BhdGNoIGNoZWNrIGZvciB0aGlzLg0KPiA+DQo+ID4g
Y29tbWl0IDlkM2UzYzcwNWViMzk1NTI4ZmQ4ZjE3MjA4Yzg3NTgxYjEzNGRhNDgNCj4gPiBBdXRo
b3I6IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+DQo+ID4gRGF0ZTogICBXZWQgU2VwIDkg
MTU6Mzc6MjcgMjAxNSAtMDcwMA0KPiA+DQo+ID4gICAgICBjaGVja3BhdGNoOiBhZGQgd2Fybmlu
ZyBvbiBCVUcvQlVHX09OIHVzZQ0KPiA+DQo+ID4gQW55b25lIHdobyBpcyBwYXJhbm9pZCBhYm91
dCBzZWN1cml0eSBjcmFzaGVzIHRoZWlyIG1hY2hpbmUgb24gYW55DQo+IFdBUk5JTkcNCj4gPiBh
bnl3YXkgKGxpa2Ugc3l6a2FsbGVyIGRvZXMpLg0KPiA+DQo+ID4gTXkgcnVsZSBvZiB0aHVtYiBp
cyB0aGF0IGlmIHRoZSBXQVJOX09OICsgYmFpbC1vdXQgY29kZSBpcyBqdXN0IGFuIGlmDQo+ID4g
KFdBUk5fT04oKSkgcmV0dXJuOyB0aGVuIGl0J3MgZmluZSwgaWYgaXQncyBtb3JlIHRoZW4gQlVH
X09OIGlzIHRoZQ0KPiBiZXR0ZXINCj4gPiBjaG9pY2UgcGVyaGFwcy4NCj4gPg0KPiA+IEkgdGhp
bmsgdGhlIHdvcnN0IGNob2ljZSBpcyBqdXN0IHJlbW92aW5nIGFsbCB0aGVzZSBjaGVja3MsIGJl
Y2F1c2UgYQ0KPiBmZXcNCj4gPiBjb2RlIHJlb3JncyBsYXRlciB5b3UgbWlnaHQgbm90IE9vcHMg
aW1tZWRpYXRlbHkgYWZ0ZXJ3YXJkcw0KPiBhbnltb3JlLCBhbmQNCj4gPiB0aGVuIHdlJ2xsIG1l
cmdlIHBvdGVudGlhbGx5IHZlcnkgYnVzdGVkIG5ldyBjb2RlLiBXaGljaCBpcyBubw0KPiBnb29k
Lg0KPiANCj4gV2VsbCBCVUdfT04oc29tZV9jb2RpdGlvbikgaXMgYSBkaWZmZXJlbnQgcHJvYmxl
bSB3aGljaCBJIGFncmVlIG9uDQo+IHdpdGgNCj4gTGludXMgdGhhdCB0aGlzIGlzIHByb2JsZW1h
dGljLg0KPiANCj4gQnV0ICJpZiAoV0FSTl9PTighZG1hYnVmKSkgcmV0dXJuIC1FSU5WQUw7IiBp
cyByZWFsbHkgYmFkIGNvZGluZw0KPiBzdHlsZQ0KPiBhcyB3ZWxsIHNpbmNlIGl0IGhpZGVzIHJl
YWwgcHJvYmxlbXMgd2hpY2ggYXJlIGhhcmQgZXJyb3JzIGJlaGluZA0KPiB3YXJuaW5ncy4NCg0K
SSBhZ3JlZSB0aGF0IGRvaW5nIHRoZXNlIGtpbmQgb2YgY2hlY2tzIGluIHRoZSBjb3JlIG9iamVj
dCBvZiBhbiBBUEkgaXMNCmFidXNpbmcgcGFyYW1ldGVyICJ2YWxpZGF0aW9uIi4gSSBndWVzcyBh
IGdvb2QgcGF0dGVybiBpcyBoYXZpbmcgdGhlDQp3YXJuaW5nIGFuZCBsZXQgdGhlIGNvZGUgZmxv
dy4gQnV0IHNpbmNlIHRoZXNlIGNoZWNrcyBhcmUgYWxyZWFkeSBhbGwNCm92ZXIgdGhlIHBsYWNl
IEknbSBub3Qgc3VyZSB0aGUgd2F5IHRvIGdvLiBJJ20gdmVyeSBuZXcgdG8gZG1hLWJ1Zg0KYW5k
IEkgd2FzIGp1c3QgY2hlY2tpbmcgdGhlIGNvZGUgYW5kIHNhdyB0aGlzIHdhcyBub3QgYmUgY29o
ZXJlbnQgd2l0aA0KdGhlIHJlc3Qgb2YgdGhlIEFQSSBzbyBJIHRob3VnaHQgaXQgd291bGQgYmUg
YSBzdHJhaWdodCBlYXN5IHBhdGNoLi4uIFdlbGwsDQpJIGNvdWxkIG5vdCBiZSBtb3JlIHdyb25n
IDopDQoNCkFueXdheXMsIGRlcGVuZGluZyBvbiB3aGF0J3MgZGVjaWRlZCwgSSBjYW4gc2VuZCBh
bm90aGVyIHBhdGNoIHRyeWluZw0KdG8gbWFrZSB0aGVzZSBzdHVmZiBtb3JlIGNvaGVyZW50LiBB
dCB0aGlzIHBvaW50LCBteSBmZWVsaW5nIGlzIHRoYXQgdGhpcw0KcGF0Y2ggaXMgdG8gYmUgZHJv
cHBlZC4uLiANCg0KLSBOdW5vIFPDoQ0KDQo+IFJldHVybmluZyAtRUlOVkFMIGluZGljYXRlcyBh
IHJlY292ZXJhYmxlIGVycm9yIHdoaWNoIGlzIHVzdWFsbHkgY2F1c2VkDQo+IGJ5IHVzZXJzcGFj
ZSBnaXZpbmcgaW52YWxpZCBwYXJhbWV0ZXJzIGFuZCBzaG91bGQgbmV2ZXIgYmUgYWJ1c2VkIHRv
DQo+IGluZGljYXRlIGEgZHJpdmVyIGNvZGluZyBlcnJvci4NCj4gDQo+IEZ1bmN0aW9ucyBhcmUg
ZWl0aGVyIGludGVuZGVkIHRvIHRha2UgTlVMTCBhcyB2YWxpZCBwYXJhbWV0ZXIsIGUuZy4gbGlr
ZQ0KPiBrZnJlZShOVUxMKS4gT3IgdGhleSBhcmUgaW50ZW5kZWQgdG8gd29yayBvbiBhbiBvYmpl
Y3Qgd2hpY2ggaXMNCj4gbWFuZGF0b3J5IHRvIHByb3ZpZGUuDQo+IA0KPiBDaHJpc3RpYW4uDQo+
IA0KPiA+IC1EYW5pZWwNCj4gPg0KPiA+DQo+ID4NCj4gPj4gQ2hyaXN0aWFuLg0KPiA+Pg0KPiA+
Pj4gLSBOdW5vIFPDoQ0KPiA+Pj4NCj4gPj4+PiBDaHJpc3RpYW4uDQo+ID4+Pj4NCj4gPj4+PiBB
bSAxOC4wOC4yMSB1bSAxMzo1OCBzY2hyaWViIE51bm8gU8OhOg0KPiA+Pj4+PiBPbiB0b3Agb2Yg
d2FybmluZyBhYm91dCBhIE5VTEwgb2JqZWN0LCB3ZSBhbHNvIHdhbnQgdG8gcmV0dXJuDQo+IHdp
dGggYQ0KPiA+Pj4+PiBwcm9wZXIgZXJyb3IgY29kZSAoYXMgZG9uZSBpbiAnZG1hX2J1Zl9iZWdp
bl9jcHVfYWNjZXNzKCknKS4NCj4gPj4+PiBPdGhlcndpc2UsDQo+ID4+Pj4+IHdlIHdpbGwgZ2V0
IGEgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBGaXhlczogZmMx
MzAyMGUwODZiICgiZG1hLWJ1ZjogYWRkIHN1cHBvcnQgZm9yIGtlcm5lbCBjcHUNCj4gYWNjZXNz
IikNCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4N
Cj4gPj4+Pj4gLS0tDQo+ID4+Pj4+ICAgICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMyAr
Ky0NCj4gPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gPj4+Pj4NCj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
YnVmLmMgYi9kcml2ZXJzL2RtYS0NCj4gYnVmL2RtYS0NCj4gPj4+PiBidWYuYw0KPiA+Pj4+PiBp
bmRleCA2M2QzMjI2MWI2M2YuLjhlYzc4NzZkZDUyMyAxMDA2NDQNCj4gPj4+Pj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYw0KPiA+Pj4+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1h
LWJ1Zi5jDQo+ID4+Pj4+IEBAIC0xMjMxLDcgKzEyMzEsOCBAQCBpbnQgZG1hX2J1Zl9lbmRfY3B1
X2FjY2VzcyhzdHJ1Y3QNCj4gPj4+PiBkbWFfYnVmICpkbWFidWYsDQo+ID4+Pj4+ICAgICB7DQo+
ID4+Pj4+ICAgICAJaW50IHJldCA9IDA7DQo+ID4+Pj4+DQo+ID4+Pj4+IC0JV0FSTl9PTighZG1h
YnVmKTsNCj4gPj4+Pj4gKwlpZiAoV0FSTl9PTighZG1hYnVmKSkNCj4gPj4+Pj4gKwkJcmV0dXJu
IC1FSU5WQUw7DQo+ID4+Pj4+DQo+ID4+Pj4+ICAgICAJbWlnaHRfbG9jaygmZG1hYnVmLT5yZXN2
LT5sb2NrLmJhc2UpOw0KPiA+Pj4+Pg0KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXw0KPiA+PiBMaW5hcm8tbW0tc2lnIG1haWxpbmcgbGlzdA0KPiA+
PiBMaW5hcm8tbW0tc2lnQGxpc3RzLmxpbmFyby5vcmcNCj4gPj4NCj4gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bA0KPiBv
b2suY29tLz91cmw9aHR0cHMqM0EqMkYqMkZsaXN0cy5saW5hcm8ub3JnKjJGbWFpbG1hbioyRmxp
c3RpbmZvKjINCj4gRmxpbmFyby1tbS0NCj4gc2lnJmFtcDtkYXRhPTA0KjdDMDEqN0NjaHJpc3Rp
YW4ua29lbmlnKjQwYW1kLmNvbSo3QzE5ZjUzZTJhMg0KPiBkMTg0M2I2NWFkYzA4ZDk2MjQ2M2I3
OCo3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkKg0KPiA3QzAqN0MwKjdDNjM3NjQ4
ODc2MDc2NjEzMjMzKjdDVW5rbm93bio3Q1RXRnBiR1pzYjNkOGV5Sg0KPiBXSWpvaU1DNHdMakF3
TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjANCj4gKjNEKjdD
MTAwMCZhbXA7c2RhdGE9MEU1TDRLaWQ1WlBlS1Q4VXh4N0s2MWZCWG1JNFRPc3oqMkY1SUwNCj4g
c0ZwTEIqMkZvKjNEJmFtcDtyZXNlcnZlZD0wX187SlNVbEpTVWxKU1VsSlNVbEpTVWxKU1VsSlNV
bCEhQTNODQo+IGk4Q1MweTJZIXFpRGVneDRzdlBVTVpydm56VW9YN1ZLdnZGcERjZWRIOWdZYlJD
aVdmZV9OM2Z3NHoNCj4gcG1BNTRvUXN0elNOQSQNCg0K
