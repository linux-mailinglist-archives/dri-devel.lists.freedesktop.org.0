Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29635ED17
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815356E44A;
	Wed, 14 Apr 2021 06:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31706E44A;
 Wed, 14 Apr 2021 06:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esAIjVuLZimaH9PdWi4dg8kAGI3Xl403zJqbl/Tladozx5QVDr748gNwa5YjTfr4jpEPIK+4MWsWSQF7pyq3UOmf4vJ4vMcNH3NUFGhjeeQYMS8gVDDuC3n6qn97XA0AZpn49erRu5x210xip67KdFtYMAVQFDJKg6FLrF9CKZ/7vZmodY1jveWdwa2zXRZs2nk2Xj4YjI0ucUDfyVMfKR6aQycy2bAxKnX+uD1OVIHF6tviZ/GWtht3wQfb+VHCP38+IUv6EcSppEA6z6u878tsJHD/eyWFKpjqJHkti6jXCjVz8Zf6zfMVc01BUXoLJGZl2mYxU5mAs9a36ExpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctm0BCMZoTWHosv2ES4NAqA5h2Q9d4q5DfdJJijMhgU=;
 b=e3apNk2eCwXlPIHm0oqZk98w2Z5uTIo9iaZXBHFL0GtdsdBSL+6n+34VjN+ZQQDYMHppkZUiAeYY28TrRCgnvLHc6vfnxi7JjzxC4XAw2fw73EBy3fnDhOBVSA2lEtShiKLLGBpjKLWhqdvVwwSZwjpLgZdsEEesBRMjBJDBvDkWJS3ZJv55jzWmni+bEMN3gT/WsZqe+YsJMMvWDrOpEO/zjnyPWhNTPFYual+tfRcW64HkBcwQKdEqdF14Wk/XPrYW7F99tB12Kw6fIqzgMRy0Ro7oNh6yjKvZYi1iK0DoGgmuqpJsdUsYRuKDWSoS9dTnIcu8gQXZoJsd3Gnomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctm0BCMZoTWHosv2ES4NAqA5h2Q9d4q5DfdJJijMhgU=;
 b=UBBlsZns/WNTzkDrFc0qd8WZiiqe5roDMXPocACMLrAA/sx01LJ84A0phA953qoxDLETUjr2XMLpCCYlEu2tK44v4NiEnoJ1bNjUhvuK+dgFPz84YvB2RXGTFi4kSnO/VDo/88oB8WuCc0a04dDuc1ALGOKMuN0J8OurcGmCd4U=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none
 header.from=synaptics.com;
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BYAPR03MB4245.namprd03.prod.outlook.com (2603:10b6:a03:18::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Wed, 14 Apr
 2021 06:17:01 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 06:17:01 +0000
Date: Wed, 14 Apr 2021 14:16:53 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <20210414141653.07235214@xhacker.debian>
In-Reply-To: <YHXN9lqtdvisT8gn@intel.com>
References: <20210413170240.0d4ffa38@xhacker.debian>
 <YHXN9lqtdvisT8gn@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:a03:39d::26) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR03CA0321.namprd03.prod.outlook.com (2603:10b6:a03:39d::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend
 Transport; Wed, 14 Apr 2021 06:16:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a270b75-2d0a-4bc4-6494-08d8ff0cea52
X-MS-TrafficTypeDiagnostic: BYAPR03MB4245:
X-Microsoft-Antispam-PRVS: <BYAPR03MB424583A73CD734E1A8FA1178ED4E9@BYAPR03MB4245.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1mziHeXHbKqt0aSLSwuTcGIbUCQ8Ry1hAaDkmtCHV3BWBQ1IkZRHtvF5oUD4fzXBepf63iCEY6dS9GwQjAuPJw6mBXLjiB2AxTtvbY+qlhjy3alBzfdsfIknfU0qHSC5DTCBtN8DxjR0E88T6jqWeccttTOmIK2Lf4dUr00+fVoKazuni84aNRD+fuiobdoYu29SlsRGoX+95NY+uhA4cO8K/hUYcBxtvX3ciqFD+Hy18vauTRqE7WSAcp2W5GqYCk2n4u4ArL6B8kQLW0wMAYs/MaRhsrHvTTbHJoiuzy7o3tqxAx4SYrGqbtLG+xK7iMYzfYN2NaiP/7m5K3TMUDn5O3QfKDnJm2gnHolHKgxl6Z80PAI1GZHY/LyNp6lKtlQxarsHpmSooSuZkMfKxUapBhJSIP9o1NV4NZ672XIhh61UZkPWQI3w+Gr8XZknw8d3xz37l96J301uCFTqyDDC33n2yYYUmaNuphhm2X6NYFwc3dbIz+ScCsv9mIEWOHoi7724xpvzyShwmFjXFDiFHGjh4dJQARbBIJ3jwSe6GWBV9575zdFHSsCd66sCD2Cqdax6SwWuFGjKW6S/ufMp+WQrJvfhVs1qSvrU5h4dlocjLwEmOfIEfjalmnH8Czbx+qu0TknEqVgIo6/nYKE6AfTyo0+69BCUvw5M/6s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39850400004)(376002)(366004)(396003)(956004)(2906002)(38100700002)(186003)(1076003)(38350700002)(66946007)(478600001)(54906003)(6916009)(66574015)(83380400001)(9686003)(16526019)(6666004)(6506007)(26005)(4326008)(66556008)(316002)(7416002)(86362001)(7696005)(52116002)(5660300002)(8676002)(55016002)(66476007)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXB1aThadVUxTy9mOVJTUnZiaSttYTRacU1hWnl2b0p1bElTVDV0dXduMWI0?=
 =?utf-8?B?cjZGTElPeUxja24zUHhjUmVOS2lSSkxRZzFrcHVnNDlYRDkxbXd4aFVhNVVE?=
 =?utf-8?B?UFEzaU14dFVmVE9yd2JJeDJQS3h0RVZqOE1vQ1JFby9qVk42Rm5Nd0xKbTBx?=
 =?utf-8?B?MFhVVStUYk5sT0M2cWRhZTBycVpzWnFMS053RnJhMjhudmlWVi9hRDN5ZkNu?=
 =?utf-8?B?VXZlK0pCWmFMVlpPNWxNdi9WcVNydFVDVko2UExIcU85bHJqV2dkekRxSjFx?=
 =?utf-8?B?ODdOVzRkVzMwV3RuVTNoclhJYUsrSys0bmttTTJLL2JBVTdGVkJYa3pZOXgx?=
 =?utf-8?B?SFV5aXhnUUk2RjE1S1BRSklPdXpSNlN1QnB0Zk02ODVac0JPMWdVWHBudlRF?=
 =?utf-8?B?Vll0U3o3REloMTUrL3gwQmEzVlJ6aGU0Y3J2bTl6Yzl3Y0pkLzZBS0NjWm4z?=
 =?utf-8?B?YWlabWN3UzVZTlFrcERpVVBxMXlkZzFUbXlpVlVCMm9LSlh0MExacklDSy95?=
 =?utf-8?B?a2JjYXZFTC9WMmJBYzh4cy9kSFhyM25Pd0FxNGpKNmlLWFJMRlJNYUlQc1Zs?=
 =?utf-8?B?MW5XWUFJQURLZEJSMkhycjU5WXlxdHVUMjRxVldDYmI5a2lSbFVVcjVFaGFQ?=
 =?utf-8?B?U01FdU5YQm5nN3F6QnRQejdXVURaVGNaNFhyR1RhWjNPNlZJMWkzR1NRcFR1?=
 =?utf-8?B?STROMWVhMjJOMnJjL2psc09JeDA2V3JnRG5QaXpaeHV5L1lKQXpNbU4zWGk1?=
 =?utf-8?B?eXRHNEhucERBYUxKeDdtaVFFVXBTWGFZcFNxeExrSlpOeWRZQTQzU1k0cjEv?=
 =?utf-8?B?eDM5cWVUbmpQc05YT0orOEF6OGRnTXdXTzc5LzdyUDFaUmFNSzM0ay9DTDFW?=
 =?utf-8?B?UVgwVVpiQkNRZ3JiOXNZSCsrYWkvQjFvVDcxWG9TdmtIKzBSeFdPUGVkdTFT?=
 =?utf-8?B?TXJIdDZGMkFnNGhmK0ZTS0UzNGUvaklNMW1LNTB3N0ltenFiUzdLdmhiNFZU?=
 =?utf-8?B?VWIzalFXeCtGdTlKQjEzbDhmaWw5TlZ6TjFUQTY3bXdFTW5ObkZjTzFnM2xQ?=
 =?utf-8?B?VUppVXEydmFnQytNSTRDdm9tVVJMWUp1aVJhZ1MvUm0xa0VXWEtGUUJRejNF?=
 =?utf-8?B?L2h2clI5ZHVtbk9SWEVGL3k3WEVHTis3aFBpTFRsZCtUM1JWWGQ1WE9UZ01E?=
 =?utf-8?B?R0NwaVg2UmtDSTNNVFZ4NHdpSTJjUDJpUVowQjQrYUhHNlZ0dXphOUIvazN2?=
 =?utf-8?B?VXpVR0t5b3NGNmJucjlERDc1SXkzbFZUSGE0OFRPbnkvcDlzWWZGaGZXSGx4?=
 =?utf-8?B?dndIcDZXWFBNTjBWQmp0emJHQy9iSjNkYS8wZUhRWjJhUHVSOXBxekZBWU9w?=
 =?utf-8?B?RHlOTTRadXRJYTQ2Mnc0ZEVvVlpwNzIwQ0Z3MzFKeXBhdFlNWExBaVRFbkxG?=
 =?utf-8?B?cEhiTWR1dE5yZ3M5SU5udVBWeDBPMGIyekZrSUpWLy9lQ1Q0Zk44dW81a2hS?=
 =?utf-8?B?cVJtZDE2MWFOVGFEWVBjWXdVc3M5bXUzZWRaRHcxR2dGQXhSQW9rMVo5UUdr?=
 =?utf-8?B?bGF1WE5KMDFKZTFpTWZXN3N5OGwyK0JWY3FCbVkvN1EzWGZieTF5dW9VVU9y?=
 =?utf-8?B?R1lCS05tSTlHQVdUeldEUmY1SnBOWkNUQWw1NkFoZ3FHNkNkcys0YmlqTUhX?=
 =?utf-8?B?dTVhMEkrRnQ5TE5FelllSEtjMksvd3RiTzBBS2g2YXBXK2Z1V1E3K0ZpT0ta?=
 =?utf-8?Q?1ZstA8ixTU+46pXPpQLI9V90XdrnFSaUsQiv2wm?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a270b75-2d0a-4bc4-6494-08d8ff0cea52
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:17:01.0257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zgv6/QScLfxv7+cJlLEnIA5YMGSvFRFBgY/QOm+vSbqTlKd6FIdfg6d4+qn8bml/V1ScRisIMwynXNiWtor5OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4245
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAxMyBBcHIgMjAyMSAxOTo1OTozNCArMDMwMCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
CgoKPiAKPiBPbiBUdWUsIEFwciAxMywgMjAyMSBhdCAwNTowMjo0MFBNICswODAwLCBKaXNoZW5n
IFpoYW5nIHdyb3RlOgo+ID4gSSBtZXQgYmVsb3cgZXJyb3IgZHVyaW5nIGJvb3Qgd2l0aCBpOTE1
IGJ1aWx0aW4gaWYgcGFzcwo+ID4gImk5MTUubWl0aWdhdGlvbnM9b2ZmIjoKPiA+IFsgICAgMC4w
MTU1ODldIEJvb3Rpbmcga2VybmVsOiBgb2ZmJyBpbnZhbGlkIGZvciBwYXJhbWV0ZXIgYGk5MTUu
bWl0aWdhdGlvbnMnCj4gPgo+ID4gVGhlIHJlYXNvbiBpcyBzbGFiIHN1YnN5c3RlbSBpc24ndCBy
ZWFkeSBhdCB0aGF0IHRpbWUsIHNvIGtzdHJkdXAoKQo+ID4gcmV0dXJucyBOVUxMLiBGaXggdGhp
cyBpc3N1ZSBieSB1c2luZyBzdGFjayB2YXIgaW5zdGVhZCBvZiBrc3RyZHVwKCkuCj4gPgo+ID4g
Rml4ZXM6IDk4NGNhZGVhMDMyYiAoImRybS9pOTE1OiBBbGxvdyB0aGUgc3lzYWRtaW4gdG8gb3Zl
cnJpZGUgc2VjdXJpdHkgbWl0aWdhdGlvbnMiKQo+ID4gU2lnbmVkLW9mZi1ieTogSmlzaGVuZyBa
aGFuZyA8SmlzaGVuZy5aaGFuZ0BzeW5hcHRpY3MuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV9taXRpZ2F0aW9ucy5jIHwgNyArKy0tLS0tCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9taXRpZ2F0aW9ucy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9taXRpZ2F0aW9ucy5jCj4gPiBpbmRleCA4NGYxMjU5OGQxNDUuLjdkYWRm
NDEwNjRlMCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfbWl0aWdh
dGlvbnMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9taXRpZ2F0aW9ucy5j
Cj4gPiBAQCAtMjksMTUgKzI5LDEzIEBAIGJvb2wgaTkxNV9taXRpZ2F0ZV9jbGVhcl9yZXNpZHVh
bHModm9pZCkKPiA+ICBzdGF0aWMgaW50IG1pdGlnYXRpb25zX3NldChjb25zdCBjaGFyICp2YWws
IGNvbnN0IHN0cnVjdCBrZXJuZWxfcGFyYW0gKmtwKQo+ID4gIHsKPiA+ICAgICAgIHVuc2lnbmVk
IGxvbmcgbmV3ID0gfjBVTDsKPiA+IC0gICAgIGNoYXIgKnN0ciwgKnNlcCwgKnRvazsKPiA+ICsg
ICAgIGNoYXIgc3RyWzY0XSwgKnNlcCwgKnRvazsKPiA+ICAgICAgIGJvb2wgZmlyc3QgPSB0cnVl
Owo+ID4gICAgICAgaW50IGVyciA9IDA7Cj4gPgo+ID4gICAgICAgQlVJTERfQlVHX09OKEFSUkFZ
X1NJWkUobmFtZXMpID49IEJJVFNfUEVSX1RZUEUobWl0aWdhdGlvbnMpKTsKPiA+Cj4gPiAtICAg
ICBzdHIgPSBrc3RyZHVwKHZhbCwgR0ZQX0tFUk5FTCk7Cj4gPiAtICAgICBpZiAoIXN0cikKPiA+
IC0gICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArICAgICBzdHJuY3B5KHN0ciwgdmFs
LCBzaXplb2Yoc3RyKSAtIDEpOyAgCj4gCj4gSSBkb24ndCB0aGluayBzdHJuY3B5KCkgZ3VhcmFu
dGVlcyB0aGF0IHRoZSBzdHJpbmcgaXMgcHJvcGVybHkKPiB0ZXJtaW5hdGVkLgo+IAo+IEFsc28g
Y29tbWl0IGIxYjZiZWQzYjUwMyAoInVzYjogY29yZTogZml4IHF1aXJrc19wYXJhbV9zZXQoKSB3
cml0aW5nIHRvCj4gYSBjb25zdCBwb2ludGVyIikgbG9va3MgYnJva2VuIGFzIHdlbGwgZ2l2ZW4g
eW91ciBmaW5kaW5ncywgYW5kCj4gYXJjaC91bS9kcml2ZXJzL3ZpcnRpb191bWwuYyBzZWVtcyB0
byBzdWZmZXIgZnJvbSB0aGlzIGFzIHdlbGwuCgp3b3cgdGhhbmsgeW91IHNvIG11Y2guIEkgd2ls
bCBzZW5kIG91dCBwYXRjaGVzIHRvIGZpeCB0aGVtIGFzIHdlbGwuCgo+IGtlcm5lbC9wYXJhbXMu
YyBpdHNlbGYgc2VlbXMgdG8gaGF2ZSBzb21lIHNsYWJfaXNfYXZhaWxhYmxlKCkgbWFnaWMKPiBh
cm91bmQga21hbGxvYygpLgo+IAo+IEkgdXNlZCB0aGUgZm9sbG93aW5nIGNvY2NpIHNuaXBwZXQg
dG8gZmluZCB0aGVzZToKCk5pY2UgY29jY2kgc2NyaXB0LgoKCj4gQGZpbmRACj4gaWRlbnRpZmll
ciBPLCBGOwo+IHBvc2l0aW9uIFBTOwo+IEBACj4gc3RydWN0IGtlcm5lbF9wYXJhbV9vcHMgTyA9
IHsKPiAuLi4sCj4gICAgICAgICAuc2V0ID0gRkBQUwo+ICwuLi4KPiB9Owo+IAo+IEBhbGxvY0AK
PiBpZGVudGlmaWVyIEFMTE9DID1+ICJeay4qKGFsbG9jfGR1cCkiOwo+IGlkZW50aWZpZXIgZmlu
ZC5GOwo+IHBvc2l0aW9uIFBBOwo+IEBACj4gRiguLi4pIHsKPiA8Ky4uLgo+IEFMTE9DQFBBKC4u
LikKPiAuLi4rPiAgCj4gfQo+IAo+IEBzY3JpcHQ6cHl0aG9uIGRlcGVuZHMgb24gYWxsb2NACj4g
cHMgPDwgZmluZC5QUzsKPiBwYSA8PCBhbGxvYy5QQTsKPiBAQAo+IGNvY2NpbGliLnJlcG9ydC5w
cmludF9yZXBvcnQocHNbMF0sICJzdHJ1Y3QiKQo+IGNvY2NpbGliLnJlcG9ydC5wcmludF9yZXBv
cnQocGFbMF0sICJhbGxvYyIpCj4gCj4gVGhhdCBjb3VsZCBvZiBjb3Vyc2UgbWlzcyBhIGJ1bmNo
IG1vcmUgaWYgdGhleSBhbGxvY2F0ZQo+IHZpYSBzb21lIG90aGVyIGZ1bmN0aW9uIEkgZGlkbid0
IGNvbnNpZGVyLgo+IAo+IC0tCj4gVmlsbGUgU3lyasOkbMOkCj4gSW50ZWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
