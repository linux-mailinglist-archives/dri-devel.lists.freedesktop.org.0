Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3BA8315FB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:39:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D0310E769;
	Thu, 18 Jan 2024 09:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B553C10E76D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:39:36 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40I8Z2Xt016671; Thu, 18 Jan 2024 09:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:mime-version; s=dk201812; bh=VtR4olttJYR9A8mpgEf5a
 cxxYPiE7RemG7os7/6DCEk=; b=kI6N06tNdoYXxgXIYIhuUgCN4YFWBiz9O7iYH
 Vlu4EiBExwh77pGw81tyxKH3z9SniV2gPN9NUb7XmCvehBh9RmuqSoxr7wuJy2o4
 e9BiQYnB1r0Bb+XX5jeL45z84LZu+G9WPssECQHWGSntkmojLZfJ6srI73+W5/mo
 htYW+UnSsQQC+GO/qxvHQazCPtXrM0sRTh6qpbCJU0MEogEOr71WE4XNXTpPQuPg
 EFcVm6f9wMZh+kjeGf5bI/U4xcqeLO3vZG45hC74A2AOVZ/+V2HrjUyhAbMeZJid
 9g/IH/s61KdTzGKLFAkGUg6agrhXjQbBZzG92VwJsG1WuFQVQ==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3vkhnsbmkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 18 Jan 2024 09:39:02 +0000 (GMT)
Received: from HHMAIL04.hh.imgtec.org (10.100.10.119) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 09:39:01 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 09:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d//mKCL/uuEwhxUYg/C1GRKZgiNVoDomMAkc4X24fjpqDCFikxvHH2BqaqQcVSZ0hD6tGBbVkD5+hXDXqeIF8mOOSLkYYJyTW80v2HxQIhuDFVpEVmkjbq8JhvuEKlgoUspGjZAJj2kUnjQPrPpzXhjKklvqMul5yU+9IfrJ53jvAIuR5B5aQ/+zY5Pswp8aSIBG8mWRkaWiS2vjzg3ITBvSwrprZnmdoQMuoVO7TD/mjnw7iMeO7h78w85N+socvd8WjOYlTG/1DodAci/Yp6XhxtiClGyKG22i9uUM0LSoOc54KOY9TecYo08/wH+BaoPn/19XDraAz05I20gZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtR4olttJYR9A8mpgEf5acxxYPiE7RemG7os7/6DCEk=;
 b=lsDDLFNVNVXSjf6GP3wTptvS6K0nIkZjj76K1ELNwb6vewHML4HQTr8bdS4e5aln6MTVAlDAJMcj/WZoDd301yRB3sJygxx+EhCsI2qTHAjzqEId+kj86IvQbbKOoe176YI//zhJzPlO/f1aO61Be7sdJx6BDrJPy/+zevycP4BB4k+fEUBeBg3RR8YCwCn52BS+OY3cBe6ITwQzdsPyW9XKI5RY/ffPkOZlS+dpXQHDm12VjUoWPykC0JWvLNd75QK4M1QJCU4AeWeGItCr1jMWeHIIA7FPxtOC+PQLHmKfwiQa4LPbtu0VKAlQL5fQsjCCW7wQS8ua9lQpvxUbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtR4olttJYR9A8mpgEf5acxxYPiE7RemG7os7/6DCEk=;
 b=VZLLKGKm5okNTCe3C58/s3xVd3wRvHaiYf3jGepv63RdybBgI7xGH7XScSvPeombU0aBrPLO+9g69d1NnmKG+rbW5dSY5KSuruNuE6V32I7Yv7H9Gq9CKGprpY8wqzK1/fjL7kXLudAhq0twNfw9fLOQ+otin7KK9nNeZndgq0I=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 LO3P265MB2233.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:103::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.23; Thu, 18 Jan 2024 09:38:59 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::238a:8c4:e3ab:ee06]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::238a:8c4:e3ab:ee06%7]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 09:38:59 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] drm/imagination: fix ARRAY_SIZE build error
