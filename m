Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E0753C03
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 15:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1807F10E88A;
	Fri, 14 Jul 2023 13:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE210E88A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 13:48:07 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36EBU203000769; Fri, 14 Jul 2023 14:47:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=1lA+mq5XzbBPcd8W1qb78e2JEa3PrMd4Xwwf9qj0aYY=; b=
 INjFM2CI1mAxU/ZQvVckSXt+W8ynxOhMYvn/qWwPJjWp7BWvqoeu/aa59yvpl5jm
 Qd9JGOyY2S3vR1futuDJX94ILmDwaUcKzJlFSnGpCclpIe1OceDyo4t0hJWYwzMQ
 Uk2UJYfK4yLaMBQ+CEHLVFIGbl3hHJxIp4wDix7AAPShput74jEcFjKyJAHT134+
 EURxuvusmmo5Itc59jXMA6ZaHemGbK6JN2xO5V8Eozf18tGY8uTWWepPKo+ZQ/kn
 fG1VjKXf6TJyEMOVXSpQuzaNnvv0qi6m8UtYHFeuDJjT2jyQWo3aNR1V3NGoCCmI
 6eLGP/2gNzmcZlxlEBqiSw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3rtpu8gkgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 14 Jul 2023 14:47:16 +0100 (BST)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 14:47:15 +0100
Received: from GBR01-CWL-obe.outbound.protection.outlook.com (104.47.20.54) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27 via Frontend
 Transport; Fri, 14 Jul 2023 14:47:15 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXazYmMB9xPIg5Rzq1qvDzmjabWXDKJZ/abNDGaD8m1kyg8f74DCODPDX4r9c24NxEtKK9K7/1tBjqIRxfkQyymFGhCobcDqCpXl3qyIiMI46gjB4U0lNgMSK4FyQrIp4Oux1ECqpegnLdIDOocPjMmuLcRjmZKsUku3RsNpSeJeMec+E6lige3jVgi/a3C5njt+zSYRg21Ze7E+vl/B3X3u07P1LgfrG3NnKXteXMStfjwm1X54UENv4DuTYYoJEBkBhQoHMcWQx7GxgsxJbrjhtgFXS0g62l/quNMFtnIbtuMF1Alk3VL/XaNzU/Q+4rNW1OMupGQa6jan/pPehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lA+mq5XzbBPcd8W1qb78e2JEa3PrMd4Xwwf9qj0aYY=;
 b=T68T/gRjzxWcgpo+W/pwt8GE43as9eXsDIdqLvKv6Ph8IzYiFipUCUf6EhrkKNYxh3EkofKiPvWU//iNUI/C4zNBvz7BkZr9ViQdOnWZSQ7c/AXrnZC9C2DOsfV3drgM1yBQoH4pkOxUc3H/YcWmDSAkXK1z7hb0dkavwiH0e4CCpTA9V+cBiDigrP0asa14AU7vL66HM96qnUQGUHfQZVbIiGPCgBNpEyQgawfjkQNMpcvXqCibrKUzlRADVxnhk6/QYMbQeeGfRMEuaK0MdsX2FYifNSHLA8amW3DJPdk4AwV/YfxO8Sys5bdGgGSwYIpJIKtY5YiMK2LJBSK5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lA+mq5XzbBPcd8W1qb78e2JEa3PrMd4Xwwf9qj0aYY=;
 b=ahmGUGKNyBKoMMIUdZzpZxRUDsKQZt/L6RX5r07iahrG2K/gvnRcCvKg9jqKuIRRoHSzPaOodhbPqAUXqcMW8rCbfpdc4rMrFE8zA17yylrkOifX5TWgW28rczdiuhsomVAXwDrXXkkV8d3tcCy9VKfPYNP6jcw7ta0Hotfn7Qg=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO6P265MB6906.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:325::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.27; Fri, 14 Jul
 2023 13:47:13 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::d3b4:38d6:d07b:2c1c%3]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 13:47:13 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "mripard@redhat.com" <mripard@redhat.com>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH v3 09/17] drm/imagination: Implement power management
