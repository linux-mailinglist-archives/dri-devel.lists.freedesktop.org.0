Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838A17FD663
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 13:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF1C10E4EF;
	Wed, 29 Nov 2023 12:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193010E537
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 12:15:46 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AT7fUjB007239; Wed, 29 Nov 2023 12:15:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=Ul9VKydK2OVhnbzOY/oexsmbapoKjR5qwnOApJMk0zg=; b=
 YmGB8XZTaWxrxG55tbU7HQyi59g87nQM0n7rGd8EkeVmSWHcCYZ26FqHr+ToINUQ
 7QMmdUzK5vg8gkPoy3EPc1rkEnl3+tEznNMDSft1WMQCXtb09SCDJ7oZPsd8RU/u
 NAAZ4oHTt0AtNr4bDzZRZkHZWMlodWoBHy+KuuIto6kGZQ2CG6E+zgDC5YjBYFBW
 k7cMEQx5nIUPcY8KRIiHQ6fqHTaZIYfmQqk7qJ/6t5SKg87ZKe4ib/CNIB5Mtjo+
 6dXsTex4BTrSaUhdjtBJiTZNfOes7+qFxHW3jD4LhWbNZfCHS/Kvbb5bYOST891K
 t//x3W8oUe3VPdUz01qhPQ==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1r9kv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 12:15:34 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 12:15:33 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 12:15:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtnTtppPvip2KB7KS5mt6XEwNRn1oqaLu4E8spc00zOJLIqG4zxNtGJZ1AvI7e0hKOJcSFDdIfMV0IwLmOIDHg6J6+BkYekD6pKdxCR5iUBJ2ws8n7KLT0tZ2guL0rqop/CqyIBj86Le9CCEqecxxRII+PHGrIX0tEZAjSjGkv4ikLihPGLA4YP/GR3zsJlaJeN55GQOO6Mw3QT4oj1ZErCykUQ5dEbCT657FUBucgcjfM128ZUBPrzEPvitCvRAh5G4w7DA/N8LpTylgA4RblubLNFzuyCFzKTgv0ZbBpIgT7ktFfE4+9dlJTzRM17gCZy/m1GuV3BxeNnAoODjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ul9VKydK2OVhnbzOY/oexsmbapoKjR5qwnOApJMk0zg=;
 b=XZTdgXx/ssPRapGFpL+Btezq4vGZMFJVDHT7hoflujfTiMEhi1ylp0PPbXga6LVAIYgOeqf5/H0LjBdgtYAgeSmIi77tRTRAe3mkAYbdPC0kaKQNvLvOw+0PUJiXDMadZDWrYr8AvCuSto0m2w5hQxtqqGBBaVt74+js9p6BdcsdLUou22hseqGCfy9toTzL8fb0stscNx1Iru8eYfOHthH8I11sKnOEZEmcKUOHTDDPmCIJXXzYJ4xvhnimVDXVl1lusb7bcTpMExHNGYWjlZIUaFJNBU0VgMGoRskCdAq5gR2n6cwBsAI+cOsB00Ad/b6VqpHTKFMOaR5IoFGgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ul9VKydK2OVhnbzOY/oexsmbapoKjR5qwnOApJMk0zg=;
 b=IvMRbbpoAnd3racvChQruHsfbgDSkNspmSyW4syTTCHjF2nddGdnn4kTrnW/8tZr+pQzC2ei2xD6XR+mEs+pAhZfU7IcY4sl60PnolstyPwy+8N2lpxJ6O+9439pltafN+WIok0W2EuTbENOel+OMcfpsOspMIQM8SEnwvklHYI=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LOYP265MB1856.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 12:15:31 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:15:31 +0000
From: Donald Robson <Donald.Robson@imgtec.com>
To: Frank Binns <Frank.Binns@imgtec.com>, Matt Coster <Matt.Coster@imgtec.com>,
 "arnd@kernel.org" <arnd@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>
Subject: Re: [EXTERNAL] Re: [PATCH 2/2] drm/imagination: avoid -Woverflow
 warning
Thread-Topic: [EXTERNAL] Re: [PATCH 2/2] drm/imagination: avoid -Woverflow
 warning
