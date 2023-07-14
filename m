Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BBE753B9A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 15:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F13910E8AE;
	Fri, 14 Jul 2023 13:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7589010E89D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 13:15:50 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EC2mJu009722; Fri, 14 Jul 2023 14:15:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=haiYHlshdUB5rrSYcsGOGjUnqmd2i1VotsajFzIQa2s=; b=
 uPE3AIsb3GlMJwfAEemDOuTbsMnyIpBtQN7oLBU7Alubego5Q4UbtAdrdwuLFQrn
 AHuME6y/9GTTR0qpC0CPMZW4yUGPrueHSxmwugv2dY2iATv1y8s8z+mYgiX+USoM
 pogk1RAunirfaLHbwYsMmjEnO5nM1htCmKmVTO9SdckxTRLNe5TTbWCecy+eS3cl
 f+/vEwqQ6gGhgCfIt2NF2vfxCsr4naM5pG5XBCFeW7EFpFlWJZUzs+njnTTkNtX8
 bI9hgqWHpyekoIfCz6a8apOczD+6bYQ8GmyqIjAp+ruiCBwvDgmhf5pfqR56xm4+
 4q3MCfW0VB475eh+N6dEMw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gjqj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 14:15:24 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 14:15:23 +0100
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (104.47.21.59) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 14:15:23 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfnW/y+AX/QTBBmQ6e3Swn46bCdP6Fkhhx2AF/bwO8z4B0v+jwQdJg8s3bWQaHY62486yjYpj2KkkCpjTrupFyIt06PnertNFA/RWV6s25yscwS1BNJGYf5K3l7kW0b49r8d6KkS9PKleymKPHhlGk3fDvLNviT7D6nZRAauO3oUJAXUXd0EAm4eWxW+BpQFfnRuuybN0CxK6sCpmmwdoyr70fNqWeSPDAmQ+ZvB2UV/jx10WqdsIyiK9merBUXTbQUeDSR+vO5sHHuoXjvXpz0w0rrWQDnN7KbYybhTWARc2JqZoi38xudTlcDj0pdpesqeKV950/9+a9oyaXWtsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haiYHlshdUB5rrSYcsGOGjUnqmd2i1VotsajFzIQa2s=;
 b=Kt8B30RubE2XGN4K8Nlr8auO/BowybENqu9T6zcXmM01JYOhfwnvxdnN58fPivrUw45Pfgdva7AlhrJxuJpgp1XiriAlveTg5yalH/mDojK4cJCpRDMPawzzeJDyIofSyrHFSDoyJQkX0njXk9LUFNUzMmpyG/oRaqy5nI9arESPIp28fdERdOTqkPxYEGSOj67ZX9V4qq99t50DSlUBmAn793K1a+AA7/t33RJ5W3cA3JfRBjT8celzIL7nXrs7Vwf00L8r4L7HCefhrVgU2Ayx0moMUzE+ue2uy2SxksxkjHNz+LuwH4kAKfl/l0VuzZAw7OcbnRJTcTRb5c50Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haiYHlshdUB5rrSYcsGOGjUnqmd2i1VotsajFzIQa2s=;
 b=PF4T8Ot1B3toQueA9AxtflhID4OjyJMErWbYYTlPov0G+GlK2IslAJpR1IoJwbtdhKIlOX6hzoQrsIpwLDtO77BdMoZv7fILWL6qNibdUPQujFBsrBHtM9EfkBzVz2t9DEslKPLkSSCu1E0G23FnhyhSufEOWsDGB0dM/dSPYZ0=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by CWLP265MB6420.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1e0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:15:22 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 13:15:22 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "mripard@redhat.com" <mripard@redhat.com>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v3 04/17] drm/imagination: Add skeleton PowerVR driver
Thread-Topic: [PATCH v3 04/17] drm/imagination: Add skeleton PowerVR driver
Thread-Index: AQHZngYV1WfF7WkmrUSdnzc03+1ahK+uZiYAgAsISAA=
Date: Fri, 14 Jul 2023 13:15:21 +0000
Message-ID: <b3d7328895e6d3afa2d194669a88fd3d275f3003.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-5-sarah.walker@imgtec.com>
 <qt5b3tuxfcrup7roh2hiwhqzofj7kde3fc43vdblte6dbomupy@lsf7drxz7tx5>