Thread-Topic: [PATCH v3 09/17] drm/imagination: Implement power management
Thread-Index: AQHZngYXXGizi3+ZV0S8qEHsyrETfK+uZoAAgAsQ1oA=
Date: Fri, 14 Jul 2023 13:47:13 +0000
Message-ID: <6339fcd1f4729747da309c0d774e0efb27986728.camel@imgtec.com>
References: <20230613144800.52657-1-sarah.walker@imgtec.com>
 <20230613144800.52657-10-sarah.walker@imgtec.com>
 <twmetot6wcg5j7wnqy2gqohhrwhsgaizz5psou5etur6cavjjj@fwky6irlxubt>
In-Reply-To: <twmetot6wcg5j7wnqy2gqohhrwhsgaizz5psou5etur6cavjjj@fwky6irlxubt>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO6P265MB6906:EE_
x-ms-office365-filtering-correlation-id: 33ea5a35-34e3-43d3-1efb-08db8470d47a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fJqRsD/Byq0CmI4WhIt+3ne418kgQret+A2K155ZE5fR8mS2Z9jqEo/KUoWD2D1295H31aLbdoBRDB0udfaneeXP2KSuieo8CP1S7pISIXAlA2ZRY4i1QiT/6xNL5WY+rC7Tqw67AHshV5/cgLplDy74I8dJjjH2vrwFq5onfFHlDijZggsXAds23KeHbkKiAl+fFCJTzkNgyjzbdq3KC4xwGzzYLDjSRQ2uloiVXyhNJanvwUE9mE8V1E6PaIdSclw1b5xbgm+K0cgYr7j9S6WdLx+cBOfaB7H6hwTkHVmNipL0a6ujXkEPRcjYt892rFH9a92R/kFmZ3brLLIxdg8bct8AsNJz+wEgehqzCq9O0JQ9AuBVYA/aoNBqBl8gF9/G+np0m8lIWH1TnK2HKAhExiqWYHsVr5JhFrKO2XGwulOXAmSz9ehDRd87L9UiB7GaCTm1mnMjGNGjcjwByR7yCuZbX+6CDEjzQ86yzF2bJ0aSoGiYDUaesKKzUbgxszkT2P0LZDuOGL7CqQQVpw8U1jMOpiGLeYluxyHbBmitcAzf2Ia67V+/CVScdfV8hGFXDmLMU0ISrR7q7Np3RVUb1Jtgn2T3sCGhkGKCwsWWvd6s8k6B0pKZXtHDYsPd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39850400004)(346002)(376002)(396003)(366004)(136003)(451199021)(6512007)(6486002)(71200400001)(83380400001)(186003)(2616005)(36756003)(122000001)(38100700002)(38070700005)(86362001)(26005)(6506007)(66946007)(66446008)(64756008)(66476007)(76116006)(66556008)(4326008)(6636002)(54906003)(110136005)(41300700001)(5660300002)(8936002)(316002)(8676002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YllDTmVuZmtrdWFjNWNxSFhFaGlQck1hU0xBV3BrOTRtZDJZK3NMN1p3bXF4?=
 =?utf-8?B?TVFJTElnVXhjNDF6VVg0S2FoWG00T05KeTZLOEZSV0tKMUpjNllORlg4d2Zn?=
 =?utf-8?B?VW1hSnFLaWViYXVEc3JFR3pYMWxtcGZnQWJ5aXJnb2E3VmYxU1VWZTI2Nlp3?=
 =?utf-8?B?SmZtVm1LY0VYSnRReGdIelJJcjJkRUxBNXpGS1BVRXRwUTdmR1M4UDRuczBu?=
 =?utf-8?B?U0E5WlZQaXAyTE5WbXp2WTRKeUwveDFDc0V4WjNjRDhFenVSZ21oaHpiSndz?=
 =?utf-8?B?VEozMFFTTy9adEx5SGJqalIzSVdMVEFRL2JRRzN4bDM0alhKWUJDN3dFSDgv?=
 =?utf-8?B?WXRFUkNJNENhVGJlaUR5bXRYYzZJS1FtUXpCTEpYeDA1OElkZkwzb0tCaTJi?=
 =?utf-8?B?K2tyVTZXaiszWUVkN3dOOS9yR2dqendmVngrQ0QvZE5kakt6WXdBajl6UGVU?=
 =?utf-8?B?WSs0MEorZjZwZzczMUZ2bjdLZURHaGcrNm9NRFV6QzlyckFhUk5aamM3VHRo?=
 =?utf-8?B?ZGNyQnpmbGtlRG5jRlZES3Jxamg4RTJBZUlmM1V4VGcrS0hxL0dCTVFrbEtQ?=
 =?utf-8?B?L1NQV1Q5cDYybVdWT3d5ZmIrSUowOGxuTkYwdWZTNU1pTW5CL1ljUU5WRXVa?=
 =?utf-8?B?bXkrcWt2VDFWVGVLRHppSFlDaU9xM3l4YVp4b01RWVJsUUFNRm5MckJlT080?=
 =?utf-8?B?bTFwVXpxRE1MejdoSXh1Mm5ZOGhFU1lKRW9sYmlRRU1xUm84cWUweS93K0Rk?=
 =?utf-8?B?NDd3dXRtSlFMVEF2NUYxV0ZyZEZPWlZ3SUNRbVUzbDA0dDh5U2tja01KT3p1?=
 =?utf-8?B?c1RKcHpBekRQYnpOY2YreE9KL05NODkwUElVeUljd3RmSjZra0RlWnliWUZN?=
 =?utf-8?B?aU1DYlpzcitLbzVDeW5pbzhaRXdhSGJCS2hlaHMybzJkaGdqTms4bk5nYU5y?=
 =?utf-8?B?WkwwbGZzayszblRBVHdvbVQ0d2RzdUN0U1VraEVrWEJSa1RDZjFLbWlqdDJn?=
 =?utf-8?B?YXVqSmtlT3ViUDdHOFA5SGVvM2x5NmR2bTIvbFNMU0psK0hEVFBNTXBNN2Q5?=
 =?utf-8?B?bTFmZUsycm1NMW10S1d1cytWdW9hcGJ5Q0IvbUlMWjUyNk55UzZ1eUh6MlBR?=
 =?utf-8?B?cEIvNU1UdVEySmc5Rkw1dTNYa1F4WlB5K0dkK0RHRjlWbktpeXpVVkR6NW93?=
 =?utf-8?B?Zjl5MVhWVEw0MVJRYmpGU2tSb0hIOFM4S3dBWTlLaDh3TUtMVzUrYURNRkRv?=
 =?utf-8?B?bFYwZnRqak52QzhNdWpFYmVrd05lSFhDQ1dFWWY0NDB4N3Ztd1NNWXdjVk5n?=
 =?utf-8?B?RUdwa1NXVnRMTlJtdHcyMXhtcE9XRVB6cG12VWNPZmE3V2tnMitUdmU3UU10?=
 =?utf-8?B?RTdIMzZ4WGhKSDNad0JaeTVtQm42c3Q4bFB0L0ROMnJqdi9ZeldFd1FXcHFW?=
 =?utf-8?B?ZnRUakJaYVM2b0dNeWFXL0xHL0RoYWE5MEdqaUR5VGE4SURpZmkwc0lnN0hB?=
 =?utf-8?B?MUQ1VzQ5UUV0aFZkS0FHZFdzNnltT01pbHJwbVBIUlVvYVhLZ1hHb2xFcnpY?=
 =?utf-8?B?cStXdEdSYmkvYnFiSzJONW5Hc1JqNmFzRlBPaVF4dXk2U2xhTDhkWHdHSWJM?=
 =?utf-8?B?ZUJZQ2V1d1c0R0lyeGZwMXBhMTMyVndxUWhUK2JqT0dMREJSSzlUcC9XdHRK?=
 =?utf-8?B?eHRMY01LYVJGZ3gwZE11cmpZczllN3BYRVNPMmJaVGpMeFJwajMzUzRZZ3V5?=
 =?utf-8?B?R0NVOXdNRExGQjk2ZUJuc0JOd1kwTGp2Y1NlOWNLN0Z3QlRSVnh2ZXI4ZHdz?=
 =?utf-8?B?VFB3V0locHJhYTAyUTlIVFhjVU94NjU3NWMyY0RUWXpGbnNhbHlkWHBhNGw0?=
 =?utf-8?B?dFdTNFlzcHF0ZkErdTVJUVZGY3U5eXV0ZUd3c3pWVGJ3Nk5CbFgvUURzN1JZ?=
 =?utf-8?B?VGlpQ1ByUjZIbzNuUVFrb09nK0g2dE1FbUZIYjlJVHlhRXJpR2lkTGpBZEU2?=
 =?utf-8?B?ZCtNTXkraUFCb0pvZytNS2czVGZiMHZ3cTRKU1JyNDhGdHlmOEJzM1lWaUQz?=
 =?utf-8?B?VUpsUVhMRGpwMGhnS0x0TmxwQkhsL2pLYmx1L0w4K1dCWC9uN3RYOTNldzVT?=
 =?utf-8?B?QnNDS3VvTDhWbGxZK21la3ZtT1dySVNvQStMWHNNNlQzZG9rWHQ3dHVod2JU?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BBD50FEADC5064BB3ABC30A8C0E152D@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 33ea5a35-34e3-43d3-1efb-08db8470d47a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 13:47:13.8777 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7aApp7gAQ2lV4F5LBE0se5oXdyukSXyxRF1cyjPPcaiAcrcxxYmf7ZD8VOdhmhYFSII/czImIZ0B8hHnnag0kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6906
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: ZmxGWgEDX3LFONWNfL64f7B3gfSY4ZSW
X-Proofpoint-ORIG-GUID: ZmxGWgEDX3LFONWNfL64f7B3gfSY4ZSW
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

SGkgTWF4aW1lLA0KDQpPbiBGcmksIDIwMjMtMDctMDcgYXQgMTQ6NDggKzAyMDAsIE1heGltZSBS
aXBhcmQgd3JvdGU6DQo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDAzOjQ3OjUyUE0gKzAxMDAs
IFNhcmFoIFdhbGtlciB3cm90ZToNCj4gPiBAQCAtNTAzLDIxICs1MDYsMzEgQEAgcHZyX2Rldmlj
ZV9pbml0KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQ0KPiA+ICAgICAgIGlmIChlcnIpDQo+
ID4gICAgICAgICAgICAgICBnb3RvIGVycl9kZXZpY2VfY2xrX2Zpbmk7DQo+ID4gDQo+ID4gKyAg
ICAgLyogRXhwbGljaXRseSBwb3dlciB0aGUgR1BVIHNvIHdlIGNhbiBhY2Nlc3MgY29udHJvbCBy
ZWdpc3RlcnMgYmVmb3JlIHRoZSBGVyBpcyBib290ZWQuICovDQo+ID4gKyAgICAgZXJyID0gcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldChkZXYpOw0KPiA+ICsgICAgIGlmIChlcnIpDQo+ID4gKyAg
ICAgICAgICAgICBnb3RvIGVycl9kZXZpY2VfY2xrX2Zpbmk7DQo+ID4gKw0KPiA+ICAgICAgIC8q
IE1hcCB0aGUgY29udHJvbCByZWdpc3RlcnMgaW50byBtZW1vcnkuICovDQo+ID4gICAgICAgZXJy
ID0gcHZyX2RldmljZV9yZWdfaW5pdChwdnJfZGV2KTsNCj4gPiAgICAgICBpZiAoZXJyKQ0KPiA+
IC0gICAgICAgICAgICAgZ290byBlcnJfZGV2aWNlX2Nsa19maW5pOw0KPiA+ICsgICAgICAgICAg
ICAgZ290byBlcnJfcG1fcnVudGltZV9wdXQ7DQo+ID4gDQo+ID4gICAgICAgLyogUGVyZm9ybSBH
UFUtc3BlY2lmaWMgaW5pdGlhbGl6YXRpb24gc3RlcHMuICovDQo+ID4gICAgICAgZXJyID0gcHZy
X2RldmljZV9ncHVfaW5pdChwdnJfZGV2KTsNCj4gPiAgICAgICBpZiAoZXJyKQ0KPiA+ICAgICAg
ICAgICAgICAgZ290byBlcnJfZGV2aWNlX3JlZ19maW5pOw0KPiA+IA0KPiA+ICsgICAgIHBtX3J1
bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRldik7DQo+ID4gKw0KPiANCj4gWW91IHByb2JhYmx5IGNh
biB1c2UgcG1fcnVudGltZV9wdXQgaGVyZQ0KDQpBY2sNCg0KPiANCj4gPiBAQCAtNTMyLDEyICs1
NDUsMTcgQEAgcHZyX2RldmljZV9pbml0KHN0cnVjdCBwdnJfZGV2aWNlICpwdnJfZGV2KQ0KPiA+
ICB2b2lkDQo+ID4gIHB2cl9kZXZpY2VfZmluaShzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikN
Cj4gPiAgew0KPiA+ICsgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZnJvbV9wdnJf
ZGV2aWNlKHB2cl9kZXYpOw0KPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGRybV9kZXYt
PmRldjsNCj4gPiArDQo+ID4gICAgICAgLyoNCj4gPiAgICAgICAgKiBEZWluaXRpYWxpemF0aW9u
IHN0YWdlcyBhcmUgcGVyZm9ybWVkIGluIHJldmVyc2Ugb3JkZXIgY29tcGFyZWQgdG8NCj4gPiAg
ICAgICAgKiB0aGUgaW5pdGlhbGl6YXRpb24gc3RhZ2VzIGluIHB2cl9kZXZpY2VfaW5pdCgpLg0K
PiA+ICAgICAgICAqLw0KPiA+ICsgICAgIHBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsNCj4gPiAg
ICAgICBwdnJfZGV2aWNlX2dwdV9maW5pKHB2cl9kZXYpOw0KPiA+ICAgICAgIHB2cl9kZXZpY2Vf
cmVnX2ZpbmkocHZyX2Rldik7DQo+IA0KPiBBRkFJSyBncHVfZmluaSByZWxlYXNlcyB0aGUgZmly
bXdhcmUgYW5kIHJlZ19maW5pIGRyb3BzIHRoZSByZWdpc3Rlcg0KPiBtYXBwaW5nIGFkZHJlc3Ms
IEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdGhlIGRldmljZSBwb3dlcmVkIHVwIGZvciB0aGF0Lg0K
DQpWZXJ5IHRydWUsIHdlJ2xsIGZpeCB0aGF0IDopDQoNCj4gDQo+ID4gQEAgLTEzMCw2ICsxMzMs
MjAgQEAgc3RydWN0IHB2cl9kZXZpY2Ugew0KPiA+IA0KPiA+ICAgICAgIC8qKiBAZndfZGV2OiBG
aXJtd2FyZSByZWxhdGVkIGRhdGEuICovDQo+ID4gICAgICAgc3RydWN0IHB2cl9md19kZXZpY2Ug
ZndfZGV2Ow0KPiA+ICsNCj4gPiArICAgICBzdHJ1Y3Qgew0KPiA+ICsgICAgICAgICAgICAgLyoq
IEB3b3JrOiBXb3JrIGl0ZW0gZm9yIHdhdGNoZG9nIGNhbGxiYWNrLiAqLw0KPiA+ICsgICAgICAg
ICAgICAgc3RydWN0IGRlbGF5ZWRfd29yayB3b3JrOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAg
IC8qKiBAb2xkX2tjY2JfY21kc19leGVjdXRlZDogS0NDQiBjb21tYW5kIGV4ZWN1dGlvbiBjb3Vu
dCBhdCBsYXN0IHdhdGNoZG9nIHBvbGwuICovDQo+ID4gKyAgICAgICAgICAgICB1MzIgb2xkX2tj
Y2JfY21kc19leGVjdXRlZDsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAvKiogQGtjY2Jfc3Rh
bGxfY291bnQ6IE51bWJlciBvZiB3YXRjaGRvZyBwb2xscyBLQ0NCIGhhcyBiZWVuIHN0YWxsZWQg
Zm9yLiAqLw0KPiA+ICsgICAgICAgICAgICAgdTMyIGtjY2Jfc3RhbGxfY291bnQ7DQo+ID4gKyAg
ICAgfSB3YXRjaGRvZzsNCj4gPiArDQo+ID4gKyAgICAgLyoqIEBsb3N0OiAldHJ1ZSBpZiB0aGUg
ZGV2aWNlIGhhcyBiZWVuIGxvc3QuICovDQo+ID4gKyAgICAgYm9vbCBsb3N0Ow0KPiANCj4gVGhl
IGRldmljZSBiZWluZyAibG9zdCIgaXNuJ3QgY2xlYXIgdG8gbWUuIERvZXMgaXQgbWVhbiBpdCdz
DQo+IHVucmVzcG9uc2l2ZSBvciBzdHVjayBzb21laG93Pw0KDQpUaGUgZm9ybWVyLiBGb3IgZXhh
bXBsZSwgdGhpcyB3aWxsIGJlIHNldCB3aGVuIHRoZSBmaXJtd2FyZSBoYXMgYmVjb21lDQp1bnJl
c3BvbnNpdmUgYW5kIGhhcmQgcmVzZXR0aW5nIHRoZSBHUFUgZG9lc24ndCByZXNvbHZlIHRoaXMu
IFdlJ2xsIHVwZGF0ZSB0aGUNCmRvY3MgdG8gY2xhcmlmeS4NCg0KPiANCj4gPiBAQCAtMTI4NSw5
ICsxMzAzLDE1IEBAIHB2cl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwbGF0X2RldikN
Cj4gPiANCj4gPiAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwbGF0X2RldiwgZHJtX2Rldik7
DQo+ID4gDQo+ID4gKyAgICAgZGV2bV9wbV9ydW50aW1lX2VuYWJsZSgmcGxhdF9kZXYtPmRldik7
DQo+ID4gKw0KPiA+ICsgICAgIHBtX3J1bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KCZwbGF0
X2Rldi0+ZGV2LCA1MCk7DQo+ID4gKyAgICAgcG1fcnVudGltZV91c2VfYXV0b3N1c3BlbmQoJnBs
YXRfZGV2LT5kZXYpOw0KPiA+ICsgICAgIHB2cl9wb3dlcl9pbml0KHB2cl9kZXYpOw0KPiANCj4g
VGhlIG5hbWUgdGhyZXcgbWUgb2ZmIGEgYml0LiBJdCBkb2Vzbid0IGxvb2sgbGlrZSBpdCdzIHBv
d2VyIHJlbGF0ZWQgYnV0DQo+IHlvdSBpbml0IHRoZSB3YXRjaGRvZyB0aW1lcj8NCg0KWXVwLCB3
ZSdsbCB1cGRhdGUgdGhlIG5hbWUgdG8gcmVmbGVjdCBpdHMgcmVhbCBwdXJwb3NlLg0KDQo+IA0K
PiBJIGNhbid0IHJlYWxseSB0ZWxsIGZyb20gdGhhdCBwYXRjaCwgYnV0IGlmIGl0J3Mgbm90IGRv
bmUgaW4gYSBsYXRlcg0KPiBwYXRjaCB5b3UnbGwgcHJvYmFibHkgbmVlZCBhIGNhbGwgdG8gc3By
aW5rbGUgeW91ciBkcml2ZXIgd2l0aCBhIGZldw0KPiBfbWFya19sYXN0X2J1c3kgY2FsbHMgKGF0
IGxlYXN0IGluIHRoZSBqb2Igc3VibWlzc2lvbiBwYXRoPykNCg0KV2Ugd2VyZW4ndCBkb2luZyB0
aGlzIGJlZm9yZSBzbyB3ZSdsbCBhZGQgc29tZSBjYWxscyBpbi4NCg0KVGhhbmtzDQpGcmFuaw0K
DQo+IA0KPiBNYXhpbWUNCg==