Thread-Topic: [PATCH] drm/imagination: fix ARRAY_SIZE build error
Thread-Index: AQHaSfIpk+0dcLkog0Gt4kTl/cVwNA==
Date: Thu, 18 Jan 2024 09:38:59 +0000
Message-ID: <ca53a99f-4bd9-47cb-bf4f-869712ef950c@imgtec.com>
References: <20240110002350.1096-1-rdunlap@infradead.org>
In-Reply-To: <20240110002350.1096-1-rdunlap@infradead.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|LO3P265MB2233:EE_
x-ms-office365-filtering-correlation-id: 4dac2b76-d019-4c4f-6f16-08dc18094c1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q4CNeRYVp4KBsHGIkI4zTBlIh1UpH3xf/0XVQo+zp8C19zsCdWPUQkrSDC9S6XerTZ1v1rERBxZ+ijrj7nBZ/oHvVnQ9Z2MyE/2502xQOMCbFQ2FCIBwREW6EEJ4iRbctO+35cZzTk18lHJD7lGEJmpthyweCBvvrFAFdvwgeahT1xETqgxpXwK8Ku6DZyluo3aeJKq2syoDE0ydkClQxqUMah6FK5ovWdWsZ5gzxVIMILDPiU6K2LnG03NgUE9CVcdHp5KIqvJ7PqqGv11ZopDpUNNIINhyr2/66y4CP1ZGB9H8qRXvpyUR64wAtqp3L9wXhmX+y36SkH1GFIcDmVU86ul7XNno4zVyXIDgAyvFSC1uq7ddOVuqu5aCOhGlFzf3rV5o3qIpT6pB7Q/W0JmSl2lRHPN+LPQfKftV0/wW0CqWI1aIWWUlzSvGM3N84EvTkkeV+427jefAUq7bKVeZMVWLDGOw2yWdW2Lhj6fVBzOcujywOgIgrbaLiQiXDdyoQUmYGMaRVh0LSJlwg4coBuQTQFd3LuYuF1aJqn5MYeMyVVZLb0zzIyzm/K7YrrGzjB+GqprhqH3W3MgvB12mj76nC0QUdDrbxpzRsE4LQiMY64wQMPTB7ta39gg1AaNdHG90BPui1A+G5zc6HG3tKTwSu4q1UqPLyuD4Z8kJfMSQ8Rm8N+GLKwGMTMft
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(396003)(376002)(366004)(39850400004)(230922051799003)(230173577357003)(230273577357003)(451199024)(186009)(64100799003)(1800799012)(26005)(83380400001)(122000001)(99936003)(38070700009)(31696002)(86362001)(36756003)(38100700002)(41300700001)(6916009)(66556008)(64756008)(76116006)(91956017)(66446008)(316002)(66946007)(54906003)(5660300002)(2906002)(8936002)(8676002)(4326008)(66476007)(31686004)(53546011)(2616005)(6512007)(478600001)(71200400001)(6506007)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wm9tOUFNVzFrQ1A4NitDLzlhSDdoSmFMLzd0OWQ5NXB0NXE4KzNRN3VWcmtr?=
 =?utf-8?B?cDlkUjdnOVBxYTQ4ckVueiswNG9xWEMzYlRoMWZiV1lSdE5teHR0bUlmYThC?=
 =?utf-8?B?RVplZ0toODB4R2l0UDRNS0tZbFJpaUQvWHl5TVozRkJENStNMW1FbGtXd3dG?=
 =?utf-8?B?cGVrbkxDckQxOVJKNUl6OFk5NnZEbkJOcG1QTXo5NG16R09oNE9MTk5IdkNQ?=
 =?utf-8?B?SmpDdGNJZWdScTB4OGNLK2NKUFRrcmduSEUwMzlwYUhtenhHck4yK0xkRW52?=
 =?utf-8?B?K2lyTWJCWDRzY0FOTGt0UitDVnpBZnpFRUdZVXNQTStZWVFMeWpXVmw1VFhj?=
 =?utf-8?B?RThSaVZJaTNEbzRTb2d5VVZ4VEl3TnNjUVBGd0lZRXhsYWpSYWwyQ0QrQlY5?=
 =?utf-8?B?akdobHRUVXhsUGt1cGZrVFgxc24zRmhUek4vL21HT0ZIc0RYZVg0T0c1QXZp?=
 =?utf-8?B?Rloyc3VjbFo4NG9NRUFiMkNqMzNnMVkwYmZIUy9FL0pYZU5VRGtnWVk1ZTJW?=
 =?utf-8?B?SkxuOUtpYlllT0dwT0wzTnJZNExMNElwZlpwWHB3dlpmUDFTNWdVdG5BYllk?=
 =?utf-8?B?aGNsc2kzVHJlMXdPS25ocGFoMndacGxURVJ1NG1jVWxUWjFUMkFRMUpsOGF4?=
 =?utf-8?B?UFBHNmtRZDZ4akdSRlFYdlV0Y0w2Rzk5QWJvK2xnMXRURWpUa2l6N0RSRmNS?=
 =?utf-8?B?Ly9uOFFFK2xJaXhxVzBuekpSZG90V1FiUUZsTTZqeStPSHI1bHRrZlhBbkpC?=
 =?utf-8?B?ZVdCVS8wUUZLbVNNUS9CbEoyd3lYaVcwQm9pbWxERU1PcTJ1ckFpZjl3NEdo?=
 =?utf-8?B?dzBMTFZnYTV5elhWRXRsam50MDdDKzNPdXgzVm9QeFJMdmNMMldwWVJvZXRW?=
 =?utf-8?B?Tm1SNXR5MkRJQVJPMXFPTmo4QlJSbU54YlZpRitRQjVIeTZYRitqaUIvRm02?=
 =?utf-8?B?ZDcvV2VDREkrWUlBWGdURjIzenJ2N2RVYVczK3JWUkRaNjROYTZicllLeGRu?=
 =?utf-8?B?NkRWTDdiYjNGREdSdzMzejFPbWg1OEhnMElLUC9JdVA4eXRZTU9xZmlLTmla?=
 =?utf-8?B?cnFLWHZtTUk2clA3SU5JeWFJU0J4a3N2SmFmNVBwRDRpNWpqc1pybUVoTkFD?=
 =?utf-8?B?SHA0dFpCdU5CSEFCL29JclZpTXFuOERrV1hGSldqVkU1OGFvMmlPSlpJMkFF?=
 =?utf-8?B?TVJPVCtxcnpVcWYxamtGYnFESVZVRVB1TG5qMnpjVVRwK01ZekFlK3l4cmda?=
 =?utf-8?B?M2NCM1UrSDNsKzEwTHFlSTNYUEVCR2Q2TERZUWtSSnNjVThOQVMwZ25vbER1?=
 =?utf-8?B?Zk5vd0txQWR0Vk8vNmRBMHVDcU1VOGhPMkZ3MjlQMTZBcmFNTE0wb05jQjBm?=
 =?utf-8?B?WUFFYzM1cCtaQkVhbnk2NFhYVzdEK0JxSVN0UjVGc0c5YjdKclJzZjZvSTU4?=
 =?utf-8?B?SHZwK0tBbERYUVV0REVsSDJTdlJYSVY5aHB5N0xWUTA1WmVGakJNV295aTMv?=
 =?utf-8?B?MExNKzZtY3RMUVdiYnhqdUNLd29vM0dMVTcrckEweTV4N1BTcEhvR0hjdHFz?=
 =?utf-8?B?WE9WQ2REaUtPQTlKSFZ2RFp5bld3eFdzMnJiNXNua0dtbk4xdUhnbHVlSHFX?=
 =?utf-8?B?QzhaTjhKeHpXeHpqWVFjTytOSDg0UnJJVGp3aGNTRHRkMDYyQU9TU1VscVVz?=
 =?utf-8?B?c2wvVHNNVXFOOGg5c05waUlSWmdRQTkwMjRNbUc5YW5wT3ZlbHkwenRUTHhQ?=
 =?utf-8?B?UnhGTjYrWW1qc3IzR1laaFErTDBJT24yU2xWTzN3OGJBOFhJaldLUmtvazlh?=
 =?utf-8?B?dnVrdklLOGpEZGhEMGNIRUZDbnN0TG9JOHBGV0dSenZHbXVqYUJ5bWE1NFQ4?=
 =?utf-8?B?OWUzbXcwUUgyRjhoT1RnRmhBR1dIWFpQNGgwaGpwbWRaT3hLNDlmSnBPZDhR?=
 =?utf-8?B?cy9DY0UvNGo2RHQ2TFdHYzNIa1hNM0R0YkxPMEZ6YVdxemFlYXJMenhpTHg0?=
 =?utf-8?B?Y2YxNlN4ekNHQStKYnYza3UzTmp6WmltZzhBS2hONDI2VEduSFlHaEtSR0h6?=
 =?utf-8?B?MkRRMGRzMWUrL0dVdjFqRi9HUjJ6V3NYQ0FZUUE4bDhSYVJidGREN0tLRDd4?=
 =?utf-8?B?TkRuT05SNDhYMDhiYys5ajQ3eDBLdTgyU29vajFSZnVoa3plNzdIem13QWV1?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VSXHJIzpOkssi5XYlMIQmLcZ"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dac2b76-d019-4c4f-6f16-08dc18094c1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 09:38:59.0405 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bS0g+uxxOjnHwfMUzjfcc4AgeotUCwRoaVImEBLly/1Jm9rWovB77NjOtZKd7chsj4OdBL5tusTLAHR5gmehxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2233
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: eNM24pFs6a6SxCBHpAEvmv_TWt4m65Gi
X-Proofpoint-GUID: eNM24pFs6a6SxCBHpAEvmv_TWt4m65Gi
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------VSXHJIzpOkssi5XYlMIQmLcZ
Content-Type: multipart/mixed; boundary="------------1iMWcYMAjksFSu02Jek0jJeF";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Maxime Ripard <mripard@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <ca53a99f-4bd9-47cb-bf4f-869712ef950c@imgtec.com>
Subject: Re: [PATCH] drm/imagination: fix ARRAY_SIZE build error
References: <20240110002350.1096-1-rdunlap@infradead.org>
In-Reply-To: <20240110002350.1096-1-rdunlap@infradead.org>

