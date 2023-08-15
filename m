Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED577CC4D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 14:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A110E0F7;
	Tue, 15 Aug 2023 12:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8664210E0F7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Aug 2023 12:06:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37F6HrA1010417; Tue, 15 Aug 2023 13:06:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=BIR6au6h5uXB2jK5ChRzAMLTcx46p9YZ0r2TkDCqUyw=; b=
 t9CbfM9wrFWXvZTjSJuV9ysI0Alg/sFLFao/vZ6me/ZSrmGfDkYwEcXAYyhPZJ7l
 lDwzaLE+wYCQPk1073+HpElFo8RqVS5zbeHKAON5z2rx4i7HPH36phYRX0At24Iu
 0i2STDOtFbVGBgUhwHVey3DUgPQ0103pcJ8cMYFn90wmIpnCdamZuodqg6M/QyVo
 h/n1eeyyU4e0R4dKOkbv/wat4wBQWL4ZorDaPh5QkDnFUTirybpHZaOFrJBCzMm6
 acXG85BPyRfg7ht4QVMWNLYvNNP/ZQ/iZ5ju+PhpFJ6V3A4bussoS9nMQwxT55HO
 rBEMkvRNFBhdOmNzYJ0u4g==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3se0bra991-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Aug 2023 13:06:19 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 13:06:19 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.50) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Tue, 15 Aug 2023 13:06:19 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jczi9MajQEJTjDIin0wiNIG4GQACtIad5SMukuZykD8WVtsG1lxhy3t/CqLjm8QlmOXdkveeSLF3KwJhim4EIZKOA907t47+t4Wf8NAaHKXwQJvU0nVrtnH/Xka5CHDg9IssmH6iML1rfoKLMqPJKlFl9Lc65+2P5Seyp0+tCKuuALTFykvVbWkkSbF8JDruSvkAnn0iOj7Niw1TeJzRLmxKkMNU169Z75UsRwWePKgbcKFwix3iMywP8qhEGAJDDPIHB1RWZfBSgiLo1dkOAUM6J+W8nOSNNMzK7oH4syfLCaBJVz5mjLymNvZzBqo03Cv0lMD8exLTeGWCWf3QPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIR6au6h5uXB2jK5ChRzAMLTcx46p9YZ0r2TkDCqUyw=;
 b=W3u38ddkWBo0oyQg5ibvCixDqkDFu4fEjtq/7TEv020R7m5Cs8qIIyIue7vxtgQ+vxzPqDdLslvR13mFWWxR0dkWhouV46co9gYIhm6FBOJ8LO39uZDHHpHA+Cek0pCLlzI9SxrU4CbfRS1f1oim32YzS5pxTsKwg4qGatm1kUQ7lCrqTjGnpNRcPAwuXfM70796G4Zir6rUq3jfH1iYawzmlTrtqdPxquGeF8ElP3zyZrf8dYzjxOaD7QUtgdo+hThMHqFa5q2fKBZVMDXMeUJ+vqPLFZieFfIxB28YKRf39ad9ldjsywL+y71E8Nt4X3Bbz34WduHbOaq0VJCbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIR6au6h5uXB2jK5ChRzAMLTcx46p9YZ0r2TkDCqUyw=;
 b=ovvWblvsT6zAgwcKBnE3+3NpkDyxnkECmTdJn0FJn8E4NH8PGqN1AwNpEUr5GViZnF6WMD/59D8x8Y/lLL9q9A3RdU2lqCvX5bSe5Sxg9ZvjjersnzylljODQqEnzqmruY7punuoLYxVfslAbg2uZq/q55EwxtLyiALfKmZfylY=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWXP265MB5033.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:19a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 12:06:17 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::333e:39e5:2e63:a7a5]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::333e:39e5:2e63:a7a5%4]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 12:06:17 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "michel.daenzer@mailbox.org" <michel.daenzer@mailbox.org>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v4 03/17] drm/imagination/uapi: Add PowerVR driver UAPI
Thread-Topic: [PATCH v4 03/17] drm/imagination/uapi: Add PowerVR driver UAPI
Thread-Index: AQHZtl8aYZllYRdo6U27a6JSZXah16/gkKcAgArkYwA=
Date: Tue, 15 Aug 2023 12:06:17 +0000
Message-ID: <074a500ea2cd49c6107b87a9da86367d49a73722.camel@imgtec.com>
References: <20230714142543.111625-1-sarah.walker@imgtec.com>
 <dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org>
