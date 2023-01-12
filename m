Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BB666915
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 03:52:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF0A10E2DE;
	Thu, 12 Jan 2023 02:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11012004.outbound.protection.outlook.com
 [40.93.200.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19A210E2D8;
 Thu, 12 Jan 2023 02:52:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScmwLQZE/LhYu+R+bkjEQa4NvNIw1ZtRh425+Evf5g23aO+sj9nruX/pMQr546iGrsNNbDF4SKKXktPPLAFEPbsEqRFzemsAfHvuTufHpi0oGlWxO5Y6GrzzKXh9AaLZHpQoy4CuoDsSqwPCO5SpZ0oEjr2veIYi7tOt/zt5CsI9JclGlzOsDMbHJutTCQqqBpeI3mhu9liwpL7cEeztqgKIsRFnfaRpHgzmSpZ0vqzU/wv4TUVlaFCcV6WdvdEY4Ip4qCldFcUSibR9Z1Jy/foASotIkHsiEE2rADrvu5qR3hxAFaIMG8gq/BNe9o/uZnI0bzNiZclW038WuXO2lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXHY/H2HsJzSznWKYirP21W1ttyWiaWZSTbvk2LkuuM=;
 b=l1UPPkya5eSL4LRx4Xu5epUZMCigHu8wUDhlmV6f3VNXr+5fU7W2bIfLjYbOOorQYgTjxdhqb6VxHJmbYtKvW4bKwObKRN39hwu/GExPBK/uM4bcG2MiCjVzfjnt6T1Alc4ocDSxgFwcySW5Y/x2njBtLTNItSfjusYD1srFPVZeq0tZJHkijQUw0oAPztFS2eZ6lKZOwmx/qXTXgTFNkBmpEqFsHqzE6oEsQs+OYDhW6YO1FJrMNaxaiQ6jiQlA9nS4oCzjndLeW9FXyygRErti4I2cBaT2WLos70UbcwMaE1e/eROE2GDkdNDsNfV2sTLqSGRzi5RsiCYSBihUFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXHY/H2HsJzSznWKYirP21W1ttyWiaWZSTbvk2LkuuM=;
 b=rte7i1cUds6q+hIjYWGWfUWRUdnxSkpL+LWnqqy2qFmK14pSHQD0dDllpVSdKhdnezHvh7HIQPWxLpIFXyussxERfxlhizdPjF55CIGM0B6q6l4jR26qt8XlU12TRFyOsyOT3mXJvH8HGWdcgqj6z06/VjJoTvxMOjFH+H651PQ=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by SJ0PR05MB8744.namprd05.prod.outlook.com
 (2603:10b6:a03:389::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 02:52:37 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::fd1f:6b2f:b0e2:4be1%5]) with mapi id 15.20.6002.013; Thu, 12 Jan 2023
 02:52:37 +0000
From: Zack Rusin <zackr@vmware.com>
To: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "mcanal@igalia.com"
 <mcanal@igalia.com>, "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 4/5] drm/vmwgfx: Remove redundant framebuffer format check
Thread-Topic: [PATCH 4/5] drm/vmwgfx: Remove redundant framebuffer format check
Thread-Index: AQHZJBmu00nT4P1zQkO+jF1letZp9q6aGaYA
Date: Thu, 12 Jan 2023 02:52:37 +0000
Message-ID: <ee77f9c08ad1a762495627c69d0747563984c68a.camel@vmware.com>
References: <20230109105807.18172-1-mcanal@igalia.com>
 <20230109105807.18172-5-mcanal@igalia.com>