--------------1iMWcYMAjksFSu02Jek0jJeF
Content-Type: multipart/mixed; boundary="------------0GaWyy0ioj73MeSaJSolcdkR"

--------------0GaWyy0ioj73MeSaJSolcdkR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMDEvMjAyNCAwMDoyMywgUmFuZHkgRHVubGFwIHdyb3RlOg0KPiBGaXggYSBidWls
ZCBlcnJvciB3aGVuIHVzaW5nIEdDQyAxMy4yLjAgZnJvbSBrZXJuZWwub3JnIGNyb3NzdG9v
bHMNCj4gYnkgY2hhbmdpbmcgQVJSQVlfU0laRSgpIHRvIHRoZSBtYWNybyBQVlJfTUlQU19Q
VF9QQUdFX0NPVU5UOg0KDQpJIGFzc3VtZSB5b3UncmUgcmVmZXJyaW5nIHRvIHRoZSB4ODZf
NjQgPT4gYWFyY2g2NCB0b29sY2hhaW4gaGVyZT8NCg0KPiBkcml2ZXJzL2dwdS9kcm0vaW1h
Z2luYXRpb24vcHZyX3ZtX21pcHMuYzogSW4gZnVuY3Rpb24gJ3B2cl92bV9taXBzX2Zpbmkn
Og0KPiAuLi9pbmNsdWRlL2xpbnV4L2FycmF5X3NpemUuaDoxMToyNTogd2FybmluZzogb3Zl
cmZsb3cgaW4gY29udmVyc2lvbiBmcm9tICdsb25nIHVuc2lnbmVkIGludCcgdG8gJ2ludCcg
Y2hhbmdlcyB2YWx1ZSBmcm9tICcxODQ0Njc0NDA3MzcwOTU1MTYxNScgdG8gJy0xJyBbLVdv
dmVyZmxvd10NCj4gICAgIDExIHwgI2RlZmluZSBBUlJBWV9TSVpFKGFycikgKHNpemVvZihh
cnIpIC8gc2l6ZW9mKChhcnIpWzBdKSArIF9fbXVzdF9iZV9hcnJheShhcnIpKQ0KPiAgICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBeDQo+IGRyaXZlcnMvZ3B1L2RybS9pbWFn
aW5hdGlvbi9wdnJfdm1fbWlwcy5jOjEwNToyNDogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvICdBUlJBWV9TSVpFJw0KPiAgICAxMDUgfCAgICAgICAgIGZvciAocGFnZV9uciA9IEFS
UkFZX1NJWkUobWlwc19kYXRhLT5wdF9wYWdlcykgLSAxOyBwYWdlX25yID49IDA7IHBhZ2Vf
bnItLSkgew0KPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn4N
Cg0KSSBjYW4ndCBzZWVtIHRvIHJlcHJvZHVjZSB0aGlzIHVzaW5nIHRoZSBhYm92ZSB0b29s
Y2hhaW4gKG9yIGFueSBvdGhlciksDQpldmVuIHdpdGggLVdvdmVyZmxvdyBleHBsaWNpdGx5
IHNwZWNpZmllZC4NCg0KVGhlIHVzZSBvZiBBUlJBWV9TSVpFKCkgaW4gbG9vcCBib3VuZHMg
aXMgYSBwcmV0dHkgY29tbW9uIGNvbnN0cnVjdGlvbiDigJMNCmV2ZW4gd2l0aGluIHRoZSBw
dnIgZHJpdmVyLiBEbyB5b3Ugc2VlIHNpbWlsYXIgd2FybmluZ3MgYW55d2hlcmUgZWxzZT8N
Cg0KUmVnYXJkcywNCk1hdHQNCg0KLS0NCk1hdHQgQ29zdGVyDQpJbWFnaW5hdGlvbiBUZWNo
bm9sb2dpZXMNCg0KPiBGaXhlczogOTI3ZjNlMDI1M2MxICgiZHJtL2ltYWdpbmF0aW9uOiBJ
bXBsZW1lbnQgTUlQUyBmaXJtd2FyZSBwcm9jZXNzb3IgYW5kIE1NVSBzdXBwb3J0IikNCj4g
U2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+
IENjOiBEb25hbGQgUm9ic29uIDxkb25hbGQucm9ic29uQGltZ3RlYy5jb20+DQo+IENjOiBN
YXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IENjOiBGcmFuayBCaW5ucyA8
ZnJhbmsuYmlubnNAaW1ndGVjLmNvbT4NCj4gQ2M6IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3Rl
ckBpbWd0ZWMuY29tPg0KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4N
Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl92bV9taXBzLmMgfCAgICA0ICsrLS0NCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfdm1fbWlwcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2ltYWdpbmF0aW9uL3B2cl92bV9taXBzLmMNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2ltYWdpbmF0aW9uL3B2cl92bV9taXBzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2lt
YWdpbmF0aW9uL3B2cl92bV9taXBzLmMNCj4gQEAgLTQ2LDcgKzQ2LDcgQEAgcHZyX3ZtX21p
cHNfaW5pdChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyXw0KPiAgIAlpZiAoIW1pcHNfZGF0YSkN
Cj4gICAJCXJldHVybiAtRU5PTUVNOw0KPiAgIA0KPiAtCWZvciAocGFnZV9uciA9IDA7IHBh
Z2VfbnIgPCBBUlJBWV9TSVpFKG1pcHNfZGF0YS0+cHRfcGFnZXMpOyBwYWdlX25yKyspIHsN
Cj4gKwlmb3IgKHBhZ2VfbnIgPSAwOyBwYWdlX25yIDwgUFZSX01JUFNfUFRfUEFHRV9DT1VO
VDsgcGFnZV9ucisrKSB7DQo+ICAgCQltaXBzX2RhdGEtPnB0X3BhZ2VzW3BhZ2VfbnJdID0g
YWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7DQo+ICAgCQlpZiAoIW1pcHNf
ZGF0YS0+cHRfcGFnZXNbcGFnZV9ucl0pIHsNCj4gICAJCQllcnIgPSAtRU5PTUVNOw0KPiBA
QCAtMTAyLDcgKzEwMiw3IEBAIHB2cl92bV9taXBzX2Zpbmkoc3RydWN0IHB2cl9kZXZpY2Ug
KnB2cl8NCj4gICAJaW50IHBhZ2VfbnI7DQo+ICAgDQo+ICAgCXZ1bm1hcChtaXBzX2RhdGEt
PnB0KTsNCj4gLQlmb3IgKHBhZ2VfbnIgPSBBUlJBWV9TSVpFKG1pcHNfZGF0YS0+cHRfcGFn
ZXMpIC0gMTsgcGFnZV9uciA+PSAwOyBwYWdlX25yLS0pIHsNCj4gKwlmb3IgKHBhZ2VfbnIg
PSBQVlJfTUlQU19QVF9QQUdFX0NPVU5UIC0gMTsgcGFnZV9uciA+PSAwOyBwYWdlX25yLS0p
IHsNCj4gICAJCWRtYV91bm1hcF9wYWdlKGZyb21fcHZyX2RldmljZShwdnJfZGV2KS0+ZGV2
LA0KPiAgIAkJCSAgICAgICBtaXBzX2RhdGEtPnB0X2RtYV9hZGRyW3BhZ2VfbnJdLCBQQUdF
X1NJWkUsIERNQV9UT19ERVZJQ0UpOw0KPiAgIA0K
--------------0GaWyy0ioj73MeSaJSolcdkR
Content-Type: application/pgp-keys; name="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Disposition: attachment; filename="OpenPGP_0x747F0A9036F90DFA.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYl2lchYJKwYBBAHaRw8BAQdAOYlooFfHTXzAQ9aGoSnT9JS9wq8xprG+KVLb
kxJDF5DNJE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBpbWd0ZWMuY29tPsKWBBMW
CAA+AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEBaQM/OcmnWHZcQChdH8K
kDb5DfoFAmRHxyEFCQWsiK8ACgkQdH8KkDb5Dfr3+QEApzVEKHrbpxJqs79GRaXU
/NAQBxzjwBd4wKxqr5gkUxYBAOuK7Ag2dAZzFUp73tKxIN9uyMdCLRXWvAYqYL7l
uRIIwpYEExYIAD4WIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2lcgIbAwUJAeEz
gAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRB0fwqQNvkN+uO8AQDM69Bb0Wqj
7kyzEejIZa9/93vdzHcDmuiQxxvXEUqQ3QEA9qBYj3PBnWD1Ijhj9bm/Z6S93d1x
w97TbUrxgwJYtgrOOARiXaVyEgorBgEEAZdVAQUBAQdAJpULxfns06/aM1t5eqM/
16RjuvPLtq6IRnk/FoNZRBUDAQgHwn4EGBYIACYCGwwWIQQFpAz85yadYdlxAKF0
fwqQNvkN+gUCZEfHJwUJBayItQAKCRB0fwqQNvkN+oUpAQCzr1PYZLdOHo0mC9kK
cCXza1Vj3VRNPMegCSi/y9+LogEA+lwceHgTNihH2EfhRGIEMRyJCSyze3qnj0bM
2vS1pgHCfgQYFggAJhYhBAWkDPznJp1h2XEAoXR/CpA2+Q36BQJiXaVyAhsMBQkB
4TOAAAoJEHR/CpA2+Q36hQMBAJQdksAMGUeGOri0s1I5uIdMJmhhegBeTk1GZpbx
5oKxAQDyJegbW7BJHeFd1+GFSluU49tsGvF8mlUzdLb9LiJWA84zBGJdpfQWCSsG
AQQB2kcPAQEHQEYOlTQaog5wQoLiS6u6OTaKjyi2mXKU9WbtwC/v39vdwsA1BBgW
CAAmAhsCFiEEBaQM/OcmnWHZcQChdH8KkDb5DfoFAmRHxycFCQWsiDMAgXYgBBkW
CAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJdpfQACgkQebwZ89nearAP2AD/
ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkEUHkA/jjaGla5ImGH/q1xYjt0
RbBybflzR7ibrXcoMFqkAqIGCRB0fwqQNvkN+iVNAP0SzMEkBYft0Mch8owZAl0G
ePG2w4C2jSdSvvZC7owfnQEAzrnZuanxmAohlm6JFxel+uU3qzdIgBq2bJsDwXnK
Cw/CwDUEGBYIACYWIQQFpAz85yadYdlxAKF0fwqQNvkN+gUCYl2l9AIbAgUJAeEz
gACBCRB0fwqQNvkN+nYgBBkWCAAdFiEEuKg5qCb8JioY2PpzebwZ89nearAFAmJd
pfQACgkQebwZ89nearAP2AD/ToBHghxjebEQsJ5lINO0PlpCTSXXry3IXdmFTvkE
UHkA/jjaGla5ImGH/q1xYjt0RbBybflzR7ibrXcoMFqkAqIGocoA/j+eZa4A8PV9
SfjDjTevuuodrN5Ajq3t8vhoDDR0NmmuAP95JQyBAYiVTVCEVs3gzMXnL7HkjeWc
GOZEeJL7u0cxAw=3D=3D
=3DLApB
-----END PGP PUBLIC KEY BLOCK-----

--------------0GaWyy0ioj73MeSaJSolcdkR--

--------------1iMWcYMAjksFSu02Jek0jJeF--

--------------VSXHJIzpOkssi5XYlMIQmLcZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZajxsgUDAAAAAAAKCRB5vBnz2d5qsAh7
AP9VtxCVEYIlZejlIzPCVa/NpGH+VA86HY4w0epFIqPTmwD8C/IASwgtReTe/yUFRKaYqmM+ihKG
dd8z3zvLHh88NA8=
=Qcmg
-----END PGP SIGNATURE-----

--------------VSXHJIzpOkssi5XYlMIQmLcZ--