In-Reply-To: <dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWXP265MB5033:EE_
x-ms-office365-filtering-correlation-id: b72e996e-7d8e-45ee-438b-08db9d8807b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5eMSrDxg5RA75J1n70yxlIvxlKCe71gMvsb6EoL0ypm5PnIr033XU1ZT+5J58eHEnZzf19+behx31/BHUepbV5ien4KBBC51RFnOOv/gJwK98TS/Iv6Ww3GiyQBlUtCGGh8lfCYmmsylEhMhSsd46bpZOsXD5XhF7LrWHTixy2dhfQdBaPoYjPDSteDRiMb6HZ+r5fYgKUQrhi/vXkxQEr2JTIQJ83mna3qimOV6hpNZ+7LSfhroJtds/uza3RcenEHjVvVIaFjxC10gXBuazAt6mwMvfkCocavWn7XpLroYS+v1EaEbjvUMNiVrnOn1x66KckeAlUsNLmIsmlmECcZ/Uymjqvw0/9BK/qvgb5B+jEimgXvZB6b2HytNENXD0fd4EWPVKvdoDI/jvLW4CbCFSaI8B3DLjUdjrrQwefvEOZDLFDThnJ+kd7VEry3Hv2S0i1YQBYRblquCHNIccinzO2r9FesCNaUkRiOs7WvQrmibtxMLr30EvQn0H5i8+JtHxhWuAzFf8VooqvobYTnn6D0Qah/IQFuTvNRlxC6t1ITZ0v6WtihbszxFL6YtALmZRdvgfbjRMGjdxJW3xM6NPbQLuEiOx7doz2vD15o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230030)(39850400004)(366004)(136003)(346002)(396003)(376002)(1800799009)(186009)(451199023)(36756003)(7416002)(83380400001)(4326008)(86362001)(41300700001)(316002)(8676002)(2906002)(66446008)(110136005)(64756008)(6636002)(71200400001)(966005)(66946007)(54906003)(76116006)(478600001)(66476007)(5660300002)(122000001)(6506007)(26005)(53546011)(66556008)(2616005)(6512007)(6486002)(8936002)(38070700005)(38100700002)(66574015);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1o2MWc4OGx5RHNuUGMrYzlMaHJFSFFJUFQxVlE4a1RaQUl0Umd4OVRDb21J?=
 =?utf-8?B?cFFLaGNjMFF4OG9QbXBDWlVyNDQxUWNvL3VFZkVwd2dMQy9BNFZjazdhRWVw?=
 =?utf-8?B?c0JPYTNFWlQ4NUdEVkRPUlB1VWl2MEJpRzZTUkJwSy9tR0hHZUJBL2EySkF5?=
 =?utf-8?B?K244ck80blBjWXdCSGNjeGlzd0k2TGwxb0l2VzJzZEplUG1HU1Z5RThmTzVL?=
 =?utf-8?B?T0VlN0h5L0xvMHFFOVRrb1UxNk5wZHlLTzlXdmhlcFdYN1hSM0wxQTNRUFFz?=
 =?utf-8?B?VklkenBIbkRBV1F2NVoxU2c4TStEMHdJK3JML2JkWXhReTlwNXQwQUZrdjNh?=
 =?utf-8?B?Z1Ayamgydm5Hb29iYndLcjZTb1EzU1JNV0VEUWs1R3hCdVdIZ0RERlVwSkh3?=
 =?utf-8?B?TjFTVUZiMDYvTG9zMTIwWjc5dHp3V0ROYmRQQm9vMlNZaitzTGZUM2RENzVy?=
 =?utf-8?B?L2l4QytqdTRzaGlvc3c0NXlWU2NEdzVZNjVVajBTUzF4L0k5RW96blBCcFZC?=
 =?utf-8?B?ZXlvY2VxVU1GYTFVM3VEVWRoaWJZMUIwWCtyOEVLTVJTcjZvV2xzU2IyTTUx?=
 =?utf-8?B?cUdlME03WDBmcituSGR3eThsUVFQY3ZVd3pZRVZ0cDZPUnBuNE5pUTh0ejhC?=
 =?utf-8?B?NjZOTXRUMEJLWlh4cWhPSFcwQTEzRXBtdEFLRzh6ZkRvOHNocU5pUTRybHhV?=
 =?utf-8?B?dTBPak0zQk9EZEdNcGdpb2wzTVVycnpVRGE1OUpUa2hnMFpvMlJKMkkvbUxv?=
 =?utf-8?B?aWtqSlo3bGJ0V0xsaXE0eWh4bmFZelV1N3JJZS9XRXl5djRYU0NnSEE3bFFo?=
 =?utf-8?B?dnR1Rnd5dlAxOThWZFNod3VlUTdBQXFjd3N3ZG1FY1lEZVdFQTVlMmYrMksr?=
 =?utf-8?B?QTlXR0dGTWlkUGtkZ1JZRTBNMktYYWxtWmxuR1FzRnJhMHVLbzE5VGtQRDRV?=
 =?utf-8?B?UzNyZ3BKZFVMeTNGOEkyZlQ4TlhOM215Y3ZXUk1MZUljblNqSEFwN0FUcmZZ?=
 =?utf-8?B?Y1R3NVJBNStYa0NsWHI4K2FOVFdrQ0g0RjhFMHg5bFhWRTY4TFFRU2Z2VEpM?=
 =?utf-8?B?NkNwTDg5VXJhaUZ5MEVVMFBxZWdxT1pjRHB6b05jYWIzMXVQTTJGT3dja29s?=
 =?utf-8?B?S3dhOTlJdG9aWEhqUHVNTVhxYzhPZXdwVkU0ejNpdmQrcE9aZlV4U3JaMkhj?=
 =?utf-8?B?TEh4dFpoTUNsRXBjbkZJWlZGSW1zNHl2QVBnTlg1TW0rdzdUa0x6TythQTBY?=
 =?utf-8?B?UUNiUjZ2SGtWejVjbVZxMmdzM3VwN2VUR0ZjZlk3WlcvU0VBM29CUUYwcTUz?=
 =?utf-8?B?TWtjbGJZT2pUYlh5d2FMK2dTS2R0RFNuRXc2eW5EQnJLOVNlVElFdThJOFZz?=
 =?utf-8?B?Y0ZxMFpmek5LZWNTODg1YnpBN3hucXkrejlocUU3VzBVQUUra3dzT2M1cktI?=
 =?utf-8?B?R3U1V09tZHVlVXlwbVdDWnZiVmVFYkRvenNqMWhWWHBuUGhROGxGdnV3MlU0?=
 =?utf-8?B?TSt4djlMZUFYbzNCOUtsc3ZEdXRwclJ4ZisxRVMvZEo1K2hIcTJCVG44cHpE?=
 =?utf-8?B?SUN6NG9yVzUrMURZVUtmU3pvS1NCWXp6SXQrRU1TNGdQT1N5N1VJYWdkRnlj?=
 =?utf-8?B?TW1IM01SUVREVUZ3dC9zTWlTcFN6cDl0OEVWZUZVdzVRNnU0aEhtbjVhbVZk?=
 =?utf-8?B?QUtpbzg3NkU3UkVXbTh0M3RlYkMrYnl3MTIvYUdTZTUvVVlFRlVpRVhrMVNs?=
 =?utf-8?B?czlwQmVSeVF6ajB6RCtNL3JDZVBHbWx3TEZPM05LV1ptejB0QmlwN0Jma1Ay?=
 =?utf-8?B?WC9oZ3h3V2NsUTVIaUtpNUY4dW80bEswVlJNT3lsb2NDOG9UWERGMjAzOFdv?=
 =?utf-8?B?Q0pKZDA4RDZxMDJYbDRTVFZvTktHUWZXK2tmM29IemgrYUJKaGpjOG1wUlIr?=
 =?utf-8?B?UkIzaEdtdXdJYVVGczRsdEJLWllZM21jaEorRUZsY0NZYXh2ZklsTTBOL015?=
 =?utf-8?B?TnUxMFJvOWJmaGlvTDVNaXdrOTRFdVFUUjVKRm9ZMnhTb045NW9XRFlaRHNZ?=
 =?utf-8?B?ZXB0cnNrbEUybFNXSDVUQXRBdWJXNUlxTlk2T2dVK2o2Nm4xd2hteldpeWJ2?=
 =?utf-8?B?YUZhVEEvMnBoUG5zM3FkY1EzQXhqS05iZCtDZmxneU5IU0pWamVuTitMVUZ6?=
 =?utf-8?B?WEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F50D66A2A17D094D890E4D3C2A6CEF34@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b72e996e-7d8e-45ee-438b-08db9d8807b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 12:06:17.2911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/n6zF9TkhItrpuu1Bnb6S0xkblHr1NadRZNV2LrF/IHG4oPivSEHi3zLb+HM4dAvP08EbsyWl3i6MalY8jeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5033
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: XG0PxnqGt-bnCannsU9DikvDQKyXBGGw
X-Proofpoint-GUID: XG0PxnqGt-bnCannsU9DikvDQKyXBGGw
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
Cc: "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "hns@goldelico.com" <hns@goldelico.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "afd@ti.com" <afd@ti.com>, "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWljaGVsLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjayAoY29tbWVudHMgYmVsb3cp
Lg0KDQpPbiBUdWUsIDIwMjMtMDgtMDggYXQgMTU6NDYgKzAyMDAsIE1pY2hlbCBEw6RuemVyIHdy
b3RlOg0KPiBPbiA3LzE0LzIzIDE2OjI1LCBTYXJhaCBXYWxrZXIgd3JvdGU6DQo+ID4gKy8qKg0K
PiA+ICsgKiBET0M6IFBvd2VyVlIgSU9DVEwgQ1JFQVRFX0JPIGludGVyZmFjZQ0KPiA+ICsgKi8N
Cj4gPiArDQo+ID4gKy8qKg0KPiA+ICsgKiBET0M6IEZsYWdzIGZvciBDUkVBVEVfQk8NCj4gPiAr
ICoNCj4gPiArICogVGhlICZzdHJ1Y3QgZHJtX3B2cl9pb2N0bF9jcmVhdGVfYm9fYXJncy5mbGFn
cyBmaWVsZCBpcyA2NCBiaXRzIHdpZGUgYW5kIGNvbnNpc3RzDQo+ID4gKyAqIG9mIHRocmVlIGdy
b3VwcyBvZiBmbGFnczogY3JlYXRpb24sIGRldmljZSBtYXBwaW5nIGFuZCBDUFUgbWFwcGluZy4N
Cj4gPiArICoNCj4gPiArICogV2UgdXNlICJkZXZpY2UiIHRvIHJlZmVyIHRvIHRoZSBHUFUgaGVy
ZSBiZWNhdXNlIG9mIHRoZSBhbWJpZ3VpdHkgYmV0d2Vlbg0KPiA+ICsgKiBDUFUgYW5kIEdQVSBp
biBzb21lIGZvbnRzLg0KPiA+ICsgKg0KPiA+ICsgKiBDcmVhdGlvbiBvcHRpb25zDQo+ID4gKyAq
ICAgIFRoZXNlIHVzZSB0aGUgcHJlZml4IGBgRFJNX1BWUl9CT19DUkVBVEVfYGAuDQo+ID4gKyAq
DQo+ID4gKyAqICAgIDpaRVJPRUQ6IFJlcXVpcmUgdGhlIGFsbG9jYXRlZCBidWZmZXIgdG8gYmUg
emVyb2VkIGJlZm9yZSByZXR1cm5pbmcuIE5vdGUNCj4gPiArICogICAgICB0aGF0IHRoaXMgaXMg
YW4gYWN0aXZlIG9wZXJhdGlvbiwgYW5kIGlzIG5ldmVyIHplcm8gY29zdC4gVW5sZXNzIGl0IGlz
DQo+ID4gKyAqICAgICAgZXhwbGljaXRseSByZXF1aXJlZCwgdGhpcyBvcHRpb24gc2hvdWxkIG5v
dCBiZSBzZXQuDQo+IA0KPiBNYWtpbmcgdGhpcyBvcHRpb25hbCBpcyBraW5kIG9mIHByb2JsZW1h
dGljIGZyb20gYSBzZWN1cml0eSBzdGFuZHBvaW50IChpbmZvcm1hdGlvbiBsZWFrLCBhdCBsZWFz
dCBpZiB0aGUgbWVtb3J5IHdhcyBwcmV2aW91c2x5IHVzZWQgYnkgYSBkaWZmZXJlbnQgcHJvY2Vz
cykuIFNlZSBlLmcuIHRoZSBkaXNjdXNzaW9uIHN0YXJ0aW5nIGF0IGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9pc3N1ZXMvOTE4OSNub3RlXzE5NzI5ODYgLg0KPiAN
Cj4gQUZBSUNUIHRoZSBhcHByb2FjaCBJIHN1Z2dlc3RlZCB0aGVyZSAoQ2xlYXIgZnJlZWQgbWVt
b3J5IGluIHRoZSBiYWNrZ3JvdW5kLCBhbmQgbWFrZSBpdCBhdmFpbGFibGUgZm9yIGFsbG9jYXRp
b24gYWdhaW4gb25seSBvbmNlIHRoZSBjbGVhciBoYXMgZmluaXNoZWQpIGlzbid0IHJlYWxseSBw
b3NzaWJsZSB3aXRoIGdlbV9zaG1lbSBpbiBpdHMgY3VycmVudCBzdGF0ZSB0aG91Z2guIFRoZXJl
IHNlZW1zIHRvIGJlIG9uZ29pbmcgd29yayB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGF0IGZvciBf
X0dGUF9aRVJPIGluIGdlbmVyYWwsIG1heWJlIGdlbV9zaG1lbSBjb3VsZCB0YWtlIGFkdmFudGFn
ZSBvZiB0aGF0IHdoZW4gaXQgbGFuZHMuIEknbSBhZnJhaWQgdGhpcyBzZXJpZXMgY2FuJ3QgZGVw
ZW5kIG9uIHRoYXQgdGhvdWdoLg0KPiANCg0KR29vZCBwb2ludCEgV2UnbGwgcmVtb3ZlIHRoaXMg
ZmxhZyBhbmQgYWx3YXlzIHplcm8gdGhlIG1lbW9yeSBhdCBhbGxvY2F0aW9uDQp0aW1lLiBXZSBj
YW4gdGhlbiBsb29rIHRvIGRvIHNvbWV0aGluZyBiZXR0ZXIgaW4gdGhlIGZ1dHVyZSBvbmNlIHRo
ZSBkcml2ZXIgaXMNCm1lcmdlZC4NCg0KPiANCj4gPiArLyoqDQo+ID4gKyAqIERPQzogUG93ZXJW
UiBJT0NUTCBWTV9NQVAgYW5kIFZNX1VOTUFQIGludGVyZmFjZXMNCj4gPiArICoNCj4gPiArICog
VGhlIFZNIFVBUEkgYWxsb3dzIHVzZXJzcGFjZSB0byBjcmVhdGUgYnVmZmVyIG9iamVjdCBtYXBw
aW5ncyBpbiBHUFUgdmlydHVhbCBhZGRyZXNzIHNwYWNlLg0KPiA+ICsgKg0KPiA+ICsgKiBUaGUg
Y2xpZW50IGlzIHJlc3BvbnNpYmxlIGZvciBtYW5hZ2luZyBHUFUgYWRkcmVzcyBzcGFjZS4gSXQg
c2hvdWxkIGFsbG9jYXRlIG1hcHBpbmdzIHdpdGhpbg0KPiA+ICsgKiB0aGUgaGVhcHMgcmV0dXJu
ZWQgYnkgJURSTV9QVlJfREVWX1FVRVJZX0hFQVBfSU5GT19HRVQuDQo+ID4gKyAqDQo+ID4gKyAq
ICVEUk1fSU9DVExfUFZSX1ZNX01BUCBjcmVhdGVzIGEgbmV3IG1hcHBpbmcuIFRoZSBjbGllbnQg
cHJvdmlkZXMgdGhlIHRhcmdldCB2aXJ0dWFsIGFkZHJlc3MgZm9yDQo+ID4gKyAqIHRoZSBtYXBw
aW5nLiBTaXplIGFuZCBvZmZzZXQgd2l0aGluIHRoZSBtYXBwZWQgYnVmZmVyIG9iamVjdCBjYW4g
YmUgc3BlY2lmaWVkLCBzbyB0aGUgY2xpZW50IGNhbg0KPiA+ICsgKiBwYXJ0aWFsbHkgbWFwIGEg
YnVmZmVyLg0KPiA+ICsgKg0KPiA+ICsgKiAlRFJNX0lPQ1RMX1BWUl9WTV9VTk1BUCByZW1vdmVz
IGEgbWFwcGluZy4gVGhlIGVudGlyZSBtYXBwaW5nIHdpbGwgYmUgcmVtb3ZlZCBmcm9tIEdQVSBh
ZGRyZXNzDQo+ID4gKyAqIHNwYWNlLiBGb3IgdGhpcyByZWFzb24gb25seSB0aGUgc3RhcnQgYWRk
cmVzcyBpcyBwcm92aWRlZCBieSB0aGUgY2xpZW50Lg0KPiA+ICsgKi8NCj4gDQo+IEZXSVcsIHRo
ZSBhbWRncHUgZHJpdmVyIHVzZXMgYSBzaW5nbGUgaW9jdGwgZm9yIFZNIG1hcCAmIHVubWFwIChw
bHVzIHR3byBhZGRpdGlvbmFsIG9wZXJhdGlvbnMgZm9yIHBhcnRpYWwgcmVzaWRlbmN5KS4gTWF5
YmUgdGhpcyB3b3VsZCBtYWtlIHNlbnNlIGZvciB0aGUgUG93ZXJWUiBkcml2ZXIgYXMgd2VsbCwg
aW4gcGFydGljdWxhciBpZiBpdCBtaWdodCBzdXBwb3J0IHBhcnRpYWwgcmVzaWRlbmN5IGluIHRo
ZSBmdXR1cmUuDQo+IA0KPiAoYW1kZ3B1IGFsc28gdXNlcyBzaW1pbGFyIG11bHRpcGxleGVyIGlv
Y3RscyBmb3Igb3RoZXIgdGhpbmdzIHN1Y2ggYXMgY29udGV4dCBjcmVhdGUvZGVzdHJveS8uLi4p
DQo+IA0KPiBKdXN0IGFuIGlkZWEsIGZlZWwgZnJlZSB0byBpZ25vcmUuDQo+IA0KDQpXZSBvcmln
aW5hbGx5IGhhZCBhIHNpbmdsZSBpb2N0bCBmb3IgVk0gbWFwL3VubWFwLCB3aGljaCB3YXMgaW5z
cGlyZWQgYnkgYW1kZ3B1LA0KYnV0IHdlIHdlcmUgdG9sZCB0byBzcGxpdCB0aGlzIGludG8gc2Vw
YXJhdGUgaW9jdGxzOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8t
L21lcmdlX3JlcXVlc3RzLzE1MjQzI25vdGVfMTI4Mzc2MA0KDQo+IA0KPiA+ICsvKioNCj4gPiAr
ICogRE9DOiBGbGFncyBmb3IgU1VCTUlUX0pPQiBpb2N0bCBnZW9tZXRyeSBjb21tYW5kLg0KPiA+
ICsgKg0KPiA+ICsgKiAuLiBjOm1hY3JvOjogRFJNX1BWUl9TVUJNSVRfSk9CX0dFT01fQ01EX0ZJ
UlNUDQo+ID4gKyAqDQo+ID4gKyAqICAgIEluZGljYXRlcyBpZiB0aGlzIHRoZSBmaXJzdCBjb21t
YW5kIHRvIGJlIGlzc3VlZCBmb3IgYSByZW5kZXIuDQo+ID4gKyAqDQo+ID4gKyAqIC4uIGM6bWFj
cm86OiBEUk1fUFZSX1NVQk1JVF9KT0JfR0VPTV9DTURfTEFTVA0KPiANCj4gRG9lcyB1c2VyIHNw
YWNlIHJlYWxseSBuZWVkIHRvIHBhc3MgaW4gdGhlIEZJUlNUL0xBU1QgZmxhZ3MsIGNhbid0IHRo
ZSBrZXJuZWwgZHJpdmVyIGRldGVybWluZSB0aGlzIGltcGxpY2l0bHk/IFdoYXQgaGFwcGVucyBp
ZiB1c2VyIHNwYWNlIHNldHMgdGhlc2UgaW5jb3JyZWN0bHk/DQo+IA0KDQpJIGRvbid0IHRoaW5r
IHRoZXJlJ3MgYSB3YXkgZm9yIHRoZSBrZXJuZWwgZHJpdmVyIHRvIGRldGVybWluZSB3aGVuIHRo
ZSBMQVNUDQpmbGFnIHNob3VsZCBiZSBzZXQuIFRoZSBvYnZpb3VzIHRpbWUgdG8gZG8gdGhpcyB3
b3VsZCBiZSB3aGVuIGl0IGZpcnN0DQplbmNvdW50ZXJzIGEgZnJhZ21lbnQgam9iIGFuZCB0aGVy
ZSBhcmUgZ2VvbWV0cnkgam9icyBwcm9jZWVkaW5nIGl0LiBIb3dldmVyLA0KdGhlcmUgaXMgYSBs
ZWFzdCBvbmUgY2FzZSAodHJhbnNmb3JtIGZlZWRiYWNrKSB3aGVuIHdlIHdhbnQgdG8gc3VibWl0
IGEgZ2VvbWV0cnkNCmpvYiB3aXRob3V0IGEgZnJhZ21lbnQgam9iIGFuZCB3ZSBuZWVkIHRvIHNl
dCB0aGUgTEFTVCBmbGFnLiBJIGNhbid0IHRoaW5rIG9mIGFuDQpvYnZpb3VzIHdheSB0byBkZXRl
Y3QgdGhpcyBpbiB0aGUga2VybmVsIGRyaXZlci4NCg0KSWYgdGhlIGZsYWdzIGFyZW4ndCBzZXQg
Y29ycmVjdGx5IHRoZW4gaXQgY2FuIGNhdXNlIHRoZSBoYXJkd2FyZSB0byBsb2NrdXAuDQoNCj4g
DQo+ID4gKyAqIC4uIGM6bWFjcm86OiBEUk1fUFZSX1NVQk1JVF9KT0JfRlJBR19DTURfUFJFVkVO
VF9DRE1fT1ZFUkxBUA0KPiA+ICsgKg0KPiA+ICsgKiAgICBEaXNhbGxvdyBjb21wdXRlIG92ZXJs
YXBwZWQgd2l0aCB0aGlzIHJlbmRlci4NCj4gDQo+IERvZXMgdGhpcyBhZmZlY3Qgb25seSBjb21w
dXRlIGZyb20gdGhlIHNhbWUgY29udGV4dCwgb3IgYWxzbyBmcm9tIG90aGVyIGNvbnRleHRzPw0K
PiANCg0KRnJhZ21lbnQgYW5kIGNvbXB1dGUgam9icyBhcmUgc3VibWl0dGVkIG9uIHNlcGFyYXRl
IGNvbnRleHRzLiBUaGlzIGZsYWcgaXMgc2V0DQpvbiBmcmFnbWVudCBqb2JzIGFuZCB3aWxsIHBy
ZXZlbnQgdGhlIGpvYiBpbiBxdWVzdGlvbiBvdmVybGFwcGluZyB3aXRoIGNvbXB1dGUNCmpvYnMg
YWNyb3NzIGFsbCBjb21wdXRlIGNvbnRleHRzLiBUaGlzIGlzIG5lY2Vzc2FyeSBpbiBzb21lIGNh
c2VzIHRvIGF2b2lkDQpoYXJkd2FyZSBsb2NrdXBzIG9uIHRob3NlIEdQVXMgdGhhdCBzdXBwb3J0
IGNvbXB1dGUgb3ZlcmxhcHBpbmcgd2l0aCBvdGhlciBqb2INCnR5cGVzLg0KDQo+IChTaW1pbGFy
IHF1ZXN0aW9uIGZvciBEUk1fUFZSX1NVQk1JVF9KT0JfQ09NUFVURV9DTURfUFJFVkVOVF9BTExf
T1ZFUkxBUCkNCj4gDQoNCkxpa2V3aXNlLCB0aGlzIHdpbGwgcHJldmVudCBjb21wdXRlIGpvYnMg
d2l0aCB0aGlzIGZsYWcgc2V0IGZyb20gb3ZlcmxhcHBpbmcNCndpdGggYWxsIG90aGVyIGpvYnMg
YWNyb3NzIGFsbCBjb250ZXh0cy4gQWdhaW4sIHRoaXMgaXMgdG8gYXZvaWQgaGFyZHdhcmUNCmxv
Y2t1cHMgb24gR1BVcyBzdXBwb3J0aW5nIGNvbXB1dGUgb3ZlcmxhcC4NCg0KPiANCj4gUC5TLiBJ
IG1vc3RseSBqdXN0IHNraW1tZWQgdGhlIG90aGVyIHBhdGNoZXMgb2YgdGhlIHNlcmllcywgYnV0
IG15IGltcHJlc3Npb24gaXMgdGhhdCB0aGUgcGF0Y2hlcyBhbmQgY29kZSBhcmUgY2xlYW5seSBz
dHJ1Y3R1cmVkIGFuZCB3ZWxsLWRvY3VtZW50ZWQuDQo+IA0KDQpUaGFuayB5b3UgOikNCg0KRnJh
bmsNCg==
