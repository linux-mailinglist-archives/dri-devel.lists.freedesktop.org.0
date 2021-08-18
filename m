Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA103F0A65
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 19:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D116E88B;
	Wed, 18 Aug 2021 17:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1669 seconds by postgrey-1.36 at gabe;
 Wed, 18 Aug 2021 12:45:48 UTC
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FC46E5A0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 12:45:47 +0000 (UTC)
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17I8FD81017008;
 Wed, 18 Aug 2021 08:17:55 -0400
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
 by mx0b-00128a01.pphosted.com with ESMTP id 3agg0sw9ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Aug 2021 08:17:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=coqqTzZveCUt3sHvcfz+yt1oQtsZWXRyS5nKctV3hL6EkBrM2Uw/+GYvXthfOwMTcZ1/gAPI0CD1UOfIFHDxmsrIbjTA627qKi115a6K46UuCNQarcv6MpSne60iZkW8mMogNfOuMyuEqsNQTggoONyxfYlGGz98zKaecM2Kn8JUCrmO0rM9+2PWRF7AXBabRvQBN0X3xHL+07ArbzeNGADrnnlyzbgqi+xU0wZKSI1OGSJ3WGu0mQAUqjnZ+e04lC7Fjw9XmfAz/2DyEqj2fBi7DC0Aru+a6bdFqOGHIJipyhfALXrjTg7v6DuXE7WkUbIPhgLUQJ0US9T6M7RDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrxgUzikM6du1sG47LmBhuhSMrYBXe+lqy0XAeHpW8Q=;
 b=ZcAf6yRRH6DfvyGtV3GsunwVPa+yXcncmSLkbYjSUmpetK+HbtN0dqLKqd7tfnTgSCLdzZathWXtjRfS7um3zeBiUCC8hhfpr3YOOHhztMX1opEdnn20VOaJKYx94D9uteooinbIKdmyDGcNN+Y05d09HruSoeA/75knz7D4jXOiMhRYVpITq11FNjPe4CBc/BzBq5Yx2enUHS1ABXYNog7k2XcTDOk1HYiMHKlJKRKrO8IJKYzbhFXVsqeyQzfRgcc/qbNPye8uZzd7i/ZaWa3Iz1xIcBnWZ07FlycNjXrrDJ6mM831EiMInB7iuJptKp02niTooTDU1QsfAvWNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrxgUzikM6du1sG47LmBhuhSMrYBXe+lqy0XAeHpW8Q=;
 b=6zu4bH3v9nVyOC4hRLAYCxIRw+0K5zvnJT2e8/fGLFc6SVu3pq0s5MuZiYQWs3d9YBjAi9rERpV8BjwXN5jKKjl4DS+S3494ppJFBVJ6/1JcddRujEnjqWATnOLofJWIQ5qY7TDPxQQwC950U6PF6AbprQoYSHeA7/o/aYUkAXE=
