Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263526BC3AE
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 03:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E19F10EA23;
	Thu, 16 Mar 2023 02:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY4PR02CU008-vft-obe.outbound.protection.outlook.com
 (mail-westcentralusazon11012000.outbound.protection.outlook.com
 [40.93.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3818310EA23
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 02:16:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mVMRxnHW1T6Qgih5Vu9nHbHMOV7R+6QxuPyPXiM+gVKWB+x+0BIWNSVuiAlgM9jG1AMykiDxN1OV6QKO6uySlvfqj92GThi3ZPoxTAmEdyAxZmaen0unudqzN1PAHZESLYnWXSrFlCUUZC9OXrB2W1SKViwjRM7HP0EOOP4vG67KB0RSmYlsIdmWVcAnvswprBMampSiF1zdafLuOcOHuMQZdd/518x1lTWrywCUcf3a8oB59U9JSIvzQTnvscxJzbgBA3zsqHGtMbYtOIN1Z7ROVoEzOvNGJoVtb8OgLm5BmRHkrfve4qaCg6l5cDGzf54rhHzMx5IDWmYQW1YIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=putOL/YB1FeS5XnTtVELozWrODouFqYidqsgSlLLStQ=;
 b=mL7Lx0HIws0ygs7MW4SYttZMwwVbGfLmh3mWCLD65Tjmc917ssWBIg9bL+3I7QYgr+OPenO5I0vreCPrdgMwZNhewELzJZzs1rxMc1PNaPAXjlvxpQgXDP+Mdg8t3uyXVbHgTiW7225wxQepYpnOtA4xBa3KXey/7sqLKzH3E8qeeQdudp3UW1zL7hFg/5v+nE8S/9e97FXgrKsovfQSVcDZBGYiUe6Xvs4SdJ0nAvS0VeEB7nBet05yfg1MJY8IseAj3YY6FKlnTfwwgPd6IBKOWtFRjSq6qnKs+ugBggB6EjHe3fzakGttI+EauExk8l4xSQQaDlrjq6k9jLhe7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=putOL/YB1FeS5XnTtVELozWrODouFqYidqsgSlLLStQ=;
 b=li94yep+t1t3UoUdaTvB+Z+nueTpNd1CYo2RdlBt6fxlZiLFeCxX/uMV1HSr/LO0AwPgnFpuktf0rsbPVFrU3WKOPjugNcmMOao7hSC34Db4JhwKLrSu7u7iManKCruBdUwEDD36BiKEEO65YekCoCDYnJu+k3PPfMlVgkRI9zA=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by BLAPR05MB7347.namprd05.prod.outlook.com
 (2603:10b6:208:29b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 02:16:45 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 02:16:45 +0000
From: Zack Rusin <zackr@vmware.com>
To: "kraxel@redhat.com" <kraxel@redhat.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "javierm@redhat.com" <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Subject: Re: [PATCH 2/6] drm/fbdev-generic: Remove unused prefer_shadow_fbdev
 flag
Thread-Topic: [PATCH 2/6] drm/fbdev-generic: Remove unused prefer_shadow_fbdev
 flag
Thread-Index: AQHZV1lG1xgNsoOj10GAV8R6ABR8/K78rAIA
Date: Thu, 16 Mar 2023 02:16:44 +0000
Message-ID: <2d96f229beffdf8416a3f183bac8b147c4a3d77f.camel@vmware.com>
References: <20230315161442.27318-1-tzimmermann@suse.de>
 <20230315161442.27318-3-tzimmermann@suse.de>
In-Reply-To: <20230315161442.27318-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.3-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|BLAPR05MB7347:EE_
x-ms-office365-filtering-correlation-id: 2055989f-4ce1-43b6-396f-08db25c47d4e
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gNaX17mRbKJ7RHyMoexzsJyZCDfg3/LdxdxSYJjub4VWEplEfWMOu9Rysup13WieGcM7naa1ZCHBNJEh6Lg6pzl5Er4sBT+TtaiESJjuGHFDOTlm/LdVSUeeNUhtxaCbBCmd24GXv5zk8dElm5sNzpQhvovQt5B8rUYTX9LT3EuIY9i0BVRzBjr8nCRdVR6qzmDYsd+62uE07SGZ5NaFHxigOtQ6adipupK8Vpk9QlnTa61EXW9K3CJKoLXlFOg3+WVTr/Vj7XuJs0x1Uaz6/8KlvhNpbMniMt0c9QfqTUUYwm5Tk9lVV7flR/fyHTmFkgzPXy2DBJMMmNXNDoSLAJfsPzdJ/axG+c2rqkyDrE2L/oSdxLMJToLlhWjq+weaGnHJ7nC7YKuKn+G6QXIg4ULycUWFno/5qljYlmAiZ4GtYxLgdHtGoc6qv7bdygk0nperaiIeUf75MYkqXDmgO9UvITaRQhafJBVgEfs/KoYKelizDnk09VPliil4T00kN8UcvbCrmKRjR5ty5rNzYI4HmuWl0QnNjBnuQFgCy1ruq3MiJGbzDktLWMaeVOKEU7WX8eSmPpW0otVdAsCPEr/1KIPP6inaREgdb1lIQ9f5m2HwWk1R1GLnCtXhaR3jT5tkq8tRlZXRtC7xppFRXvC/KYV6QwDoG1qwKOb/LfrJWFyRb9Dp+0S5cC+Utxx5+D0SoDWs83zWOjO9yACfRzTpHnRa3Tqb3BN57PsDejsb5Zm2cM94uYdgzOe5SSeP
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199018)(38100700002)(86362001)(38070700005)(921005)(122000001)(36756003)(2906002)(41300700001)(5660300002)(8936002)(6512007)(6506007)(2616005)(26005)(186003)(316002)(83380400001)(110136005)(64756008)(66446008)(66476007)(66556008)(8676002)(91956017)(478600001)(6486002)(66946007)(71200400001)(76116006)(41533002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmpOWjRKWDlSb3IwNmFnMnNEK2krTHBIenJLRkxaRThpYlZENzNCaVZGVjJu?=
 =?utf-8?B?eW1hQlErczV5RXpFeUdiTWwxa3BsWWNQQkRGdFdWaXc3QmF3MjJUdjdvUldO?=
 =?utf-8?B?eEJmMmMrSURCbFpDTHlianlUaHJtd3diNFZPSG9IRXFnVXZmSUlOSkMwNkUz?=
 =?utf-8?B?YSs0UTVZK3JtUHVaTEkrQWNNZEcwYnlxdWJiaDlIQUZQYm5WWDE1Mmt3VW82?=
 =?utf-8?B?Y2pGUkxwMW1pSkJCZ08xY01KTWhoSTdUOWVGcGNFNW1lN0pwOG5jMUwraWJt?=
 =?utf-8?B?N1Nmdm5CNkN5SkF5RExoWUZsM3k4TnNuR3MxeHFWbzc3Wmg0NHVaUkdWa3dw?=
 =?utf-8?B?V1RmUWlwY2dGdEt3dFdzNXROdkxldFkrbHFSWENVQkRLRjY2dENEUEdOMHdN?=
 =?utf-8?B?cWFpNUNpd1A0S0pxUUxlVEY4TE9xTTdIWDNXbVJyanMwNmtZZG9jNk83Ny8y?=
 =?utf-8?B?QnZ1cUpnZFB4VVJmaEJBdmN6blpXcmV4TnV1ZVpxV2NXeUhkZGp3U0VyWDly?=
 =?utf-8?B?SGF5eXMzbUlsUmhDQjNmTnlaTDFRRHZQM0I5cDZLWVgzL05tRUhIb0N4dFRS?=
 =?utf-8?B?eWJVWlExNVpWQU9sRDJRcEdkSUIxa2tPdmNMMGtZL0dpYXJOMEVBU1Q2bm5Q?=
 =?utf-8?B?dFExeHByYkVrYmc2Ri9HUlFlZ3ArN2svT0VVb2d2bE1jS2o4bUFHcUx1Wjdy?=
 =?utf-8?B?Yytpanh6NVdFMGNuL0huU2p3UTlQSGNUa3JaMDFlZlE1eXQvaHRpWVJTWXNC?=
 =?utf-8?B?QTlJUkwxRDlRUWF0L1p6anBkTTMzU2lNUEg1Y1pQcEtRbE1oclc0NnlLNzQ4?=
 =?utf-8?B?MTRBUUFZaXM0OUE3ZDA4Y3IyMFBxbXNGTFVEelJyNC9sRkdJSkhGbzBvb2ND?=
 =?utf-8?B?ODN2TkZLb1lCNngwVTBUSmdUYXNCbDFDVmhHOVNPTWYzSi9XYkJYalk2OFY3?=
 =?utf-8?B?RFlCUW4vWXl3OW8wYU9ZejNZaFcySjkydWQzS2hvc0RNNko0UWEzYUJYTSsy?=
 =?utf-8?B?T3Z2dnJkWkFMdlQvVFllM3JRbW9UcXF0Z3hIUTVrMUxNQ1BUSUVQTkdtRE9N?=
 =?utf-8?B?Wm1COW5wa29wSTdvbkRlR0VyUEw0TEZVSVpSdTVQbWFuNFVtT3QwQTM1RWJw?=
 =?utf-8?B?MVpQMnRrU3N6b2I3SmVodS84M2dQYUMvT2xzckJVekhlZE9UL0c4WUhjK1hL?=
 =?utf-8?B?akNRd0tsVFlqeGl5RTAwVWd1MDllRkhuVnBjTDJaKzk3WFlpRnUzMXFFRk1x?=
 =?utf-8?B?RHlKRXBvM3pJd29jVXN4N3NzN2o1THB1S3A3NkVpTGM2dVJ6djVud0lydHBz?=
 =?utf-8?B?aDlOTlplNzFNUkJzUUNMVjEyVmNoMktFNGthL244OXM2SnltdkNrWml5em5a?=
 =?utf-8?B?L0pBN3JNeHZLYUR3V1VVU21aVWE0emhGNVFWdDhnL2QyOHBFL1VZU1NRdGVF?=
 =?utf-8?B?NHBHQ2hTUkxyVW0zMVBxaDhoTitlZEtGaFlLLzdRSC80Y05oWWFqQ1VQZzdW?=
 =?utf-8?B?Z2pxd0s3L1dRR1JFeXVhcmI5M0NIaFBHTEE4K2pJS3ExWS9Lb1Z3TkxPeks0?=
 =?utf-8?B?S3J3VWRyNElTUGlZVzNBVml5dmxqcjVqR0d3d1V6TXJCNVJ1dGlQVzI2RVcw?=
 =?utf-8?B?elIwbWpLY1BkVnBQbUU1SEQ0Wlc4bHY5Z1o4cVRLUHFSazJnOTRDcmYxQlJK?=
 =?utf-8?B?SG9yT2lQVThXWFNlQm1Yb1RZYk5ranBFK2NRckdQc21uWEJwekNZWTJ5M1Zm?=
 =?utf-8?B?cmRWWDdINi9iRU5vY2pDVFJVSk9Rd3I1MGJxNHlPTU04U0xSaTFMQmYyUTNE?=
 =?utf-8?B?T3p6c2xRaGdBMVFXM0QxTUN1Q29lejlkbHpZc3Yvd0xkMHl5S0ZyeHlBY2hT?=
 =?utf-8?B?S1RYbktjV244TXhZaVdtekR6eHhXT1FldVl0N3ZqMGwxRGhMT2ViY0lmbFRw?=
 =?utf-8?B?UnRKb2VieHJJMmprcXptM2hoVDNTTzJ0RUJNYy95RDhTb21YbnVhWS9Sek1v?=
 =?utf-8?B?RHpHYUpCWHptZUxJQjdidXNmS1NoV25zK1FuNDVmQjN2TW40bk1PbEFwUUZF?=
 =?utf-8?B?T1oxS05venpGdnNxMXQwU2RNTXE0S1l6d2paNEdrLzNpQ0g3SmtUTnNWVVg3?=
 =?utf-8?Q?+nE8/4yIQY7zuuuKbUQi13+If?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A988B9C00C86FE4A96E32D9468F8A471@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2055989f-4ce1-43b6-396f-08db25c47d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2023 02:16:44.8684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /zlhkNKq8GT73FRDcV6jXUbGTqboHMXxPIOdyoLPWjJ+yn4yWrMNo+rjoyfqMEdnoyyvyg+J5aDC35Cl9vhN3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR05MB7347
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

T24gV2VkLCAyMDIzLTAzLTE1IGF0IDE3OjE0ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gUmVtb3ZlIHRoZSBmbGFnIHByZWZlcl9zaGFkb3dfZmJkZXYgZnJvbSBzdHJ1Y3QgZHJt
X21vZGVfY29uZmlnLg0KPiBEcml2ZXJzIHNldCB0aGlzIGZsYWcgdG8gZW5hYmxlIHNoYWRvdyBi
dWZmZXJpbmcgaW4gdGhlIGdlbmVyaWMNCj4gZmJkZXYgZW11bGF0aW9uLiBTdWNoIHNoYWRvdyBi
dWZmZXJpbmcgaXMgbm93IG1hbmRhdG9yeSwgc28gdGhlDQo+IGZsYWcgaXMgdW51c2VkLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmPCoMKgwqDCoMKgwqDCoCB8
IDEgLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jIHwgMSAtDQo+IMKg
aW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmjCoMKgwqDCoMKgwqAgfCA3IC0tLS0tLS0NCj4g
wqAzIGZpbGVzIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RpbnkvYm9jaHMuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2JvY2hzLmMN
Cj4gaW5kZXggMDI0MzQ2MDU0YzcwLi5kMjU0Njc5YTEzNmUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90aW55L2JvY2hzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvYm9j
aHMuYw0KPiBAQCAtNTQ1LDcgKzU0NSw2IEBAIHN0YXRpYyBpbnQgYm9jaHNfa21zX2luaXQoc3Ry
dWN0IGJvY2hzX2RldmljZSAqYm9jaHMpDQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBib2Nocy0+
ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsNCj4gwqDCoMKgwqDCoMKgwqDC
oGJvY2hzLT5kZXYtPm1vZGVfY29uZmlnLnByZWZlcl9zaGFkb3cgPSAwOw0KPiAtwqDCoMKgwqDC
oMKgwqBib2Nocy0+ZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJfc2hhZG93X2ZiZGV2ID0gMTsNCj4g
wqDCoMKgwqDCoMKgwqDCoGJvY2hzLT5kZXYtPm1vZGVfY29uZmlnLnF1aXJrX2FkZGZiX3ByZWZl
cl9ob3N0X2J5dGVfb3JkZXIgPSB0cnVlOw0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgYm9jaHMt
PmRldi0+bW9kZV9jb25maWcuZnVuY3MgPSAmYm9jaHNfbW9kZV9mdW5jczsNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+IGIvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMNCj4gaW5kZXggODRkNjM4MGI5ODk1Li41MTYyYTdhMTI3
OTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jDQo+IEBAIC0yMTEyLDcg
KzIxMTIsNiBAQCBpbnQgdm13X2ttc19pbml0KHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYp
DQo+IMKgwqDCoMKgwqDCoMKgwqBkZXYtPm1vZGVfY29uZmlnLm1heF93aWR0aCA9IGRldl9wcml2
LT50ZXh0dXJlX21heF93aWR0aDsNCj4gwqDCoMKgwqDCoMKgwqDCoGRldi0+bW9kZV9jb25maWcu
bWF4X2hlaWdodCA9IGRldl9wcml2LT50ZXh0dXJlX21heF9oZWlnaHQ7DQo+IMKgwqDCoMKgwqDC
oMKgwqBkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IGRldl9wcml2LT5hc3N1bWVf
MTZicHAgPyAxNiA6IDMyOw0KPiAtwqDCoMKgwqDCoMKgwqBkZXYtPm1vZGVfY29uZmlnLnByZWZl
cl9zaGFkb3dfZmJkZXYgPSAhZGV2X3ByaXYtPmhhc19tb2I7DQo+IMKgDQo+IMKgwqDCoMKgwqDC
oMKgwqBkcm1fbW9kZV9jcmVhdGVfc3VnZ2VzdGVkX29mZnNldF9wcm9wZXJ0aWVzKGRldik7DQo+
IMKgwqDCoMKgwqDCoMKgwqB2bXdfa21zX2NyZWF0ZV9ob3RwbHVnX21vZGVfdXBkYXRlX3Byb3Bl
cnR5KGRldl9wcml2KTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZp
Zy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVfY29uZmlnLmgNCj4gaW5kZXggZTViMDUzMDAxZDIy
Li45NzMxMTlhOTE3NmIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZp
Zy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2RlX2NvbmZpZy5oDQo+IEBAIC04OTAsMTMg
Kzg5MCw2IEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWcgew0KPiDCoMKgwqDCoMKgwqDCoMKgLyog
ZHVtYiBpb2N0bCBwYXJhbWV0ZXJzICovDQo+IMKgwqDCoMKgwqDCoMKgwqB1aW50MzJfdCBwcmVm
ZXJyZWRfZGVwdGgsIHByZWZlcl9zaGFkb3c7DQo+IMKgDQo+IC3CoMKgwqDCoMKgwqDCoC8qKg0K
PiAtwqDCoMKgwqDCoMKgwqAgKiBAcHJlZmVyX3NoYWRvd19mYmRldjoNCj4gLcKgwqDCoMKgwqDC
oMKgICoNCj4gLcKgwqDCoMKgwqDCoMKgICogSGludCB0byBmcmFtZWJ1ZmZlciBlbXVsYXRpb24g
dG8gcHJlZmVyIHNoYWRvdy1mYiByZW5kZXJpbmcuDQo+IC3CoMKgwqDCoMKgwqDCoCAqLw0KPiAt
wqDCoMKgwqDCoMKgwqBib29sIHByZWZlcl9zaGFkb3dfZmJkZXY7DQo+IC0NCj4gwqDCoMKgwqDC
oMKgwqDCoC8qKg0KPiDCoMKgwqDCoMKgwqDCoMKgICogQHF1aXJrX2FkZGZiX3ByZWZlcl94Ymdy
XzMwYnBwOg0KPiDCoMKgwqDCoMKgwqDCoMKgICoNCg0KRm9yIHRoaXMgb25lOg0KUmV2aWV3ZWQt
Ynk6IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQoNClRoZSBlbnRpcmUgc2VyaWVzIGxv
b2tzIGdyZWF0LiBJIHRoaW5rIGl0J3MgYSBncmVhdCBjbGVhbnVwOg0KQWNrZWQtYnk6IFphY2sg
UnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQpGb3IgdGhlIHJlc3QuDQoNCnoNCg0K
