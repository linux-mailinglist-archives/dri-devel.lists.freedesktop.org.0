Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDBD724534
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 16:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8658B10E011;
	Tue,  6 Jun 2023 14:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2127.outbound.protection.outlook.com [40.107.20.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4910E011;
 Tue,  6 Jun 2023 14:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSpGdB+wiIxb2b3mW8yObwCeyteregRrVkwRfroa6/XbpAk7MIOSzKFthywJhULVXVzwwRnGGIqgpSdHU37yCUI7vQnecNp7Wla5gMRm8Tiv30q/o8QH1laI6hIvjHfgbRsjHxjttb2+7KttwkTgV0saaCWaU4buAvruhqzidy/PJpTMUSPoy/ZFsAfGXDkeJ/gZjWO7Bq7WcwgYIgwf0YJyro6JWQn/D5MMvE4NhoVSLjmiAz053oOQr4AZF4x6AtxZ20xKF6YjMOVFm4TUtt7+wlxmfX28W3vAkTJYbyu+BiDBfiGXIy5TIXXi2wJk3iB3ttryCuj3NVlUHAdqQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+iFruteUJGV2C/aOpUxnu/sBGVcrG3rbQRTTunoJ0k=;
 b=bU4A2MfMv7sg1XWLDpJkFSYadK6F9hvIPzCOA71mlb7CIMIn3yKpNLXQMBTcKlcywmKt1B6VPHBt5fqnduSTz8NJBz6k5lcR+ctLysRFI75vd0W1zLnIPjp5QfNV2S4Ce4LoS6SKb3rXLpkk91y/G1g2Z7pVLipcER/KdOwSm1TUFWbFsQTWa6KDJjG2miOYwm6XIrZzwQ4G78igFP43pUco3lCcST2bnEN9cUP+fhkLTBaAyu68VXLV54r+jcOvX60CcocJNHTuB0Lo5jQkvw3Zw923sp910pozehUN8VH0CSIXz0iwIZ1o2cOr117UEsJ1ZUkH1YS5fY25DPrkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+iFruteUJGV2C/aOpUxnu/sBGVcrG3rbQRTTunoJ0k=;
 b=mjUQCTct36FA9EhnciuRpd2ihtlUGsS9NProXmmDKq+TPZ2Nzg3JQuj+qsTt72tGJCjtVop5fRKtFoogmvOr84Jf6EK24EftniZ5FDN7rYGeOMbdPgOS3b8r2kmICUclRsQV9GM1tgUGs+OpGWjRwZY/NIElEO7Dz7bMmDPbQa4DqMhAk3Gc/NTfBJk2PffyVZ4Sdeqc+V45XlDvdDzner4VP4ppEA3KAOKrQxWqPKqjT8Q/FkWQyyeZ9xDyGpIEY2LkqtgPFu9iBwyDXuYdU9uSNpRK+dzZPKLTBS1b05fo8YLOybY36aaPSjPEfkxq/5HpZxWpmwaa2GngZrOzzw==
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com (2603:10a6:10:2d8::6)
 by DBAPR02MB6310.eurprd02.prod.outlook.com (2603:10a6:10:199::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 14:04:06 +0000
Received: from DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352]) by DU2PR02MB7573.eurprd02.prod.outlook.com
 ([fe80::f04b:e404:488b:2352%7]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 14:04:05 +0000
From: Tomer Tayar <ttayar@habana.ai>
To: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Thread-Topic: [Intel-xe] [RFC 1/5] drm/netlink: Add netlink infrastructure
Thread-Index: AQHZj+4TUQVrrZD7yUaFLAUxVT2zUa967liAgAGVPYCAAVwQgA==
Date: Tue, 6 Jun 2023 14:04:05 +0000
Message-ID: <0de909c4-fa12-378f-62a6-ec0b85417ba3@habana.ai>
References: <20230526162016.428357-1-aravind.iddamsetty@intel.com>
 <20230526162016.428357-2-aravind.iddamsetty@intel.com>
 <98184112-ca7d-65c5-0b98-94abb418a2a5@habana.ai>
 <4418f353-18c6-b74d-dc19-f6edc624cd52@intel.com>
In-Reply-To: <4418f353-18c6-b74d-dc19-f6edc624cd52@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PR02MB7573:EE_|DBAPR02MB6310:EE_
x-ms-office365-filtering-correlation-id: f4cb2420-aba9-42d7-0074-08db6696e3ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CdAgOOX77y/GDkU1JxrcurcbyYAkV1GEz7Tj6ul3XQrWk2yPkpFLpXOdSY/8M4Gp132KfVYse1G1dq+S9PjPZo7oxLoFotioakFeKn/KE//8LNqkJyvAX8bVsI5KGq/SsIwLDcwASWjVo4mdwGxgGs2ndcudD+0H4ZW7Ehbd+mPeE9MfxvuYSWZWG4kHBXbQvHjn7n/nXLXQqG5tJFTcNUjey0SUTgXNiggqdG4ZtESLGxZH4dk0eni1OhY3++62TQOVW2501Bk1oW2EwtvRi0b1IwgKRTPlSgpHNyzbnyrb8z+UU45Uaqs1KcSxttR3U+TAICYlsa0aEvj8ULb+kuhcuhbBQVMF506ugwcbVCToRoeMxIJWs2XZsMqTDRJmxCv/KW5xwAoGNRPzFxmdUsaxUyCChzO9YyvGRNAMh8PGN+SiZMOrAp9TNzoV3cMsEU8+tAp4fCk0k7Dwvl4Jav4krPcU6Mn/ibHlCt9eXlJns6aoGMAkC9IUQwxH1vgLlzeEIWHJXJQUzCrvwQydcD/ZRVeDScIhUfTT0jgJEwHdvBrDsPW2NY9EPYTiSCO+IGkvgYeMvBokYFFiGYNeLulM+YWFki0jwcR7JkykE5/XB/3nacrGgA++1iIBD27RyZ2UClhuSu4tz5RNr4yd1m7PDOoa71eEXymEeGpvVCKA55XB+J0GhxUN2EsicbaA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR02MB7573.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(136003)(39840400004)(366004)(376002)(451199021)(8676002)(4326008)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(8936002)(91956017)(5660300002)(316002)(31686004)(41300700001)(54906003)(66899021)(110136005)(2906002)(478600001)(38100700002)(6512007)(31696002)(6506007)(26005)(86362001)(122000001)(53546011)(186003)(71200400001)(36756003)(6486002)(2616005)(38070700005)(83380400001)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEc3bkRUbU9LdE9aeDV5bEY5N3VHZ0lucTJzbk9pTFA0cnl3ZjhKZ0dGZURz?=
 =?utf-8?B?cjhJeE0yOG1mY2M2NlRML1F3SGRWVktvcXd2T1o0cnFiK0lNS1BLNTdSLytJ?=
 =?utf-8?B?WUcvWVQ1QmJEdmcxb2hOLzdNaVYxcTJXNlVVc1I4OUxUNEw5VWg3a2xxT0Zl?=
 =?utf-8?B?cjcrOGthR1I3S0hhZElRYktGbXZpcUlsRlRsNGJINjJvR205Z0tTMmdlN3I4?=
 =?utf-8?B?R3Q2L2hFQ21UdHkyUXRSaHFrNUdPcDZDMnhJQ0JSWE91OHArNTNRVGhuWFY1?=
 =?utf-8?B?SDd1MGx0SUV6a1Q3TkN5S0JGSWkzaHRCdEV4MGIwWWIwaVdaSlBBVVRjTGs2?=
 =?utf-8?B?bHhKWHlRRjJjYVBIMzYwTENSZElHandFeG9kVGd2Rkh0N3BmcmMwUjBsbHpD?=
 =?utf-8?B?VnZpMmgrSm1uaTQzcjJld0l6TGZFNHhCd0lHSFhiWEJ5ZHE5cWxaLzJnUjF0?=
 =?utf-8?B?R2NpbUhXb2p6b0VSTVgxcDRyU0o5R2doQUFEdUQ3cDU4VjV4Q0Q1a1JTRGZ6?=
 =?utf-8?B?TVZ2bnI5QnNFWWF0OGx6cjA1ekc0eDN5QUd5SU5LMTFJc1l2dHBmeXljcTZl?=
 =?utf-8?B?ekZJaGdramQxcHkyQ3Bndk4wTzNGWkZIOHRqYzB2TjRVMDBNWHpuWGtTc21j?=
 =?utf-8?B?ZC92bkVrWG85V3hZbDVvSWFrM1BZSlBsdCtLV2JRb3ZGUFExL0RkcEZBdjkr?=
 =?utf-8?B?RUh6Q2RudExxWVVYQjhWbUs0NEZMV2V2ZmRmbkttNG1CRVd2WHJZRWZCaW1r?=
 =?utf-8?B?bWtERkk3cXR5TjFtYXBLVkNBK3ZkdnZzWEFyTlk2M1FYU1RhSUZFWk1Ba0F0?=
 =?utf-8?B?aHFYQjZzQlErUjJGajV3djdoclhXQWQ2akRQRlJ4UVpuSEhtWEJ3dVZPYmJ2?=
 =?utf-8?B?VTJXem1Pb2x2d0hvc3ZEVnhaODZienV0L0dtQ2NFbC9HdTVMSDNxdTY3Yk85?=
 =?utf-8?B?UnBTOGlybWxiTkpTRjE4QVhuL2lkM3AwVGtDRzIrSHM4bExSZmUxbzU1cVFT?=
 =?utf-8?B?VW8rTmpHYzN5bGtBOTAwZzlEVFh1Q0FhSUxNekVpK3pVdG1LTkJTY2VPcWND?=
 =?utf-8?B?VU5Ic1FCbUtHV2t0NDNraklhSkZsYndLVDFma291RHFDWFBGV0JKZW9hMXFl?=
 =?utf-8?B?bDN5ellNdXNoQ1BHZHlBcHp5ZTBWSkxZc2laaHJBQzJpaGs2a3JJOG1qTkFK?=
 =?utf-8?B?R1lUZFRDZWpmZnBYZ1pUZnByQ0JTZFc5ODJpb1VLTVkrOUdqMGs0b1lkdDdl?=
 =?utf-8?B?aVFzalUyWHdGOTNHY05zWmZaWUJhbzVOZGdiY2pVTEdhVGxyODdzL2Z0UEhT?=
 =?utf-8?B?dXRobEtLRFlDUnIyVlR4dGpOMFBxNEp1MmxESjJONnBxakd5ZWtyYkxKYTk3?=
 =?utf-8?B?VitmakhyZ0RKWTdNMndON1k4MmZUNFJZWHNmdFVPZTl6QWFKVGM3VGd5anp4?=
 =?utf-8?B?N3E3TzZrVEZMaFErUTRPcmtxOGl3OW9sb2VpNmRKczMxekhTVjN3aVdyS2VX?=
 =?utf-8?B?R3FuVDNyUGFmZkpSWTQrT0tvV01ucVBnQkhUd0F3N3lvK2hZWng3ZU5DSGJL?=
 =?utf-8?B?U2pkRkRTQUlTTW5sdzhOVVMrbS9OS3ZZS3EvWjdhbGNBRGR4VzR1Q2RNR09l?=
 =?utf-8?B?VDRYVkV5VXZlOGdiMXJQVS9pcDVqTFhlYjhzbURHb0FNUExNaFoyTTdMZ01Y?=
 =?utf-8?B?V0llc1JXVjVYYnBVSnd6K0tVSjVoanhQMStFbGRjc09BZVp6QmpYTUJiYk1I?=
 =?utf-8?B?eFVzRFVUZFk4RzJpamxvNTVZdFRtZzhrRlVicllraFZYbUlhV01kSmtCU2Zk?=
 =?utf-8?B?aElTYUhiakpZck1zV0VSK0c1akpiVVJzMnVNRENZVHJqSzdSMVNpM21ab1V6?=
 =?utf-8?B?SW5kMDRIN3FEenFiVU01MWRLWlhBdi9Nb1BMaHNVZUZwejNZU2FjZHN6K2dK?=
 =?utf-8?B?RHRDZ3VkL202Mjh1Zi9vT2ZrTnF2K3U2a0w0RjR4WDVvWDJBVG9JT0JmSExv?=
 =?utf-8?B?UXNpb1c4REM2dG01UkNySkh4dWtMTDVQNGQxNjlIT3RybEdwclVrazBTbFZY?=
 =?utf-8?B?blhGVEUrcGV0OW9sdnJrQTV6d0ZqeWpQM29IdUdxUi9aVitXYmZsOFozVG16?=
 =?utf-8?Q?xJ0Q=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C5826E3138BDA4DBC481BBE435CDE0A@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PR02MB7573.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cb2420-aba9-42d7-0074-08db6696e3ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 14:04:05.8054 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGBmb666vNHSGc1vNrlDV5WzSexeMv6D5IboqT7r5wJicsHRZRFN0wXP5W+OEMN0+qsHU4atphJNVZbibfwQVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6310
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDUvMDYvMjAyMyAyMDoxOCwgSWRkYW1zZXR0eSwgQXJhdmluZCB3cm90ZToNCj4NCj4gT24g
MDQtMDYtMjAyMyAyMjozNywgVG9tZXIgVGF5YXIgd3JvdGU6DQo+PiBPbiAyNi8wNS8yMDIzIDE5
OjIwLCBBcmF2aW5kIElkZGFtc2V0dHkgd3JvdGU6DQo+Pj4gRGVmaW5lIHRoZSBuZXRsaW5rIGNv
bW1hbmRzIGFuZCBhdHRyaWJ1dGVzIHRoYXQgY2FuIGJlIGNvbW1vbmx5IHVzZWQNCj4+PiBhY3Jv
c3MgYnkgZHJtIGRyaXZlcnMuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBcmF2aW5kIElkZGFt
c2V0dHkgPGFyYXZpbmQuaWRkYW1zZXR0eUBpbnRlbC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgaW5j
bHVkZS91YXBpL2RybS9kcm1fbmV0bGluay5oIHwgNjggKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspDQo+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vZHJtX25ldGxpbmsuaA0KPj4+
DQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX25ldGxpbmsuaCBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX25ldGxpbmsuaA0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4g
aW5kZXggMDAwMDAwMDAwMDAwLi4yOGU3YTMzNGQwYzcNCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4g
KysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fbmV0bGluay5oDQo+Pj4gQEAgLTAsMCArMSw2OCBA
QA0KPj4+ICsvKg0KPj4+ICsgKiBDb3B5cmlnaHQgMjAyMyBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4+
ICsgKg0KPj4+ICsgKiBQZXJtaXNzaW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJn
ZSwgdG8gYW55IHBlcnNvbiBvYnRhaW5pbmcgYQ0KPj4+ICsgKiBjb3B5IG9mIHRoaXMgc29mdHdh
cmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRhdGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLA0K
Pj4+ICsgKiB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNs
dWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uDQo+Pj4gKyAqIHRoZSByaWdodHMgdG8gdXNlLCBjb3B5
LCBtb2RpZnksIG1lcmdlLCBwdWJsaXNoLCBkaXN0cmlidXRlLCBzdWJsaWNlbnNlLA0KPj4+ICsg
KiBhbmQvb3Igc2VsbCBjb3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8gcGVybWl0IHBlcnNv
bnMgdG8gd2hvbSB0aGUNCj4+PiArICogU29mdHdhcmUgaXMgZnVybmlzaGVkIHRvIGRvIHNvLCBz
dWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoNCj4+PiArICoNCj4+PiArICogVGhl
IGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYW5kIHRoaXMgcGVybWlzc2lvbiBub3RpY2UgKGluY2x1
ZGluZyB0aGUgbmV4dA0KPj4+ICsgKiBwYXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFs
bCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwgcG9ydGlvbnMgb2YgdGhlDQo+Pj4gKyAqIFNvZnR3YXJl
Lg0KPj4+ICsgKg0KPj4+ICsgKiBUSEUgU09GVFdBUkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lU
SE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQUkVTUyBPUg0KPj4+ICsgKiBJTVBMSUVELCBJ
TkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNIQU5UQUJJ
TElUWSwNCj4+PiArICogRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UgQU5EIE5PTklO
RlJJTkdFTUVOVC4gIElOIE5PIEVWRU5UIFNIQUxMDQo+Pj4gKyAqIFZBIExJTlVYIFNZU1RFTVMg
QU5EL09SIElUUyBTVVBQTElFUlMgQkUgTElBQkxFIEZPUiBBTlkgQ0xBSU0sIERBTUFHRVMgT1IN
Cj4+PiArICogT1RIRVIgTElBQklMSVRZLCBXSEVUSEVSIElOIEFOIEFDVElPTiBPRiBDT05UUkFD
VCwgVE9SVCBPUiBPVEhFUldJU0UsDQo+Pj4gKyAqIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFIFVTRSBPUg0KPj4+ICsgKiBPVEhF
UiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuDQo+Pj4gKyAqLw0KPj4+ICsNCj4+PiArI2lmbmRl
ZiBfRFJNX05FVExJTktfSF8NCj4+PiArI2RlZmluZSBfRFJNX05FVExJTktfSF8NCj4+PiArDQo+
Pj4gKyNpbmNsdWRlIDxsaW51eC9uZXRkZXZpY2UuaD4NCj4+PiArI2luY2x1ZGUgPG5ldC9nZW5l
dGxpbmsuaD4NCj4+PiArI2luY2x1ZGUgPG5ldC9zb2NrLmg+DQo+PiBUaGlzIGlzIGEgdWFwaSBo
ZWFkZXIuDQo+PiBBcmUgYWxsIGhlYWRlciBmaWxlcyBoZXJlIGF2YWlsYWJsZSBmb3IgdXNlcj8N
Cj4gbm8gdGhleSBhcmUgbm90LCBJIGxhdGVyIGNhbWUgdG8ga25vdyB0aGF0IHdlIHNob3VsZCBu
b3QgaGF2ZSBhbnkgb2YNCj4gdGhhdCB1c2VyIGNhbid0IHVzZSBzbyB3aWxsIHNwbGl0IHRoZSBo
ZWFkZXIgaW50byAyLg0KPj4gQWxzbywgc2hvdWxkIHdlIGFkZCBoZXJlICIjaWYgZGVmaW5lZChf
X2NwbHVzcGx1cykgZXh0ZXJuICJDIiB7IC4uLiI/DQo+IHlhIHdpbGwgYWRkIHRoYXQNCj4+PiAr
DQo+Pj4gKyNkZWZpbmUgRFJNX0dFTkxfVkVSU0lPTiAxDQo+Pj4gKw0KPj4+ICtlbnVtIGVycm9y
X2NtZHMgew0KPj4+ICsJRFJNX0NNRF9VTlNQRUMsDQo+Pj4gKwkvKiBjb21tYW5kIHRvIGxpc3Qg
YWxsIGVycm9ycyBuYW1lcyB3aXRoIGNvbmZpZy1pZCAqLw0KPj4+ICsJRFJNX0NNRF9RVUVSWSwN
Cj4+PiArCS8qIGNvbW1hbmQgdG8gZ2V0IGEgY291bnRlciBmb3IgYSBzcGVjaWZpYyBlcnJvciAq
Lw0KPj4+ICsJRFJNX0NNRF9SRUFEX09ORSwNCj4+PiArCS8qIGNvbW1hbmQgdG8gZ2V0IGNvdW50
ZXJzIG9mIGFsbCBlcnJvcnMgKi8NCj4+PiArCURSTV9DTURfUkVBRF9BTEwsDQo+Pj4gKw0KPj4+
ICsJX19EUk1fQ01EX01BWCwNCj4+PiArCURSTV9DTURfTUFYID0gX19EUk1fQ01EX01BWCAtIDEs
DQo+Pj4gK307DQo+Pj4gKw0KPj4+ICtlbnVtIGVycm9yX2F0dHIgew0KPj4+ICsJRFJNX0FUVFJf
VU5TUEVDLA0KPj4+ICsJRFJNX0FUVFJfUEFEID0gRFJNX0FUVFJfVU5TUEVDLA0KPj4+ICsJRFJN
X0FUVFJfUkVRVUVTVCwgLyogTkxBX1U4ICovDQo+Pj4gKwlEUk1fQVRUUl9RVUVSWV9SRVBMWSwg
LypOTEFfTkVTVEVEKi8NCj4+IE1pc3Npbmcgc3BhY2VzIGluIC8qTkxBX05FU1RFRCovDQo+Pg0K
Pj4+ICsJRFJNX0FUVFJfRVJST1JfTkFNRSwgLyogTkxBX05VTF9TVFJJTkcgKi8NCj4+PiArCURS
TV9BVFRSX0VSUk9SX0lELCAvKiBOTEFfVTY0ICovDQo+Pj4gKwlEUk1fQVRUUl9FUlJPUl9WQUxV
RSwgLyogTkxBX1U2NCAqLw0KPj4+ICsNCj4+PiArCV9fRFJNX0FUVFJfTUFYLA0KPj4+ICsJRFJN
X0FUVFJfTUFYID0gX19EUk1fQVRUUl9NQVggLSAxLA0KPj4+ICt9Ow0KPj4+ICsNCj4+PiArLyog
YXR0cmlidXRlIHBvbGljaWVzICovDQo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbmxhX3BvbGlj
eSBkcm1fYXR0cl9wb2xpY3lfcXVlcnlbRFJNX0FUVFJfTUFYICsgMV0gPSB7DQo+Pj4gKwlbRFJN
X0FUVFJfUkVRVUVTVF0gPSB7IC50eXBlID0gTkxBX1U4IH0sDQo+Pj4gK307DQo+PiBTaG91bGQg
dGhlc2UgcG9saWNpZXMgc3RydWN0dXJlcyBiZSBpbiB1YXBpPw0KPiBzbyB5YSB0aGVzZSB3aWxs
IGFsc28gbGlrZWx5IG1vdmUgaW50byBhIHNlcGFyYXRlIGRybSBoZWFkZXIgYXMNCj4gdXNlcnNw
YWNlIHdvdWxkIGRlZmluZSB0aGVyZSBvd24gcG9saWN5Lg0KPj4+ICsNCj4+PiArc3RhdGljIGNv
bnN0IHN0cnVjdCBubGFfcG9saWN5IGRybV9hdHRyX3BvbGljeV9yZWFkX29uZVtEUk1fQVRUUl9N
QVggKyAxXSA9IHsNCj4+PiArCVtEUk1fQVRUUl9FUlJPUl9JRF0gPSB7IC50eXBlID0gTkxBX1U2
NCB9LA0KPj4+ICt9Ow0KPj4gSSBtaWdodCBtaXNzIHNvbWV0aGluZyBoZXJlLCBidXQgd2h5IGl0
IGlzIG5vdCBhIHNpbmdsZSBwb2xpY3kgc3RydWN0dXJlDQo+PiB3aXRoIGVudHJpZXMgZm9yIERS
TV9BVFRSX1JFUVVFU1QgYW5kIERSTV9BVFRSX0VSUk9SX0lEPw0KPiBzbyBlYWNoIGNvbW1hbmQg
Y2FuIGhhdmUgaXQncyBvd24gcG9saWN5IGRlZmluZWQsIGkuZSB3aGF0IGF0dHJpYnV0ZXMgaXQN
Cj4gZXhwZWN0cyB3ZSBjb3VsZCBkZWZpbmUgb25seSB0aG9zZSwgdGhhdCB3YXkgd2UgY2FuIGhh
dmUgYSBjaGVjayBhcw0KPiB3ZWxsLiBTbywgaW4gdGhlIHByZXNlbnQgaW1wbGVtZW50YXRpb24g
RFJNX0NNRF9RVUVSWSBhbmQNCj4gRFJNX0NNRF9SRUFEX0FMTCBleHBlY3Qgb25seSBEUk1fQVRU
Ul9SRVFVRVNUIGFuZCB3aGlsZSBEUk1fQ01EX1JFQURfT05FDQo+IGV4cGVjdHMgb25seSBEUk1f
QVRUUl9FUlJPUl9JRCBhcyBwYXJ0IG9mIHRoZSBpbmNvbWluZyBtZXNzYWdlIGZyb20gdXNlci4N
Cj4NCj4gVGhhbmtzLA0KPiBBcmF2aW5kLg0KDQpCdXQgInN0cnVjdCBnZW5sX29wcyIgZXhwZWN0
cyBhIHBvaW50ZXIgdG8gInN0cnVjdCBubGFfcG9saWN5IiwgYW5kIGluIA0KdGhlIGRlZmluaXRp
b24gb2YgInhlX2dlbmxfb3BzIiwgZWFjaCBlbnRyeSBpcyBzZXQgd2l0aCBhIHBvaW50ZXIgdG8g
DQp0aGVzZSBhcnJheXMgb2YgInN0cnVjdCBubGFfcG9saWN5Ii4NCldvbid0IHRoZXkgdXNlIHRo
ZSBmaXJzdCBlbnRyeSAoRFJNX0FUVFJfVU5TUEVDKSBvZiB0aGUgYXJyYXlzPyANClNob3VsZG4n
dCB3ZSBzZXQgdXNlIHRoZXJlIHRoZSBhcnJheXMgYXQgaW5kaWNlcyBEUk1fQVRUUl9SRVFVRVNU
IGFuZCANCkRSTV9BVFRSX0VSUk9SX0lEPw0KSWYgeWVzLCB0aGVuIGNhbid0IHdlIGhhdmUgYSBz
aW5nbGUgcG9saWN5IGFycmF5LCBlYWNoIGVudHJ5IGRlZmluZXMgYSANCnBvbGljeSBwZXIgYXR0
cmlidXRlLCBhbmQgd2Ugd2lsbCB1c2UgdGhlIHN1aXRhYmxlIHBvbGljeSBlbnRyeSBmb3IgZWFj
aCANCmNvbW1hbmQ/DQoNClRoYW5rcywNClRvbWVyDQoNCj4+IFRoYW5rcywNCj4+IFRvbWVyDQo+
Pg0KPj4+ICsNCj4+PiArI2VuZGlmDQo+Pg0KDQo=