In-Reply-To: <qt5b3tuxfcrup7roh2hiwhqzofj7kde3fc43vdblte6dbomupy@lsf7drxz7tx5>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|CWLP265MB6420:EE_
x-ms-office365-filtering-correlation-id: 9a7659cd-6fd6-4fd6-bde0-08db846c60e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFm/rH+QQbmFHXlGoZInIm5fY+FUxIlbZzYZQFkELxDd1mC2+7Wom5y8F1yMF2lAPYXhvT66zyrga/d5MNpcdFCJFfNhJScyg4UAhZOyQYkv7z13KO8KnCkdBbQPKJG/FBhj7LJiNTN+eeuR9lWiokCZgZeI+Wu0T03BXz8tknPrehBkAiLVHFAz60EBMcPXAvW1qBv1bPhUhpwNnLlXw/S8mNEWOPXNhWOaTWd06iFc1c9Lu2Y9324VRR8eXgjbD7uoYKGUgxdfiRHcNptqRvAvYjYBPlFzTV8O5+x0dsNwHOcAeRu7wj0MMTzP1ugKomSUXt9INP0kndkYiFpdNBBrMsthhor91efoOzqRFO8NarS1EjFHMCHHhOmGM2VBSVyvruT7m+6ckKiNFKoXCN06SiaLbIW0TpfF8l/zwfsaT9l+Tlc0MRSKqOsPotpfuSPb50OsI4qY73oa8UFw1w+NTXnuxXV+KO6a7eKGz1Pxkxlyf0bXkwTd/TeZF5hwFIcynk3JY43/F9XBRPLvDmwZU9YlYwy95jS6B3Vu56ZvervaQD78Q+PnFAkmmXMqOmY5jUvIpMH9HF4+2Cxp7QwM2MgtZmg9unzSv5UZSSsMkoV6J5nQPzgat5McaN6+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(39850400004)(376002)(346002)(366004)(451199021)(2906002)(38100700002)(122000001)(6512007)(83380400001)(2616005)(186003)(26005)(6506007)(86362001)(5660300002)(38070700005)(8676002)(36756003)(41300700001)(478600001)(54906003)(110136005)(6486002)(71200400001)(316002)(76116006)(64756008)(66446008)(66476007)(66556008)(6636002)(66946007)(4326008)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2xac3RxdTV6cUV3Z1d2bStUSFRBSW1FRFlISUZsWm9HSVBKNjUyczE0RVF3?=
 =?utf-8?B?RE16VVZPanZFemFyMEo4U2wxYmhPbHBUN2hsMHVlZGxueldjZUtxWDBJYm5p?=
 =?utf-8?B?YkVUZWl0Zkc3RlpvRGhPQ0xVZ2NKQnlnem9ZclR4NkoxbjFTUTh4WEVKa29s?=
 =?utf-8?B?ZjU2M1JySW8zYUYzMHpoWWxhR1c3amtkcWJuZVh1ZldPeEZ2Z3NRbHh3SENE?=
 =?utf-8?B?YUlZUElvaFBxTXJnSXNydjZ4ZWJ5cHlnN0g1UWhlaXhxZXdVMk5BMFZkbkhR?=
 =?utf-8?B?WENHRUo3VG9OVFQ2a3RiMUlyNzIwMDF5M1E1MGhORHp2TTVLM2pIVWl2RTVH?=
 =?utf-8?B?aE5rVGUvOGp0NVdYVEhjbWh5UkxlOWtqSTNiRkRyQ2ljQXU2eHk0bFphUGdN?=
 =?utf-8?B?dXdCelo5RFJiZkZrd3FrU1I1Z1RObFRHMndJK2MwV3Q5RVgvM0pJWC9HN2p3?=
 =?utf-8?B?ZFo2ZjQvcldQS0RBanVUOXVGNmhuZ1BFcEEzODdESDdFT29YVUlOcDNuYURv?=
 =?utf-8?B?aHkvMnc3bWtpbWpFWGVaYzliaDcxUkE3TGFta2FqbXBVTE1vbVArZmdhWWRC?=
 =?utf-8?B?QWlTdWZjOFpZRVRBVVdkR3hrQW8zbnlpekF6bVRKN25GdU96b1RpVkEzN3hi?=
 =?utf-8?B?ZVJDN1MrM3R3RVlONkJWbDNINWR4RXNaZ2pSL1p3NjlNNVdIVGg4dXhTTE9o?=
 =?utf-8?B?ZDZZOTRjdW51ZmZ6SnpXeWpZWmJhVmtYQlMyN0Q1Sm1Ma1FIajBybjAvcXRJ?=
 =?utf-8?B?aVRST2lqYys0OVhZc0xHQUdIckxxdzEzdGF6UmN6Smh6Y2hSV1YwbmF4ekYw?=
 =?utf-8?B?TjhXMWRUczRmemk1dXpGVHoxbmpLa2w0S0d5K3N4WW5BSWxuV3BralRsYWNF?=
 =?utf-8?B?NnF2N3BienI3MGF2UjdtdEg1NTF1Wkp2Qm9IVm9xZFNpZFNSTEp4N29tQ3R6?=
 =?utf-8?B?Tkw5UXR6V3lKTDM0czN3MTRpZEdOK0xXUWtEb0dZbjBEMFppdXpMMXZPeStN?=
 =?utf-8?B?bXFzc0drcGNldGtTM2VVTFlHcmwyZTlicTJvMWl0cGVrUnpJK0JFeDFCNDBC?=
 =?utf-8?B?QXZPaHcvR1ZEZ3FZaHAwbzBzdnc5Q2VhK0NsbldvODc3TUFxVHlpZG9zL3Iv?=
 =?utf-8?B?ZVAvTFNhcnUxTC9wRFBQc3hFR21oUkwvRHRDdUk4MitNdFBEVFpMUHBHWHhW?=
 =?utf-8?B?OUd0aHI5bURBSjlJYkdWQmVOL05Gd3BhdjJ0dURNSUk2YmV3dnlObVREWkw4?=
 =?utf-8?B?bG5GZ2NRVDhzMXIrbFJzejRVTy9iaTJ3REpBRThQQ1ZsT2U4RVExSnJLZEpL?=
 =?utf-8?B?UjdOdC9pSlRFUzc3V3dRMytCU2xGR1ZyN3NJSDhBWm5NMU9ZbS9DcmF4OTNk?=
 =?utf-8?B?MGFpZzdDcjJXRkU5cjhoZXJ3N000QjIreURObWJocUlSM01KQ2hqNFFEZzhu?=
 =?utf-8?B?WWg2eUk3NmxXa0lHaCtnTXZtTFgwVUkrT1VDUXJjVGJCeE5vRld2eW5iaUlV?=
 =?utf-8?B?SjREUTdMd0ZXajhHWndLdWlKMVdzRXNUd1Y2Y0V3Wmp4YWtCWEVlOE80Tk85?=
 =?utf-8?B?OUY1ZWVCNXBmYS9GanZobERnekI4a3hwcjNYQjNSWlJxT202cm92UnZNbXlz?=
 =?utf-8?B?M0VSYVl6VmY2RERkMlhaWXcvSUJFaTZjbEtzaG1KK3VrU0pNbVIvOW0vVDg3?=
 =?utf-8?B?MUxJTVl2QzM4bDhEZGRpVmptWVdWRHl6dm90YUlHWTZwMmJPenpyYzQ4YzFO?=
 =?utf-8?B?UEszYjlIak43SFpDdFVDRjAyY2lyWXdQSnV5bElVT3JYbFlQRWNnSmZFSmlo?=
 =?utf-8?B?NFZiTmRkN2t1Sk85M0pOTVdUM1J6QjJuSGNWbzA3cVBDVUdSaGlFRHBnVEhw?=
 =?utf-8?B?bE1DSENGdTdEcno5a05nc21acUFVeG4wVDYrN1pvMXN6K0hEalM0Q09nQzV3?=
 =?utf-8?B?d3pibjM1Vkt5MnFWV0pLNndWL3pWcjIreDltcllQOWFGU0JybE9GZjlmelJQ?=
 =?utf-8?B?bzh2K1VLQ2tXSGViZXlUVFl2RFRnVlp3SHgxZVJ6ZW9JRXB6ajF2dEhXRVFo?=
 =?utf-8?B?RzA1SkpEdzE4R2ZnU09CV1VkdExUUmxSVzdWNXRhazBvYVB5a2FwV202dDZj?=
 =?utf-8?B?THIyQ1Axa1F5czM3clAzQTFUYVlKQzNBZVBlcGtYMmdTOXV6UUQ5Qm4yYWF4?=
 =?utf-8?B?L2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D89E1794C053264B81F5FAF45C25D527@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7659cd-6fd6-4fd6-bde0-08db846c60e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 13:15:21.9724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q68vPxPOlFMGWJO1gVxU8XTMGKgM7Kb2G3kE+UUD3586qgLpZY7oqj6BcUzPGptuPRMkiWVaQZ3dYdMGowXawg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6420
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: Twzk44OFFEXG-aGZvDpMe0UALIcfmYZj
X-Proofpoint-ORIG-GUID: Twzk44OFFEXG-aGZvDpMe0UALIcfmYZj
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "luben.tuikov@amd.com" <luben.tuikov@amd.com>,
 "dakr@redhat.com" <dakr@redhat.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTWF4aW1lLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2sgKGNvbW1lbnRzIGJlbG93