In-Reply-To: <20230109105807.18172-5-mcanal@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|SJ0PR05MB8744:EE_
x-ms-office365-filtering-correlation-id: 776e415b-5c74-4409-2f5d-08daf448100c
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WFlaT//motiEDFMOmPBfMSwr00ESRWpSkcaV5wNt9ZPI/A/un/E3LFJ41aNfFkdU+YLt6MmtpEgXrruO8YumPgvpTLFKv9ZvCZ33ENjG2wHGCodJv22UwVUgMmqDT8799ccM7uI5n91gUJH0TZh/OZfD4HX+rEMf/oN1xfhxDwXesG0mGT9jBSHHBnFpoe8c0mW/XDRcfZQI6XEUfuKwuyz2we32oARn1zM0bvXoIbZ71UjV9FtRas9SCZvZ58C83qt3tsDpAvWLKNRwIUnwQvqjjgjDzYh2Z/FB0jAiWi/SgTm/tkElHSFLOEY5KugCfX5sLtx4GZj1Ura1bcbEk/WHNJCXclIHheVStobf4QM25E6JDSJxPATnSGdG5HO+zkEj6ebxWsUgGXVNkwxUt1AtLqi4S90KGe0ItUq0BfFA4gJ0aXSEZv8pqwwaHXIf9MRHva5wW+IkR9iso+6hilGiBR5dD0Hoxi/uHxuDP2jWa13QLEp0SDoWXJ7c0lOkpaIk5xXwTxZT48fus+nHKzHxHUPr+aZzAEAfGB/mcNkNe69kYbQhbZyp/nC/43CnsPx2tmP16jZajaHvWUbKviP49EhVz625KsTDEcPm/mZfff/4NaZYIGLAcV5n5IU/nTU0Akw1EWOSyDvpowHv4f5dHwnil4Pjtrkr5Y6FrOngRZdmIBNtbhwn16diq4rmPn42gNaK27NIi8LQS72QRE9P/FBLqmzyyjrhnlPuKZs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199015)(6506007)(38100700002)(122000001)(921005)(2906002)(478600001)(6486002)(2616005)(7416002)(316002)(26005)(6512007)(186003)(5660300002)(71200400001)(86362001)(8936002)(83380400001)(36756003)(38070700005)(41300700001)(64756008)(91956017)(110136005)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(54906003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2k4c05CcTdUNmJwMUFwL0FlNG5pRng4bktWQ2djcEtZT3RGQnJFMi9tS2dQ?=
 =?utf-8?B?VEU3M3NicWZoVmhyblI4b0s2bU90L2hIaUowZHc1b09hb1dQYVZCUU9ndDFn?=
 =?utf-8?B?bG5IajFmVWRLcjhlbXVmaXI3dDROSEdMNHJPM0tWK0JnQW5tdUZuWGw4REJu?=
 =?utf-8?B?WUhBSXc0dE5ZOXgvKzd5OXpaQ0labm1wRGR5WkhRVlRhc3JlZkFVSVZoNGt5?=
 =?utf-8?B?SjAzN1A0VWVRUGRhOThjblFKQlJmQ0FzQmRTSFJ2aHppdnc2dXFmYlVqLzZS?=
 =?utf-8?B?d0wvZ0kxYXpqek8vblphNFVjaHl2M1Z1R0lYQVh5WnZaVWFpKzdpS21HYTAv?=
 =?utf-8?B?QnM3Q0pNZXJyZGs2UlpOS1pKOFFSbXRvTzNCNnZ2MHBXd1BPdlRTazdsL0pF?=
 =?utf-8?B?WTA2aFZNeDFQQ1FRSDQ4dzdsTm96QXpxTzlPUVF0Q0Ixa3lTOXRIVWd5azFV?=
 =?utf-8?B?R3QrRFVvS2VHVml5SmJ0L1RqS3YxRkpIa21TVEdEdkNlUDQyOFUza1ArY2dY?=
 =?utf-8?B?eHN3RFlZdmtJWkhtODBNYTBqL1UwcWtSWi9PWE00ZUk3SllqNlFKR0Exb1hx?=
 =?utf-8?B?SGZETExhOWN1dkpGa2dvZUpoUVlGSFE3UTY4cldkY0hnQnhhVEVjUEozV1Fa?=
 =?utf-8?B?ODgwKzNpekRpamFWTVFBUnIxSnBNaWduUkF5ZXE2YWpkNGRhOGI1TXdyNFhh?=
 =?utf-8?B?MHJyMm9YSnl2QS83eThHOGh6ZEQ5ZkxzUGlJT2dzbkFRMFYwcEVTRzVPWS9p?=
 =?utf-8?B?M0U2VCthK1l2cWJqM0xGb200Mk1zSXpodXhpKyswRTlqV1huWmNzN3gySWJ0?=
 =?utf-8?B?WkFVdU1SRTJPeG1NSGFsMWw2MzEvVTdoWm90Wm5xNXhUUi9Zd0l6RUduOHlZ?=
 =?utf-8?B?VVJ0eUd5NjhBSUtaOVhCM3FpZlVYaytxWXh0SlVsSUt6NVlVcEpVZ1hNYml4?=
 =?utf-8?B?S1ZIZlI0czlvc3A1b3FYUFErZHZiYlBpYytxaHF3ZGFLaENLT1M5YTNVQTB3?=
 =?utf-8?B?VnNVNk1ScDYxakNibktuaUQ5eWJuK1I0UGdEMUNNNGcxWWlJczJUb3RVVUhh?=
 =?utf-8?B?V1NHdEYrajQxTmNGY0JPenRVQzFZZjBuUjZHTlp5aG5YRG1QaEl5RTgvVFph?=
 =?utf-8?B?akIzVDVXdHhTRU5LUWdZQjJjL0hVZEoyN0tKVmtSRFA5dHRoVzIzcHJPbFNI?=
 =?utf-8?B?eVpXaDBTR3hQckJaSzlUOFRiaTJMRzhtK3FGeVZXUGpqVlRhSFlrTnhUeStR?=
 =?utf-8?B?dklVbTVXRGdDbHZsVjZEc05NNnNoTXBWWFZIQnFua3JvTkJ3MW1RYjZiMUdt?=
 =?utf-8?B?S0NVQXFzaXZKaWpNakpocVFTZWdJMDc1cUJQZm44Wm5uQjdkd1loR3VVQzc4?=
 =?utf-8?B?TU5ISTkvYXRIREwrMHVVeXh5QjZjRzcxVk80MzM1U2NPYWY3eGtFcDBJUEN4?=
 =?utf-8?B?NkdKdVJ5OGh2ZUdsQnlESnFYYjVRSU15VUlEU3JYR3lkdStsNFYwMGpwbTZt?=
 =?utf-8?B?RjA0Q0NDTlB1YmV4c2ZoMFZ2UWZ4eHFWY0Z3YlZJNy8vTzl5WTdkdnNQVktR?=
 =?utf-8?B?V0E1WFBWT2wxdTQ0eVd6Z1kvMXpjclVUMjl4MXFqMTZSVUtPTTZhb2I5YmYv?=
 =?utf-8?B?VVBrNUlqQ1NwWWxFdk5QVm1LR0JKWDBFYXlKVUFTUklYWVJ1aG1nR3krbnEv?=
 =?utf-8?B?Z2ErYTV2TXphS240aTM0RkRQZ05BbmdFU2dEMVRDS2d0MlZWenJxT2cxdjc4?=
 =?utf-8?B?dUtESGJHMFlndGQ0ME1iczFPRUdveWtYTFJQSVFObWo2NWV6MDVGUFF3dTNO?=
 =?utf-8?B?bHJjeTJnWWdsdk1aWURESjNXbGdHa0VScXRJaWJJWlBVSVdsN3Nkcmt5ZHZR?=
 =?utf-8?B?cVNRejNMNE1YZWhWaGZtaXl2aTNKZVp0MzlUeVJLbnU3czNUMHRoZ2tVWCt3?=
 =?utf-8?B?K2lJZGMrTVFIdkdveHAwNHIydThnMmxYVmVOWTZUOFN5TmtvQWJqK1JhbWdj?=
 =?utf-8?B?UFZCQkRkUTc1OUYvZ1E3OE1oRU5aS05xVWdyTG1KVnhZdkxMeVA0bkIyR0NY?=
 =?utf-8?B?cVlNa01VNkljWEpuclFhZytwK0ttelJQSG5hb21sU3gxUHU4d3hzZ3dGeGRE?=
 =?utf-8?Q?5RCbuo5ozhizpt+2Jj3XgCPJn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E40680C22D49B64B973B44B1B1A2BD2B@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776e415b-5c74-4409-2f5d-08daf448100c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2023 02:52:37.0246 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cGNHLLESP0Z/qL00FzlpOMujATFIcC8EoYReE9Hpz88Ltl6v33mRE6YymTSKPTn3EXypE+GZjlg3uzzIVAZ4Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR05MB8744
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
Cc: "mwen@igalia.com" <mwen@igalia.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIzLTAxLTA5IGF0IDA3OjU4IC0wMzAwLCBNYcOtcmEgQ2FuYWwgd3JvdGU6Cj4g
Tm93IHRoYXQgZnJhbWVidWZmZXJfY2hlY2soKSB2ZXJpZmllcyB0aGF0IHRoZSBmb3JtYXQgaXMg
cHJvcGVybHkKPiBzdXBwb3J0ZWQsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hlY2sgaXQgYWdhaW4g
b24gdm13Z2Z4J3MgaW5zaWRlCj4gaGVscGVycy4KPiAKPiBUaGVyZWZvcmUsIHJlbW92ZSB0aGUg
cmVkdW5kYW50IGZyYW1lYnVmZmVyIGZvcm1hdCBjaGVjayBmcm9tIHRoZQo+IHZtd19rbXNfbmV3
X2ZyYW1lYnVmZmVyX3N1cmZhY2UoKSBhbmQgdm13X2ttc19uZXdfZnJhbWVidWZmZXJfYm8oKQo+
IGZ1bmN0aW9ucywgbGV0dGluZyBmcmFtZWJ1ZmZlcl9jaGVjaygpIHBlcmZvcm0gdGhlIGZyYW1l
YnVmZmVyCj4gdmFsaWRhdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYcOtcmEgQ2FuYWwgPG1j
YW5hbEBpZ2FsaWEuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
a21zLmMgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOCBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
a21zLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCj4gaW5kZXggMjU3
ZjA5MDA3MWYxLi4wNWI4ZDhmOTEyYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfa21zLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9r
bXMuYwo+IEBAIC0xMzE3LDE1ICsxMzE3LDYgQEAgc3RhdGljIGludCB2bXdfa21zX25ld19mcmFt
ZWJ1ZmZlcl9zdXJmYWNlKHN0cnVjdAo+IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPiDCoMKgwqDC
oMKgwqDCoMKgICogU2FuaXR5IGNoZWNrcy4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqAKPiAt
wqDCoMKgwqDCoMKgwqBpZiAoIWRybV9hbnlfcGxhbmVfaGFzX2Zvcm1hdCgmZGV2X3ByaXYtPmRy
bSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGVfY21kLT5waXhlbF9mb3JtYXQsCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGRybV9kYmcoJmRldl9wcml2LT5kcm0sCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAidW5zdXBwb3J0ZWQgcGl4ZWwgZm9ybWF0ICVwNGNj
IC8gbW9kaWZpZXIgMHglbGx4XG4iLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgJm1vZGVfY21kLT5waXhlbF9mb3JtYXQsIG1vZGVfY21kLT5tb2RpZmll
clswXSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+
IC3CoMKgwqDCoMKgwqDCoH0KPiAtCj4gwqDCoMKgwqDCoMKgwqDCoC8qIFN1cmZhY2UgbXVzdCBi
ZSBtYXJrZWQgYXMgYSBzY2Fub3V0LiAqLwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAodW5saWtlbHko
IXN1cmZhY2UtPm1ldGFkYXRhLnNjYW5vdXQpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIC1FSU5WQUw7Cj4gQEAgLTE2NDgsMTUgKzE2MzksNiBAQCBzdGF0aWMgaW50
IHZtd19rbXNfbmV3X2ZyYW1lYnVmZmVyX2JvKHN0cnVjdCB2bXdfcHJpdmF0ZQo+ICpkZXZfcHJp
diwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAtRUlOVkFMOwo+IMKg
wqDCoMKgwqDCoMKgwqB9Cj4gwqAKPiAtwqDCoMKgwqDCoMKgwqBpZiAoIWRybV9hbnlfcGxhbmVf
aGFzX2Zvcm1hdCgmZGV2X3ByaXYtPmRybSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGVfY21kLT5w
aXhlbF9mb3JtYXQsCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoJmRldl9wcml2LT5kcm0s
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAidW5zdXBw
b3J0ZWQgcGl4ZWwgZm9ybWF0ICVwNGNjIC8gbW9kaWZpZXIgMHglbGx4XG4iLAo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJm1vZGVfY21kLT5waXhlbF9m
b3JtYXQsIG1vZGVfY21kLT5tb2RpZmllclswXSk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJldHVybiAtRUlOVkFMOwo+IC3CoMKgwqDCoMKgwqDCoH0KPiAtCj4gwqDCoMKgwqDC
oMKgwqDCoHZmYmQgPSBremFsbG9jKHNpemVvZigqdmZiZCksIEdGUF9LRVJORUwpOwo+IMKgwqDC
oMKgwqDCoMKgwqBpZiAoIXZmYmQpIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHJldCA9IC1FTk9NRU07CgpUaGF0J3MgYSBuaWNlIGNsZWFudXAuIFRoYW5rcy4KClJldmlld2Vk
LWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgo=