Thread-Index: AQHaIrikzvgR69X/lUCB5pDnjiHAwbCRMhYAgAAA/oCAAAL4gA==
Date: Wed, 29 Nov 2023 12:15:31 +0000
Message-ID: <0ff259983bd8ae6edc434b3375bfea871aa8ed65.camel@imgtec.com>
References: <20231129113825.2961913-1-arnd@kernel.org>
 <20231129113825.2961913-2-arnd@kernel.org>
 <9df9e4f87727399928c068dbbf614c9895ae15f9.camel@imgtec.com>
 <d4d42b22-076b-4980-aa43-d5458a094873@app.fastmail.com>
In-Reply-To: <d4d42b22-076b-4980-aa43-d5458a094873@app.fastmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWLP265MB5770:EE_|LOYP265MB1856:EE_
x-ms-office365-filtering-correlation-id: 11cb3377-1ab1-4415-6d48-08dbf0d4e1ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fnxhMgFaY2Ui3wfzoyFLhIjK62kNSmTY6D/qaPOuRjSP8BALbUkv2DOuNlofmvoKLjb+4LeuH1AaeGkDFoFW5F1ibQNhZYteRtLWfh5IgVprB/gzBbG1XVMc00yQ9fC7lFQ2eDnXfOKFI/C+zoo0udaDdoZxPCfGTUwFmSGwA5d/ma/q7vCg8hRj/PCFCa1BlMYbRUqbfRl7Mzv0hdrRl2Qb9Xa0/+NytIZ52AJc5hdcDdTrluqiKimwwKTGLkGAZX3Ane2hgI+dOOT8Qc2vkGdLvTQxlnpWFadUk9GVzgmgdIq+hRURAhja83wZDF1nvMJLIDqxER87AN+nLeQ/Q1b3zwWNcCCVvzqFqkVqbrHYXL/HxENEcnKlMeiv2Ul+wIGpQ9ABw5VRAr9WtaeL1ehTWEnnPnVHYILp/J4KXivSY79l/K/fN4xlhhykMhKJYHuEIGLT+NweavlD6YSrAMPkvQXLQFmlGNkLaR3gZMwQ2i6awlMTRO44HpTE1Q/4R13ieMdNlanGYUWdx3/WIIK8qzPvhJfIrqmgEnZzilmJXaWCFi+JYlRKDLSeCFi7GY2QaT/6Db6wjpMbYrIYkffvfsFdvbMp/1+Qp0wvwr96JibHZof3gIcfgh2F4sWOgENXg19OtXaTe88hLOS0jyfCDO6D2Q8ONz2tVk9M7NQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39850400004)(396003)(366004)(346002)(136003)(230173577357003)(230922051799003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(2616005)(6512007)(26005)(38100700002)(122000001)(4001150100001)(2906002)(83380400001)(38070700009)(6506007)(71200400001)(6486002)(478600001)(66946007)(91956017)(110136005)(54906003)(66446008)(76116006)(66556008)(66476007)(8676002)(4326008)(8936002)(5660300002)(86362001)(316002)(64756008)(4744005)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkpwKzRVQjV0K2JHUUtoWWVLbFFkVllRMGwxdDVuMUxQaUxRZTZ3YjM4K2lN?=
 =?utf-8?B?RkNaZFQ5MHFJdnBVKys4d0RhNFpqeitoUjVEZGhxVUczTk9RQkZQc2dVVHJL?=
 =?utf-8?B?TjdNRkpVNlpCRzdQaDQ3L2UyQjJOTWphQWZwOG5EQWt1Rk5MTmV0YWYwR25q?=
 =?utf-8?B?TEQ1UUkxRDlidnlBN3lOV1QvQUhRZml6RnFWc2V0RGNkbGU0QUUyT1h2bE0w?=
 =?utf-8?B?dlE4QUtIbjZta2I4a0NIbFFLODBtclc0RG0yUitIdDF4ZkU3amNQMWVzUlFz?=
 =?utf-8?B?VncwVEQzdmFyd0hYU2luR3ZpL3F2UCsxODlXZTRoNDR4YXVBRW9vU3FXYXg4?=
 =?utf-8?B?aGlLdzN5bWVJR2VscXF4WjJpeTJVdENEK2g1dUt0bk1iTkJzcEkzVHFBTC9Y?=
 =?utf-8?B?UEx3UDM1WThtODlDTndKY2xzS0d5TFM3K2EvVVBiQzVwcTZDblRNbFB6cTJL?=
 =?utf-8?B?WXNWcDFKMWZod20weE9VZ1NQYzBhK3IzR3kwTWtnZW41eFRpWkxqemJ3eG5J?=
 =?utf-8?B?RUN2OHpJby9jb2kwR2VFU2ZCdGF4bmdhWVNzYzFXYnlmTVN3K0cyRTlybzBl?=
 =?utf-8?B?dkVKQ3hQQk5qNUtQRFE5Y0hjcXIvVHdvaFA0dGVndWcyenVHb01GZHhXSTY4?=
 =?utf-8?B?N2Jqcis3N3NlZkIyME1NMTM3WFNNOVVoYlZnODZqV1R5aFdYRHFCQS9KNjNC?=
 =?utf-8?B?T2hSVk11ajhvM2RkR0hvZkJERXhsZE5Vb2M1bXBXVDRBQkcva0VweENTeTBX?=
 =?utf-8?B?L3NmN3FqbHFHSzNiekhKazJGMzkvZ0hRcThBa3JxaExlSTZTVHdQK2lia1pl?=
 =?utf-8?B?Tm00aWNkZ0Npa1FEKzNVMVdzYk9FVkw4RVhVL2JjTEx1STFTYjJKcFp0WWJX?=
 =?utf-8?B?LzIvTmwrb2pqTXgzZ0pQMElxVENLWFBjYWRFSWRncFEzQTZNOXdQNEpQT0tO?=
 =?utf-8?B?SkRNUHIzU0dYd25qbGpaNm1NdXFNeFBzaDJxK0FLWlgrRDl5NnlJTmJtakZ0?=
 =?utf-8?B?UE40Z1o0dGFhM24vVUczeDBPRWF4Skx0dEZWK0JYaFYxeVJrTUEwVTQ2RHhD?=
 =?utf-8?B?NmRkQWtEODlJRWgxUEp4TEVrdURaV0pMdlRiRjRXbkk5eW5ON0ZPYkdzMjJv?=
 =?utf-8?B?YkhkdHRoMjcrZW1rbEY5cGVla0xTVXZTb09FOXU4RnFlUmdkNVV3OVBiaHlU?=
 =?utf-8?B?S2k4dHJRNGt4QjFOeWUydm80WmorLzJHZG80MHlYYStrUHo3UFRZM01qNXdS?=
 =?utf-8?B?N2V2YjBtUUdvTkc5MDRGbTRHeHVlUlBYQnREalZud1VPNEhFbXB0UkZtR1FX?=
 =?utf-8?B?K2krcWsrWUpidk9WTWFpTUpWWEtaWENpTmd2UVU0Mjl1SEtUWXFTczFqaGZs?=
 =?utf-8?B?YjdvMVh0QWdLb2N2R2Myc0o3eFRXU3pxZC9kWlM1STJ5ZThpbWlyMlVNYW45?=
 =?utf-8?B?YW54d2dEVXhMT0JKMCswY25zcldXbjJHdHFqSnlkNlBwaTFIMS9mNkNaK2hQ?=
 =?utf-8?B?Wkp6WkRxRGIwWVhoeFdUdXllek5ad3J2N05aeWFmeFVUdjJnSVRQTE9IeDVP?=
 =?utf-8?B?ekdHVHFnOWJLdnYwR3lpankrZlB2NHBBRjRtNVM2Nk1keTJRaUF6UHpoZk5E?=
 =?utf-8?B?aVN2UFY1ajFidXFONDFYdStTVFE0SjdIODhNUnFoT242Z2VvSWxlTUNTOHQ3?=
 =?utf-8?B?alRJYmF1MnVBUzVHSUQxUWRVODdHOUplT25wQldSV1RuRzdBdnRzRmZnM1Rm?=
 =?utf-8?B?STZUbHppOW9MMlg3L3hOZDV5UTdIVUIxcEF6SFdxRXpwWGJzT2Z3Y0R6T1Bv?=
 =?utf-8?B?a0NRTmhBbkZVeTM0cXZUdGtML0ZrUlhqTFVKYlpaR2FLT0lQZHRISkxhVXFG?=
 =?utf-8?B?bGU2OVA2RGZxL2ZPVEFhWVdhZGRQa2hIUFdMU2xYWWVwVUtPMVVXMWNIeHZh?=
 =?utf-8?B?Y1lhT1FvaU0wOXR3cjhNZlJLSWhjb2pSR0F6dTlIelRZTFZHb1pUaGwwR2Y5?=
 =?utf-8?B?cUhobUg4UERFY1J4eVc5SnFUVnlKQzBjT2NFUVc4VWVWQWxJMi9RK0hTcHFN?=
 =?utf-8?B?MkNYZWtGK3lqSEJNN0xBa3RIRlpydmpBWlVTaHZ2UlMwK3NQLzJHYVA5MDlW?=
 =?utf-8?B?RXk4UlR6V2Z6bmNmVUVuU29OUnoyNElUWXRETk15cFhOMVpBeGxoZjVpZUc3?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <895730616104A340BB764C0B32ED84FE@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cb3377-1ab1-4415-6d48-08dbf0d4e1ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 12:15:31.6664 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Gp0FWQS1Vl6KhKlp/a4UyXGNy5rC0nb4L+N24pEWiV08d8Ksu9tbo/Eav2CO0DYwSwPmegTwE5JJUada7dtWsc/KQdSf2BSNihHyXUjTpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1856
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 392AGHMM0s-x8ACSEF4D6toMLjBogcVD
X-Proofpoint-GUID: 392AGHMM0s-x8ACSEF4D6toMLjBogcVD
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
Cc: Sarah Walker <Sarah.Walker@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTI5IGF0IDEzOjA0ICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOg0K
PiAqKiogQ0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVzIGZyb20gYSBzb3VyY2Ugbm90IGtu
b3duIHRvIEltYWdpbmF0aW9uIFRlY2hub2xvZ2llcy4gVGhpbmsgYmVmb3JlIHlvdSBjbGljayBh
IGxpbmsgb3Igb3BlbiBhbiBhdHRhY2htZW50ICoqKg0KPiANCj4gT24gV2VkLCBOb3YgMjksIDIw
MjMsIGF0IDEzOjAxLCBEb25hbGQgUm9ic29uIHdyb3RlOg0KPiA+IEhlbGxvIEFybmQsDQo+ID4g
DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guICBJJ20gc2xpZ2h0bHkgY29uY2VybmVkIHRoYXQg
d2UndmUgbm90IHNlZW4gdGhpcyANCj4gPiB3YXJuaW5nIHdoZW4NCj4gPiBidWlsZGluZyBoZXJl
LiAgSSBndWVzcyB3ZSBuZWVkIHRvIGNoZWNrIG91ciBDSSBzZXR0aW5ncy4uLg0KPiA+IA0KPiA+
IFJldmlld2VkLWJ5OiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29uQGltZ3RlYy5jb20+DQo+
IA0KPiBUaGlzIHdhcyBwcmV2aW91c2x5IGVuYWJsZWQgb25seSB3aGVuIGJ1aWxkaW5nIHdpdGgg
ZWl0aGVyDQo+ICJtYWtlIFc9MSIgb3IgIm1ha2UgQz0xIiwgYnV0IG5vdCB0aGUgZGVmYXVsdCBi
dWlsZCwgd2hpY2gNCj4gZXhwbGFpbnMgd2h5IGl0IG9ubHkgc2hvd2VkIHVwIGFmdGVyIHRoZSBt
ZXJnZSBpbnRvIGxpbnV4LW5leHQNCj4gdGhhdCBoYXMgdGhlIGNvcnJlc3BvbmRpbmcgc2NyaXB0
cy9NYWtlZmlsZS5leHRyYXdhcm4gY2hhbmdlLg0KPiANCj4gSXQgd291bGQgc3RpbGwgYmUgYSBn
b29kIGlkZWEgdG8gYWRkIHRoZSBleHRyYSBjb21waWxlciAoVz0xKQ0KPiBhbmQgc3BhcnNlIChD
PTEpIHdhcm5pbmdzIGluIHlvdXIgQ0kgc3lzdGVtIGFuZCBhZGRyZXNzIGFsbA0KPiBvdGhlciBp
c3N1ZXMgdGhhdCBtaWdodCB1bmNvdmVyLg0KPiANCj4gICAgICAgQXJuZA0KDQpUaGFua3MgQXJu
ZCwgd2Ugd2lsbCBkbyB0aGlzLg0K