KS4NCg0KT24gRnJpLCAyMDIzLTA3LTA3IGF0IDE0OjQ2ICswMjAwLCBNYXhpbWUgUmlwYXJkIHdy
b3RlOg0KPiBIaSwNCj4gDQo+IFtJIGp1c3Qgbm90aWNlZCBJIGRyb3BwZWQgdGhlIENjIGxpc3Qs
IHJlc2VuZGluZ10NCj4gDQo+IFRoYW5rcyBmb3IgY29udHJpYnV0aW5nIHRoaXMgZHJpdmVyLCBp
dCdzIGF3ZXNvbWUgdG8gc2VlIGl0IG1vdmluZw0KPiBmb3J3YXJkLg0KPiANCj4gQW5kIGNvbmdy
YXRzIG9uIHRoZSBkb2N1bWVudGF0aW9uIHRvbywgaXQncyBub3Qgb2Z0ZW4gd2Ugc2VlIGEgZHJp
dmVyDQo+IHRoYXQgd2VsbCBkb2N1bWVudGVkIG9uIGl0cyB2My4NCj4gDQo+IEkndmUgc3RyaXBw
ZWQgc29tZSBwYXJ0cyBvZiB0aGUgcGF0Y2ggdGhhdCB3ZXJlbid0IHJlbGV2YW50IHRvIG15DQo+
IHJldmlldy4NCj4gDQo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDAzOjQ3OjQ3UE0gKzAxMDAs
IFNhcmFoIFdhbGtlciB3cm90ZToNCj4gPiArc3RhdGljIF9fYWx3YXlzX2lubGluZSBzdHJ1Y3Qg
cHZyX2RldmljZSAqDQo+ID4gK3RvX3B2cl9kZXZpY2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybV9k
ZXYpDQo+ID4gK3sNCj4gPiArICAgICByZXR1cm4gY29udGFpbmVyX29mKGRybV9kZXYsIHN0cnVj
dCBwdnJfZGV2aWNlLCBiYXNlKTsNCj4gPiArfQ0KPiANCj4gRm9yIHRoYXQga2luZCBvZiBoZWxw
ZXJzLCB3ZSdyZSBzbG93bHkgdHJhbnNpdGlvbmluZyB0byB1c2luZyBhIG1hY3JvDQo+IGFuZCBj
b250YWluZXJfb2ZfY29uc3QuIFRoaXMgYWxsb3dzIHRvIHdvcmsgd2l0aCBjb25zdC1uZXNzIGNv
bnRleHQuDQoNCkFjaw0KDQo+IA0KPiA+ICtzdGF0aWMgaW50DQo+ID4gK3B2cl9wcm9iZShzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldikNCj4gPiArew0KPiA+ICsgICAgIHN0cnVjdCBw
dnJfZGV2aWNlICpwdnJfZGV2Ow0KPiA+ICsgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
Ow0KPiA+ICsgICAgIGludCBlcnI7DQo+ID4gKw0KPiA+ICsgICAgIHB2cl9kZXYgPSBkZXZtX2Ry
bV9kZXZfYWxsb2MoJnBsYXRfZGV2LT5kZXYsICZwdnJfZHJtX2RyaXZlciwNCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBwdnJfZGV2aWNlLCBiYXNlKTsNCj4g
PiArICAgICBpZiAoSVNfRVJSKHB2cl9kZXYpKSB7DQo+ID4gKyAgICAgICAgICAgICBlcnIgPSBJ
U19FUlIocHZyX2Rldik7DQo+IA0KPiBQVFJfRVJSPw0KDQpHb29kIGNhdGNoIDopDQoNCj4gDQo+
ID4gKyAgICAgICAgICAgICBnb3RvIGVycl9vdXQ7DQo+IA0KPiBUaGUgZ2VuZXJhbCBwYXR0ZXJu
IGhlcmUgaXMgdG8gcmV0dXJuIGRpcmVjdGx5IGhlcmUsIGl0J3Mgc2ltcGxlciB0bw0KPiBmb2xs
b3cuDQoNCkFjaw0KDQo+IA0KPiA+ICsgICAgIH0NCj4gPiArICAgICBkcm1fZGV2ID0gJnB2cl9k
ZXYtPmJhc2U7DQo+ID4gKw0KPiA+ICsgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBsYXRfZGV2
LCBkcm1fZGV2KTsNCj4gPiArDQo+ID4gKyAgICAgZXJyID0gZHJtX2Rldl9yZWdpc3Rlcihkcm1f
ZGV2LCAwKTsNCj4gPiArICAgICBpZiAoZXJyKQ0KPiA+ICsgICAgICAgICAgICAgZ290byBlcnJf
b3V0Ow0KPiANCj4gSSBndWVzcyBpdCB3b3VsZCBiZSBzaW1wbGVyIGhlcmUgdG9vLCBidXQgSSB0
aGluayB5b3UncmUgZ29pbmcgdG8gbW92ZQ0KPiB0aGluZ3MgYXJvdW5kIGFueXdheT8NCj4gDQo+
ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR0X21hdGNoW10gPSB7DQo+ID4g
KyAgICAgeyAuY29tcGF0aWJsZSA9ICJ0aSxhbTYyLWdwdSIsIC5kYXRhID0gTlVMTCB9LA0KPiA+
ICsgICAgIHsgLmNvbXBhdGlibGUgPSAiaW1nLHBvd2VydnItc2VyaWVzYXhlIiwgLmRhdGEgPSBO
VUxMIH0sDQo+IA0KPiBEbyB5b3UgcmVhbGx5IG5lZWQgYm90aD8gVGhlIGJpbmRpbmcgeW91IGRv
Y3VtZW50ZWQgcmVxdWlyZXMgYm90aCB0byBiZQ0KPiB0aGVyZSwgc28gSSB0aGluayB5b3UgY2Fu
IGVpdGhlciBtYXRjaCBvbiB0aGUgbW9yZSBzcGVjaWZpYyBvbmUgKGFuZA0KPiBleHRlbmQgdGhh
dCBsaXN0IHdoZW4gbmVlZGVkKSBvciBtYXRjaCB0aGUgbW9yZSBnZW5lcmljIG9uZSBhbmQgYmUg
ZG9uZQ0KPiB3aXRoIGl0IG9uY2UgYW5kIGZvciBhbGwuIEhhdmluZyBib3RoIGlzIHJlZHVuZGFu
dC4NCg0KV2UnbGwgZHJvcCB0aGUgbW9yZSBzcGVjaWZpYyBvbmUgaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0KPiANCj4gPiArICAgICB7fQ0KPiA+ICt9Ow0KPiA+ICtNT0RVTEVfREVWSUNFX1RBQkxF
KG9mLCBkdF9tYXRjaCk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBwdnJfZHJpdmVyID0gew0KPiA+ICsgICAgIC5wcm9iZSA9IHB2cl9wcm9iZSwNCj4gPiArICAg
ICAucmVtb3ZlID0gcHZyX3JlbW92ZSwNCj4gPiArICAgICAuZHJpdmVyID0gew0KPiA+ICsgICAg
ICAgICAgICAgLm5hbWUgPSBQVlJfRFJJVkVSX05BTUUsDQo+ID4gKyAgICAgICAgICAgICAub2Zf
bWF0Y2hfdGFibGUgPSBkdF9tYXRjaCwNCj4gPiArICAgICB9LA0KPiA+ICt9Ow0KPiA+ICttb2R1
bGVfcGxhdGZvcm1fZHJpdmVyKHB2cl9kcml2ZXIpOw0KPiA+ICsNCj4gPiArTU9EVUxFX0FVVEhP
UigiSW1hZ2luYXRpb24gVGVjaG5vbG9naWVzIEx0ZC4iKTsNCj4gPiArTU9EVUxFX0RFU0NSSVBU
SU9OKFBWUl9EUklWRVJfREVTQyk7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJEdWFsIE1JVC9HUEwi
KTsNCj4gPiArTU9EVUxFX0lNUE9SVF9OUyhETUFfQlVGKTsNCj4gPiArTU9EVUxFX0ZJUk1XQVJF
KCJwb3dlcnZyL3JvZ3VlXzQuNDAuMi41MV92MS5mdyIpOw0KPiA+ICtNT0RVTEVfRklSTVdBUkUo
InBvd2VydnIvcm9ndWVfMzMuMTUuMTEuM192MS5mdyIpOw0KPiANCj4gVGhhdCBvbmUgc2hvdWxk
IHByb2JhYmx5IGJlIG1vdmVkIHRvIHRoZSBmaXJtd2FyZSBwYXRjaD8NCg0KQWNrDQoNCj4gDQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfZHJ2LmggYi9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Rydi5oDQo+ID4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjhlNmY0YTRkZGUzZg0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2Rydi5oDQo+
ID4gQEAgLTAsMCArMSwyMiBAQA0KPiA+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCBPUiBNSVQgKi8NCj4gPiArLyogQ29weXJpZ2h0IChjKSAyMDIyIEltYWdpbmF0aW9uIFRl
Y2hub2xvZ2llcyBMdGQuICovDQo+ID4gKw0KPiA+ICsjaWZuZGVmIFBWUl9EUlZfSA0KPiA+ICsj
ZGVmaW5lIFBWUl9EUlZfSA0KPiA+ICsNCj4gPiArI2luY2x1ZGUgImxpbnV4L2NvbXBpbGVyX2F0
dHJpYnV0ZXMuaCINCj4gPiArI2luY2x1ZGUgPHVhcGkvZHJtL3B2cl9kcm0uaD4NCj4gPiArDQo+
ID4gKyNkZWZpbmUgUFZSX0RSSVZFUl9OQU1FICJwb3dlcnZyIg0KPiA+ICsjZGVmaW5lIFBWUl9E
UklWRVJfREVTQyAiSW1hZ2luYXRpb24gUG93ZXJWUiBHcmFwaGljcyINCj4gDQo+IERvIHlvdSBp
bnRlbmQgdG8gc3VwcG9ydCB0aGUgU0dYIGFuZCBSb2d1ZSBHUFVzIHdpdGggdGhpcyBkcml2ZXI/
IElmDQo+IG5vdCwgbWVudGlvbmluZyB0aGUgZ2VuZXJhdGlvbi9hcmNoaXRlY3R1cmUgbmFtZSBz
b21ld2hlcmUgd291bGQgYmUNCj4gbmljZS4NCg0KV2UgZG9uJ3QgY3VycmVudGx5IGhhdmUgYW55
IHBsYW5zIHRvIHN1cHBvcnQgU0dYIG91cnNlbHZlcywgc28gd2UnbGwgdXBkYXRlDQp0aGlzLCBh
bmQgYW55IG90aGVyIHBsYWNlcywgdG8gY2xhcmlmeSB0aGluZ3MuDQoNClRoYW5rcw0KRnJhbmsN
Cg0KPiANCj4gTWF4aW1lDQo=
