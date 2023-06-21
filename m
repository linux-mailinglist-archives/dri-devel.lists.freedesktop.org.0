Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B67385E7
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B9610E47F;
	Wed, 21 Jun 2023 13:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2042.outbound.protection.outlook.com [40.107.7.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4494710E3EA
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 07:57:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+8wzBNFtzKtJXITq+VYgD+1DGwfPpKVK97MjbUC1/7B4CQVvoTcmzN0qhDhPhudcQjsfhOXlWP3/t63hMIHRq1FaekV0NO2rJ4nPTnlG87Asow70UKwR0Jx3Hzs3eTN51Xxli57gM6wWmRxBvYeIFeQ3EqMtpozUYiaax2ltMNTJxXKaHJpo2kcB1PSwjqXh7DoEiLcbiVTgUY059JzhmsJ0AECn/Lego07SbpXAhixDNmKct0XG+JAHb7PeBNWUSyRSdBxe9jzn7xuRBd5VrHQwIwYf4ba2AdEp0EkkPhSHwwiTjFBgMs+6RMPkRRtlxVaU8rj1IYY6C7wYECFXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPsvfmcn9x7SwDvk0nftfA3S56wry3N8qTIQ/vkpDNQ=;
 b=mTv4EGMGt71yKFBfDt77GJPcB6kYC3hnWaVC045+fxSS+Wnp4BYvhy4h9e+S40Ws+IM8V921w9/srk3E/o8r8YoYVjFT6DrOdWYK+RHsKgVrVI4zaXmC8mENx+R5HsLMciZP2b7zs6E3yuPKp+M+eOtyBunMV6jCtdn0YWe+AYO85cBQAfdxU/fPCcfImnLopItVXwmWkCXVRC1ndNQXK6/TR0v28Qc8EH3xrW8sejW1GnZ39pFnElDO754VIGHrXCHQyWl63fT0kSF5woLlhYabkUWE4qvijtZktLRJQf1NUvLF2EzU/iGj4zDpl6XnuAIGl2EB19KGOhcQRYNGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sPsvfmcn9x7SwDvk0nftfA3S56wry3N8qTIQ/vkpDNQ=;
 b=iron8qNt2rnpRCoTSrbPNwh9bZJX/PRjn8sqe89Kxne9JILbbxF88cSPvGLva+Zmow1xK4Qp8uXLTGH7lH1PUHP50f2lI44rQbZHnF1Oe9M22rPcNIdbCN0sIcMszFGd0u+C5be8uPyB2DkrYfhiiIbr9BQl9OBz0UlrErJ+3cA=
Received: from DB9PR04MB9990.eurprd04.prod.outlook.com (2603:10a6:10:4ee::19)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 07:57:20 +0000
Received: from DB9PR04MB9990.eurprd04.prod.outlook.com
 ([fe80::6a32:74f3:6cce:3760]) by DB9PR04MB9990.eurprd04.prod.outlook.com
 ([fe80::6a32:74f3:6cce:3760%4]) with mapi id 15.20.6521.023; Wed, 21 Jun 2023
 07:57:20 +0000
From: Jessie Hao <juan.hao@nxp.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dma-buf: keep the signaling time of merged fences
Thread-Topic: [PATCH] dma-buf: keep the signaling time of merged fences
Thread-Index: AdmkFVxBKBCNL/s4Rz2863VkrE76uQ==
Date: Wed, 21 Jun 2023 07:57:20 +0000
Message-ID: <DB9PR04MB9990B43E0722ECD4ADACD1EF8B5DA@DB9PR04MB9990.eurprd04.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9990:EE_|VE1PR04MB7278:EE_
x-ms-office365-filtering-correlation-id: 95f05240-3d9b-4abd-6f26-08db722d2416
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pwP59Yr3PVcecPup4iW52Z/eRErRiaiIvLjFvJXrs1iB8A/xr9de/DSFIE5PnZFKKCSdLTZ+bhWvgK7kck3JQ3f79uPt0YHYx25y+0PK8Ir3YUEou3S7yeStwkg2xXWNEmnx39Uo4mmpKew7hHqvAGDfzDsnmyuwlD60fwMQXgRYGR1yQlaZ2OfsVRE1GAE/VNIJ91QpHl5ZpdCTEtbAjs2B03JXBapGC3GEXuySrZvIRdtrxjIqSswqd9ehrsXXIzTKfkr/Pl5n4bj/G+L8Z1I7yWTbqs0WADSYpBklXEpiLDn9MxGa7TdTlGz+zHm55XRApxYX8w44TOH4KNWL2fy8HRAHheaWsGUteorOXtyUQJi313h558bwPotB1s3HrfRD1W2DOHI2wXOjbJYjZM3LSdkXcCIB+SNPuHGLDb+YvuN3gZ0p6IIMkBQXMqvKmlzuWN1rWF9uE6VTBWa7mB+elAkDeiWT7x5Bg7e0XwKuHbQBCS5PeL9FsL3iCBtgP2Y5zvgTgZqEeewfOLq6YsQ1gpECnxRUUh23/HwSxqykuevgpUIppyvekhoa1HyfJltD+fgVTXoRKS6MUgYIgQSEs5EBUMOJw3tmEDFhYZtqHK9xj+a/7jkKiAF2NdsX
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR04MB9990.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(38070700005)(86362001)(33656002)(38100700002)(122000001)(83380400001)(478600001)(110136005)(54906003)(7696005)(71200400001)(64756008)(316002)(66476007)(4326008)(66446008)(76116006)(66946007)(66556008)(55016003)(6506007)(53546011)(8676002)(8936002)(41300700001)(186003)(9686003)(2906002)(52536014)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TVdaWXUrSWNRK3ZBalJwUlJkYUlWNlk0Ty9hYmxkNzZBejl4eUJRcHkzcEo0?=
 =?utf-8?B?SmVrZWRkajNoN0hvUGVRa29qV1NqNmZGSzBHZnB4VGl2MDdrRmN3SFZKZE1W?=
 =?utf-8?B?YkJnb2NOU0hQUjRrYTA4K0E3ZklwWEpJK3ZIaHl3M0hSZndJZm1lMDNxRTlS?=
 =?utf-8?B?Y3N1NHNGZ0V1bVRLV2ZlUzREQWNhdTRKTWVXMkRSV2R0TFJqYllNMDRjVFpI?=
 =?utf-8?B?UjQxSGJkYmw5T3dnY2dMZUxFaXJVRTZlb2JvdmR3VXNJNm04aUxhSUQxalRP?=
 =?utf-8?B?d3NZMkMrV1RQQ3NreTFORU9yQk5Ib0dYM1BMdnFpVnhoNmI5eldzRnhVSkRw?=
 =?utf-8?B?c3ZjWGdYUUN0dk9uRHBUOVFGa2RWU0hGb000cVQxUk55T2RaOW1DRExFcnd5?=
 =?utf-8?B?SkpJbTZyRHVUM1NzZzlzeHpxblE1Y3Z5QTVzWmZRY2FaRi80UUUwVjFlQ0Yw?=
 =?utf-8?B?TDVma295bnZKTVZ6TWptVUVQTWlKU1kvRVJYMXpCZzZWMnlxVHBWN2o2YlB5?=
 =?utf-8?B?bm0wdll1bGF6SjB4Q3pKTWc1VFd3dWd0OFZ5VFM5YXUweUVhbmpDa01MY2U1?=
 =?utf-8?B?SVhRTWhWSU5LTFFJMmNqQ3NiWFc5ZTJUY2M5YVJTYWxrSFY5bEhVdjJWMTVC?=
 =?utf-8?B?bXlkTXhtVGVUYXNxQkg1OXVnclk0ZjVhZFlGZUhnTFFTR3pNKzdQcWRocCtw?=
 =?utf-8?B?Nmw2WThzK1NaVW5sNnFucDlDZEJlV0N3b01iampFNlRpa2lMVzVaRnRyN3dF?=
 =?utf-8?B?NDQ4d0s0aTVwZnp3c3BvZ2FXWlc2enpZSGdQdHRIQURtUXgzemFKZnZtZ0Q5?=
 =?utf-8?B?ell4WWxGWkJUSE1EUzZ2SWpjZUF1RjhSbi9Ja0h2UWJ4T082ejhJN3ZIZ3M3?=
 =?utf-8?B?TDFnbytGQ2dRMHQ1WXg5U0x1VWpzaTRqYU5qMTkvei9SdlhVRkpPaXVjYVBy?=
 =?utf-8?B?dElxWnpjSTFVUHlhK3FFVkZUU2ZGUGV1NUNTRUxXajBQTDNaTTdNM0FYNU9r?=
 =?utf-8?B?ZzV6RWszVWZQbHQ3SE11S0lKVTZ0SmZSSzhyamZqT0I3NFBDeHI1ZndjWHpY?=
 =?utf-8?B?bHNNZ2VicDZtNzZuVUhFamxZMmlOak9jOEVMYXZwakoyN3JyNnp1b2VNT0V4?=
 =?utf-8?B?Wm5MWkFXemVGbTdsWit5cmpzR1NJOUt3U09GY3p2c2kyR296bkNVcEtST0l0?=
 =?utf-8?B?Nk91N2dMbURJb3cvWVo3UTRqaHdRd2hadExDK2lObzhLeVJJZXgyZ0ZmWFNv?=
 =?utf-8?B?Y0pzOXZRb0sxZTNHUUVvR2s0SmNYVnNGQWJKbDJlWUhzdWhKYWx2REFsMmRx?=
 =?utf-8?B?NW1kQmNYMlplMUN1bTE3ekhJSGx3KzZremhYZCtRbVVtNyt3U1g1K3VDRnRk?=
 =?utf-8?B?cWV2YUtPS0hTWHJMeU1ZM2F4Z01HS2QwN05KcjN2UmpPUGczRURvRHY3cHpX?=
 =?utf-8?B?Sy9tWHJ0ZzI0ZnFNbFNNeGw2YUEvcjBzcDU5TEdOaXVEMGFTVDhtWU1WTnY0?=
 =?utf-8?B?S1lvaXV3aXNuWjVVUFd0YkcyYnhDcm5qZy9BajdQQWZ3MklWMGlyclo2bWVp?=
 =?utf-8?B?UFpsUzhWNHhOMVcxdzRpNk1mUTJKdW9JdVoxQjFyRmlMc2szWUdyQUIyckYv?=
 =?utf-8?B?MTRCdXEzS0xYNytMLzd4c1lYQXBhckpObnR0b0VTUEpWS2hBOGlqWDA3WWNC?=
 =?utf-8?B?bkxVckttOFJ5T2xjc3BCOHFLNEQ3U0lNR2lpclUweUM5SmhERnZER2x0L1Y1?=
 =?utf-8?B?RFk5ZUgrWmtZR2ZzRFZscm1EQ2ZqNnV2Vm90cGRLQjZvOGxZbUltWm84RlZT?=
 =?utf-8?B?SWFnVVVOUEdrRE9zU3B6QXkxdjZpQXVkTGxQK1pBZDFxdWM5YllCK3o0SXJp?=
 =?utf-8?B?QzNZekUzazlwMGZNbFhKeWRhV2NFMGppRWlmTVZBWXloVnNqWWg1cGJDMEx5?=
 =?utf-8?B?YTdYcVpWUEdCellReThFcUdwc0hjSXhKU2ZYM3RydFI3YytDc3hwZ1FBT0Vm?=
 =?utf-8?B?ZzgwYTRlclFGVFNxVFZYMWdYYVNIdXVFZkk3b2NSMU9meml1WmgzY1FJOS9E?=
 =?utf-8?B?NVpwQlhtcHR1MlRwdWcwdHF0V2dNWWpOVXJUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9990.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f05240-3d9b-4abd-6f26-08db722d2416
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2023 07:57:20.7400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2zAshOGCHUkUOkE6O5NKHz3HpWvgZImNPD+8HJbc+vyoRQ+cwMYhZ2ACPsnKa22Itrypjb3hJWBmJFPpA04OUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278
X-Mailman-Approved-At: Wed, 21 Jun 2023 13:58:32 +0000
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLA0KQWZ0ZXIgYXBwbHlpbmcgdGhlIHBhdGNoLCB0aGUgYmVsb3cgYW5kcm9p
ZCBDVFMgY2FzZXMgY2FuIHBhc3M6DQpDdHNEZXFwVGVzdENhc2VzIGRFUVAtRUdMLmZ1bmN0aW9u
YWwuZ2V0X2ZyYW1lX3RpbWVzdGFtcHMqDQpUaGFua3MgZm9yIHRha2luZyBjYXJlIG9mIHRoaXMu
DQoNClRlc3RlZC1ieTogSmVzc2llIEhhbyA8anVhbi5oYW9AbnhwLmNvbT4NCg0KLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0
enVtZXJrZW5AZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgSnVuZSAyMSwgMjAyMyAzOjMy
IFBNDQpUbzogSmVzc2llIEhhbyA8anVhbi5oYW9AbnhwLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+OyBzdGFibGVAdmdlci5rZXJuZWwub3JnDQpTdWJqZWN0OiBbUEFUQ0hdIGRtYS1idWY6
IGtlZXAgdGhlIHNpZ25hbGluZyB0aW1lIG9mIG1lcmdlZCBmZW5jZXMNCg0KDQpTb21lIEFuZHJv
aWQgQ1RTIGlzIHRlc3RpbmcgZm9yIHRoYXQuDQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCkNDOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnDQotLS0NCiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLXVud3JhcC5jIHwgMTEgKysrKysr
KysrLS0NCiBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgICAgICAgIHwgIDUgKysrLS0NCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyAgICAgIHwgIDIgKy0NCiBpbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS5oICAgICAgICAgIHwgIDIgKy0NCiA0IGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYv
ZG1hLWZlbmNlLXVud3JhcC5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS11bndyYXAuYw0K
aW5kZXggNzAwMmJjYTc5MmZmLi4wNmViOTEzMDZjMDEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2Rt
YS1idWYvZG1hLWZlbmNlLXVud3JhcC5jDQorKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNl
LXVud3JhcC5jDQpAQCAtNjYsMTggKzY2LDI1IEBAIHN0cnVjdCBkbWFfZmVuY2UgKl9fZG1hX2Zl
bmNlX3Vud3JhcF9tZXJnZSh1bnNpZ25lZCBpbnQgbnVtX2ZlbmNlcywgIHsNCiAgICAgICAgc3Ry
dWN0IGRtYV9mZW5jZV9hcnJheSAqcmVzdWx0Ow0KICAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICp0
bXAsICoqYXJyYXk7DQorICAgICAgIGt0aW1lX3QgdGltZXN0YW1wOw0KICAgICAgICB1bnNpZ25l
ZCBpbnQgaTsNCiAgICAgICAgc2l6ZV90IGNvdW50Ow0KDQogICAgICAgIGNvdW50ID0gMDsNCisg
ICAgICAgdGltZXN0YW1wID0gbnNfdG9fa3RpbWUoMCk7DQogICAgICAgIGZvciAoaSA9IDA7IGkg
PCBudW1fZmVuY2VzOyArK2kpIHsNCi0gICAgICAgICAgICAgICBkbWFfZmVuY2VfdW53cmFwX2Zv
cl9lYWNoKHRtcCwgJml0ZXJbaV0sIGZlbmNlc1tpXSkNCisgICAgICAgICAgICAgICBkbWFfZmVu
Y2VfdW53cmFwX2Zvcl9lYWNoKHRtcCwgJml0ZXJbaV0sIGZlbmNlc1tpXSkgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFkbWFfZmVuY2VfaXNfc2lnbmFsZWQodG1wKSkNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKytjb3VudDsNCisgICAgICAgICAgICAgICAgICAgICAg
IGVsc2UgaWYgKHRlc3RfYml0KERNQV9GRU5DRV9GTEFHX1RJTUVTVEFNUF9CSVQsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdG1wLT5mbGFncykgJiYNCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGt0aW1lX2FmdGVyKHRtcC0+dGltZXN0YW1wLCB0
aW1lc3RhbXApKQ0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1lc3RhbXAgPSB0
bXAtPnRpbWVzdGFtcDsNCisgICAgICAgICAgICAgICB9DQogICAgICAgIH0NCg0KICAgICAgICBp
ZiAoY291bnQgPT0gMCkNCi0gICAgICAgICAgICAgICByZXR1cm4gZG1hX2ZlbmNlX2dldF9zdHVi
KCk7DQorICAgICAgICAgICAgICAgcmV0dXJuIGRtYV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRlX3N0
dWIodGltZXN0YW1wKTsNCg0KICAgICAgICBhcnJheSA9IGttYWxsb2NfYXJyYXkoY291bnQsIHNp
emVvZigqYXJyYXkpLCBHRlBfS0VSTkVMKTsNCiAgICAgICAgaWYgKCFhcnJheSkNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZl
bmNlLmMgaW5kZXggZjE3N2M1NjI2OWJiLi5hZDA3NmYyMDg3NjAgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2RtYS1idWYvZG1hLWZlbmNlLmMNCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2Uu
Yw0KQEAgLTE1MCwxMCArMTUwLDExIEBAIEVYUE9SVF9TWU1CT0woZG1hX2ZlbmNlX2dldF9zdHVi
KTsNCg0KIC8qKg0KICAqIGRtYV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRlX3N0dWIgLSByZXR1cm4g
YSBwcml2YXRlLCBzaWduYWxlZCBmZW5jZQ0KKyAqIEB0aW1lc3RhbXA6IHRpbWVzdGFtcCB3aGVu
IHRoZSBmZW5jZSB3YXMgc2lnbmFsZWQNCiAgKg0KICAqIFJldHVybiBhIG5ld2x5IGFsbG9jYXRl
ZCBhbmQgc2lnbmFsZWQgc3R1YiBmZW5jZS4NCiAgKi8NCi1zdHJ1Y3QgZG1hX2ZlbmNlICpkbWFf
ZmVuY2VfYWxsb2NhdGVfcHJpdmF0ZV9zdHViKHZvaWQpDQorc3RydWN0IGRtYV9mZW5jZSAqZG1h
X2ZlbmNlX2FsbG9jYXRlX3ByaXZhdGVfc3R1YihrdGltZV90IHRpbWVzdGFtcCkNCiB7DQogICAg
ICAgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOw0KDQpAQCAtMTY5LDcgKzE3MCw3IEBAIHN0cnVj
dCBkbWFfZmVuY2UgKmRtYV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRlX3N0dWIodm9pZCkNCiAgICAg
ICAgc2V0X2JpdChETUFfRkVOQ0VfRkxBR19FTkFCTEVfU0lHTkFMX0JJVCwNCiAgICAgICAgICAg
ICAgICAmZmVuY2UtPmZsYWdzKTsNCg0KLSAgICAgICBkbWFfZmVuY2Vfc2lnbmFsKGZlbmNlKTsN
CisgICAgICAgZG1hX2ZlbmNlX3NpZ25hbF90aW1lc3RhbXAoZmVuY2UsIHRpbWVzdGFtcCk7DQoN
CiAgICAgICAgcmV0dXJuIGZlbmNlOw0KIH0NCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIGluZGV4IDBjMmJl
ODM2MDUyNS4uMDQ1ODlhMzVlYjA5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9z
eW5jb2JqLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQpAQCAtMzUzLDcg
KzM1Myw3IEBAIEVYUE9SVF9TWU1CT0woZHJtX3N5bmNvYmpfcmVwbGFjZV9mZW5jZSk7DQogICov
DQogc3RhdGljIGludCBkcm1fc3luY29ial9hc3NpZ25fbnVsbF9oYW5kbGUoc3RydWN0IGRybV9z
eW5jb2JqICpzeW5jb2JqKSAgew0KLSAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSA9IGRt
YV9mZW5jZV9hbGxvY2F0ZV9wcml2YXRlX3N0dWIoKTsNCisgICAgICAgc3RydWN0IGRtYV9mZW5j
ZSAqZmVuY2UgPSANCisgZG1hX2ZlbmNlX2FsbG9jYXRlX3ByaXZhdGVfc3R1YihrdGltZV9nZXQo
KSk7DQoNCiAgICAgICAgaWYgKElTX0VSUihmZW5jZSkpDQogICAgICAgICAgICAgICAgcmV0dXJu
IFBUUl9FUlIoZmVuY2UpOw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgg
Yi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oIGluZGV4IGQ1NGI1OTVhMGZlMC4uMGQ2NzhlOWE3
YjI0IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaA0KKysrIGIvaW5jbHVk
ZS9saW51eC9kbWEtZmVuY2UuaA0KQEAgLTYwNiw3ICs2MDYsNyBAQCBzdGF0aWMgaW5saW5lIHNp
Z25lZCBsb25nIGRtYV9mZW5jZV93YWl0KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCBib29sIGlu
dHIpICB2b2lkIGRtYV9mZW5jZV9zZXRfZGVhZGxpbmUoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2Us
IGt0aW1lX3QgZGVhZGxpbmUpOw0KDQogc3RydWN0IGRtYV9mZW5jZSAqZG1hX2ZlbmNlX2dldF9z
dHViKHZvaWQpOyAtc3RydWN0IGRtYV9mZW5jZSAqZG1hX2ZlbmNlX2FsbG9jYXRlX3ByaXZhdGVf
c3R1Yih2b2lkKTsNCitzdHJ1Y3QgZG1hX2ZlbmNlICpkbWFfZmVuY2VfYWxsb2NhdGVfcHJpdmF0
ZV9zdHViKGt0aW1lX3QgdGltZXN0YW1wKTsNCiB1NjQgZG1hX2ZlbmNlX2NvbnRleHRfYWxsb2Mo
dW5zaWduZWQgbnVtKTsNCg0KIGV4dGVybiBjb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyBkbWFf
ZmVuY2VfYXJyYXlfb3BzOw0KLS0NCjIuMzQuMQ0KDQo=