Received: from SJ0PR03MB6359.namprd03.prod.outlook.com (2603:10b6:a03:399::5)
 by BYAPR03MB4824.namprd03.prod.outlook.com (2603:10b6:a03:136::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 12:17:52 +0000
Received: from SJ0PR03MB6359.namprd03.prod.outlook.com
 ([fe80::a010:2cb7:9a3d:d930]) by SJ0PR03MB6359.namprd03.prod.outlook.com
 ([fe80::a010:2cb7:9a3d:d930%4]) with mapi id 15.20.4415.022; Wed, 18 Aug 2021
 12:17:52 +0000
From: "Sa, Nuno" <Nuno.Sa@analog.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Rob Clark <rob@ti.com>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: RE: [PATCH] dma-buf: return -EINVAL if dmabuf object is NULL
Thread-Topic: [PATCH] dma-buf: return -EINVAL if dmabuf object is NULL
Thread-Index: AQHXlCn8mzGVzHF6DkmWVLy/KuhAOat5LOrA
Date: Wed, 18 Aug 2021 12:17:52 +0000
Message-ID: <SJ0PR03MB6359C318092E0CB99D28D85099FF9@SJ0PR03MB6359.namprd03.prod.outlook.com>
References: <20210818115810.274084-1-nuno.sa@analog.com>
 <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
In-Reply-To: <9a63b45f-6fec-6269-ae16-8604b08514de@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE5HUTJZalU0WmpBdE1EQXhaUzB4TVdWakxUaGlPRGN0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEUmtObUkxT0dZeUxUQXdNV1V0TVRGbFl5MDRZ?=
 =?utf-8?B?amczTFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRnMk9T?=
 =?utf-8?B?SWdkRDBpTVRNeU56TTNOakkyTmprNU56RTNOelUySWlCb1BTSnBWWGsyYWsx?=
 =?utf-8?B?cVdXVlBTSFZOY0RVclRERmlkMlkwVG5Sa2VWVTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZKV1VSQlFVSTRNMDFOVUVzMVZGaEJZWG92UWxVeFEyWm5iamh5VURoR1ZG?=
 =?utf-8?B?VktLME5tZDBaQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
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
x-ms-office365-filtering-correlation-id: c5d5574d-6944-4f86-01d8-08d9624233c1
x-ms-traffictypediagnostic: BYAPR03MB4824:
x-microsoft-antispam-prvs: <BYAPR03MB4824D8A5EA8BA18435C0507E99FF9@BYAPR03MB4824.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w2VQCep1MAFGGRagz/V1kRM4PxEcZ0+xWgU3VhzAs1ftxWe7ejPTNGM9cL6qjJ7JfGpEs/l4w7TqHhkaXFppTp+XbhmuFP0ZE+fHm0NNSlR2sRa+9JZ0cF0SOV74yDbSDj684qL4quMpSYAgTX0eX2b6ZPg1RXNFvOuATt5SNTe/yCD9LTavOQIHov2b0ttNCDR33xXGBKwRGntEQnWBeH1a3wwTCnAJVW7i/l6vV/ERDbMRjzPsJ5qrBadhxVauD6CkkGmm6cLetp51wzxvijZWkJ0uyuj7Gkw5Ucra7xWDr2F7/cM6000UX3Ph/4CXFJuGWnkDuKg9ONvz7bS7Zr3nXyYu9++0FGck56qDvSMpqSfLtuCst+8HsboogvmL2jkQ/TISD9F881XbLAcN8q2+Ul3ezoJVW17J6tnVSo5priNLvHuR+L98DUCkJ0R50+MXzV4rd6Dn/duWtCUfaqCVVGSTnGqDSNfmntUTMKLqs7Hk1niH/+ZhEFdA2zqXs6gE5LSoeZpQs5ZxVH5TzBnssJeAnS/KGB79zm+TmGEbo13HixV2XujD0njYlKGiejNMNc0+UYBPMKtyoUrmMT7gzawowdyZ32maHFu7GKHTcFsHRTimwx2hVue/GChQPugWGRgvgXoDLGnFnaTNTQoq5Zjqiugdo4saMRR9A8iPyBFPmT8zx9cF929sFc2MB2WpHlHF4dv41SXDXV54GA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6359.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(4326008)(86362001)(83380400001)(52536014)(8676002)(9686003)(7696005)(66574015)(33656002)(8936002)(122000001)(110136005)(54906003)(38100700002)(55016002)(316002)(66556008)(2906002)(38070700005)(64756008)(76116006)(66476007)(66946007)(5660300002)(66446008)(478600001)(71200400001)(53546011)(6506007)(186003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sy9ESXBnVTR2QUhRVmN3bHBVSHAzNXNYKzVha0ZVVVVJNkVWRUcyMnJVMzFN?=
 =?utf-8?B?UEJxM1gvSFp6YmtIVHZIandWdlAyZzIwdmI1M3hRRFk1cmFRMUoxMGtNb09T?=
 =?utf-8?B?WmY2eWorV045cW1JbTFTSHMxcTNQM0dFRHVtaUlmT1F4cmIzMlNUSE1tYk1U?=
 =?utf-8?B?dzROS0pLSHMyeW5lN0t4bGszSkkwVFZvMCtYQ1krZ25vT3BsWjJiOWtBd1FF?=
 =?utf-8?B?Y0NVaVg1K1pubkhERmZaYWJ3U0ZQTi95MCtLRi9mMVJaTkI2VGFvRGVibGhO?=
 =?utf-8?B?VFMzdFpvaGJEYXVKa2M1RWRxMFNQQk1DdG1zT1hLckNzVExvRksybDRpNGI1?=
 =?utf-8?B?WlBoWGhOSTNjcjNxTGxscmpDM3NCSnpUaStOYnNFaTJVeHRzZG0xVVBmMWhT?=
 =?utf-8?B?c01XeTZ3ZzNhakUxYUdyZE8xVkFLaWxSTjlsTkluV0dIQXA4N3QwMjFTRktF?=
 =?utf-8?B?cEhkVGNWODhzYXNTR2hPM0VYOTkybjZrZXpPY3lFZ0RCVW83UjRHeUtBWFBO?=
 =?utf-8?B?T1hnS2laaHdzTjFZV3ZGRUVtRkVNcHJIM0MzeUFnYUNycmkzSHM0Q2VCSS9Q?=
 =?utf-8?B?WGowSHovSHo1cys1d215cno1ZERyTmZML3kxcjVleDdTbEI3clNWdE1zekl6?=
 =?utf-8?B?Mm9Db3d0ZndoMGxrTjVMb0xRZWpPYjgyT2RGZGJSU3V6WlVyalBIQmFpNlJ3?=
 =?utf-8?B?QU4xZzUyc3RHNEM2MUgzcGJaQnNSR1dhcjAyM2hSdjRWWWQ4WEM2VHU3SnJG?=
 =?utf-8?B?eFVMNU1MaGM4cEFlV0V2VDVNcWtqV1RaL2hCMWk3cm5NeDVmR1RKL3I1WG5I?=
 =?utf-8?B?QXBXT2ZkYWlNNUxkK2dPaE1aK21sRFRZRUtnb3hPWUNndWNVR2twTU1ERk9x?=
 =?utf-8?B?dVI2S3BCc0grQVdkVlNrTlNwaHJidzhiOGNCcHEzL2FSb2lpTTRRVE9UaEh6?=
 =?utf-8?B?UDRiRDlGN0ZYUnZOMy91Qi9DOVlWS2Z4TlQxNlY4UVZoWXNnTFhBd1pnK2pz?=
 =?utf-8?B?dzMzZ3dDaXF1ZjlEanh1WHNWRU12MHVrWTl2ZXA3TzBJejNlNm9OWEgwSFpk?=
 =?utf-8?B?U2tBWU9YTmxjQlFmdWlDY1VXZGZQaFlLK3ZvcG9SaUNNNjRiZGx5d2NDcGZh?=
 =?utf-8?B?d0l6SGdrWjVTd01aM21Hc2Y3M1Z1OFcvN1JIUjYwcmFHMHYwQ2NXU3lJbkZ6?=
 =?utf-8?B?RUdWcEtrQUlNa215TWJRVitNcmREZVlzY0Fic05FbjFOcitBZG1qWGhqSnlo?=
 =?utf-8?B?eHJ0VEUwTm9rdWM4V2ZQeVVXUU9XSjk2OVl6VnJCcG41aE5oOCsra0hTZkE3?=
 =?utf-8?B?OTFQUVZ5V2Z2ZDB5bEdFL2QyWDZMS253cTJsOFpUdWRqSzUxZm1qR3Y2YWo5?=
 =?utf-8?B?MEh4TXhrQXVzVHhYMEQraHBOTnllemVVQjdrbWFKMTEyVS8xUHlSRHNEdEl3?=
 =?utf-8?B?bmJzVkMxNmg2N3BvM3A2RnJaNGZUeXEzQnp0MjRsVlo3dDBEaDFlM2V2dzFD?=
 =?utf-8?B?bFhmT3laVEVrZjd6YklGSkU3TlJvaHJCVG1nVG9ySUwrS2ZkSHV3TTdCNlpu?=
 =?utf-8?B?VlZsM0p3NDVyb2xjdjg1WWlrajRnSVdvUHRxM011SCtES1ZKeGIzSDBNSkQr?=
 =?utf-8?B?SUZIOG9UTnZYUk1PR1JCajJCNldCZGlnTzIrRWlJTlpCcCtOdVQ5WndXeGJN?=
 =?utf-8?B?UFRFWTRWZW1ucHBzOUhKWEFPYUNTUmt3TStqVm9aMWEyYWQ3SWIyYUU4UlB4?=
 =?utf-8?Q?jbypHn3vqeQi5ETFD2MQhMjfz1ndS45GZypglZn?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6359.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d5574d-6944-4f86-01d8-08d9624233c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2021 12:17:52.3315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9lGa+hLH2hPmUbjxTBDuVh+14KaEdPlCsgHyw/MVnW76AX4HRQMOfQLOqQ+hzKzwhgsLRltYQSDJHkur37FeeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4824
X-Proofpoint-GUID: Bmm-il8n2IZzEF-PQ4SBVPKdyFTbQ1Lf
X-Proofpoint-ORIG-GUID: Bmm-il8n2IZzEF-PQ4SBVPKdyFTbQ1Lf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-18_04,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108180077
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

DQo+IEZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4g
U2VudDogV2VkbmVzZGF5LCBBdWd1c3QgMTgsIDIwMjEgMjoxMCBQTQ0KPiBUbzogU2EsIE51bm8g
PE51bm8uU2FAYW5hbG9nLmNvbT47IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZzsNCj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBSb2IgQ2xhcmsgPHJvYkB0aS5jb20+OyBTdW1pdCBTZW13YWwNCj4gPHN1bWl0
LnNlbXdhbEBsaW5hcm8ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkbWEtYnVmOiByZXR1
cm4gLUVJTlZBTCBpZiBkbWFidWYgb2JqZWN0IGlzDQo+IE5VTEwNCj4gDQo+IFtFeHRlcm5hbF0N
Cj4gDQo+IFRvIGJlIGhvbmVzdCBJIHRoaW5rIHRoZSBpZihXQVJOX09OKCFkbWFidWYpKSByZXR1
cm4gLUVJTlZBTA0KPiBoYW5kbGluZw0KPiBoZXJlIGlzIG1pc2xlYWRpbmcgaW4gdGhlIGZpcnN0
IHBsYWNlLg0KPiANCj4gUmV0dXJuaW5nIC1FSU5WQUwgb24gYSBoYXJkIGNvZGluZyBlcnJvciBp
cyBub3QgZ29vZCBwcmFjdGljZSBhbmQNCj4gc2hvdWxkDQo+IHByb2JhYmx5IGJlIHJlbW92ZWQg
ZnJvbSB0aGUgRE1BLWJ1ZiBzdWJzeXN0ZW0gaW4gZ2VuZXJhbC4NCg0KV291bGQgeW91IHNheSB0
byBqdXN0IHJldHVybiAwIHRoZW4/IEkgZG9uJ3QgdGhpbmsgdGhhdCBoYXZpbmcgdGhlDQpkZXJl
ZmVyZW5jZSBpcyBhbHNvIGdvb2QuLg0KDQpJIHVzZWQgLUVJTlZBTCB0byBiZSBjb2hlcmVudCB3
aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlLg0KDQotIE51bm8gU8OhDQoNCj4gQ2hyaXN0aWFuLg0K
PiANCj4gQW0gMTguMDguMjEgdW0gMTM6NTggc2NocmllYiBOdW5vIFPDoToNCj4gPiBPbiB0b3Ag
b2Ygd2FybmluZyBhYm91dCBhIE5VTEwgb2JqZWN0LCB3ZSBhbHNvIHdhbnQgdG8gcmV0dXJuIHdp
dGggYQ0KPiA+IHByb3BlciBlcnJvciBjb2RlIChhcyBkb25lIGluICdkbWFfYnVmX2JlZ2luX2Nw
dV9hY2Nlc3MoKScpLg0KPiBPdGhlcndpc2UsDQo+ID4gd2Ugd2lsbCBnZXQgYSBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UuDQo+ID4NCj4gPiBGaXhlczogZmMxMzAyMGUwODZiICgiZG1hLWJ1Zjog
YWRkIHN1cHBvcnQgZm9yIGtlcm5lbCBjcHUgYWNjZXNzIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBO
dW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYyB8IDMgKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtDQo+IGJ1Zi5jDQo+ID4gaW5kZXggNjNk
MzIyNjFiNjNmLi44ZWM3ODc2ZGQ1MjMgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4gPiBAQCAt
MTIzMSw3ICsxMjMxLDggQEAgaW50IGRtYV9idWZfZW5kX2NwdV9hY2Nlc3Moc3RydWN0DQo+IGRt
YV9idWYgKmRtYWJ1ZiwNCj4gPiAgIHsNCj4gPiAgIAlpbnQgcmV0ID0gMDsNCj4gPg0KPiA+IC0J
V0FSTl9PTighZG1hYnVmKTsNCj4gPiArCWlmIChXQVJOX09OKCFkbWFidWYpKQ0KPiA+ICsJCXJl
dHVybiAtRUlOVkFMOw0KPiA+DQo+ID4gICAJbWlnaHRfbG9jaygmZG1hYnVmLT5yZXN2LT5sb2Nr
LmJhc2UpOw0KPiA+DQoNCg==
