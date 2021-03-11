Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97109337F57
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 22:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7A96EC41;
	Thu, 11 Mar 2021 21:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760071.outbound.protection.outlook.com [40.107.76.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DEE36EC41
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 21:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYHG1fC//V3GREGmXI6IONcv3t4Xvl24pXiYQCVXPs7yWE/aOsqpM3apDUpP2AH2QhSNU3ybeqhIRP7zKhD4kTfMOnaVufZwoOQHgkRgSdIdf1vpZQArDjv7Jue4bb3/0lA51sb8J2va0ot2C7KKrdmXdIDWfZ50oAUHggQQcyiyCA0rGZDJqCv6EuvylBspc9r3Yo2pPJWziRkkdNUcn1vWufMwAQQv/SifsN9aLM/pPYsyvPEI1JhtsPLkUgKXmagMfteJxys3vPnRLDd6hGnNerM3EiXhdDZzo6b3qDHFO7rQw9DpfjkVTlWGv/+nrBAsRgT5Hpwg4JEhY1YSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGdEnpV6BNNqw9MWG9dPmjlm0lpXlxZLnuSd7hvpcsE=;
 b=dFXFoLFrG8B+VVZdRk/UboEFRR+b2aqcvAIiim5qWQHWLGVOS7nv6wnFPCvAfP/9EbWeCzOJlM7eCFCmyQvUGnaiEP3eAqzjYaMonhSAcZWK9nlEcu/MFWZpzjmVsNqcAFQrbzbLxfyVwQ9aeewn23K7nAduWH1aljAnR6sWucX/dnN3gorZlD+8LnAE1zhlXKwfWGxhPBGvNpAiD5jQcAmfnPXiErS8pgBHbdJWKnx2P3MPCt7UHCGRBqqCJzV5pO6tci/g1mIiYgXm9skszvZUeXN5sxSAuBfaXy8XQYvnefgPcHlgy1jUoemubefRUKGPZ62AfEf9Rbq6vZB5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGdEnpV6BNNqw9MWG9dPmjlm0lpXlxZLnuSd7hvpcsE=;
 b=U+wDMZECP8ARO24YOunrTbM2BuIC/TYO6pw1GOHNzQn0nXO1F+jBMBOc+YmNSf8knmteEvD+DA9+gnMkhixg9TFCPcTFb8w1kzLe522pH+Q4dsWCSB9nGLh6BM0Kh5wrgpaKz0Pg4AJFljuU0tw2EcOA6UMnI2NURRzovn7vNyI=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by BN7PR05MB4497.namprd05.prod.outlook.com (2603:10b6:406:f4::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.22; Thu, 11 Mar
 2021 21:07:04 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::7da0:48cf:2d04:b90d]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::7da0:48cf:2d04:b90d%5]) with mapi id 15.20.3933.013; Thu, 11 Mar 2021
 21:07:04 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKQ==?= <thomas_os@shipmail.org>
Subject: Re: vmwgfx leaking bo pins?
Thread-Topic: vmwgfx leaking bo pins?
Thread-Index: AQHXFmPGRvTgB8N0CUeQLBDdp6Kquqp/SCwA
Date: Thu, 11 Mar 2021 21:07:04 +0000
Message-ID: <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
In-Reply-To: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.40.0.2.32)
authentication-results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7b099d3-994e-4e66-b23b-08d8e4d19f3b
x-ms-traffictypediagnostic: BN7PR05MB4497:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR05MB44970B76E4BCC98AE151AF07CE909@BN7PR05MB4497.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wzLvbCKTAqOC4pV/7m/tMzAOALPrsNdyGmswElQWpRw0vFqNjqvIfAEVgnP03tkevuxygzmQ7/SrYYgNNByHt/gsMO7ldUp76J5b70Y7W22IH8L4vswnHw+7bbTgonbu8/1n1ZkEIPJh9Ghg9eYFYmQQePtu9gZdifq+a4p+pRWy590Wr4or54nm0/2kr17l+zfHa0WsM5yyb0N6PI8PG/HWRgcypMoAnFPyQj5tMtIoy3BB8r3xLGTeGSp2kFVDd98qoRA0L8BeKRd+ZDaPvmcmUGkdLlT4yJzc4/Lmseh5srsxBpDAn42k0wTIPmOZOd5PeMMM8hS7OGUQ3FHdg9cTeMHcWDkhS7NI5OJ3twZu+jq7aTtSUV8Bvjyx9b/pPTg2aCL4C+UgdMVwBXhFl6Z8evPp7R6oqtGGyxHnVwyj6dBSbyWvSuOxSY84Q9Vm594xGymUGWF3sibMOjGgRFNtvNjxc5+zNUW+Pwr/tt8qFt1HjsmnydR2te1UFlxduNw9s3SmLFUuW+5VXdljxNY+lYEEEruXipY3Q2h95wkZmKKU5NjCITpDjaMU3fV5Nk+1BoLn4VgMLdcfukTtXCpYyvrZEGWJC0sUJRTViw4vKcOC3vdmSHfTXf+vRG9/Wcqq/hoYPL48YGK/+ZAD5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(36756003)(316002)(4744005)(66556008)(64756008)(6486002)(186003)(5660300002)(54906003)(6916009)(2616005)(91956017)(76116006)(66476007)(53546011)(478600001)(4326008)(71200400001)(66446008)(6506007)(3480700007)(2906002)(8936002)(26005)(33656002)(6512007)(8676002)(86362001)(66946007)(40753002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?WE5hMWVlZlMyNnVoM1R4Y1BZellzbVJMYWUrc3diMDQ4Ni9yU2ZncExTSUt5?=
 =?utf-8?B?UVJPYmtuOU5KTWNzS21PdUEwd1JOYjFwU0V1ZlhjRW12c1ZoZWpkdlJsbHpw?=
 =?utf-8?B?b25LeFU1QnUvWFBWSXYwQ1d0cG8veDByQTB1OUpjWHcvUmI3WHQzMEM5RjNQ?=
 =?utf-8?B?Z1BVcFFwNUlxWDAyWXlaeTJvU3c5dk1rd1J6RFZlSlBKRnByREIyekVEMjM0?=
 =?utf-8?B?a1NKdWZhOWtBZ05lN2NGenpRMVJkYU96bS9UOFJBVmNBQ3JvNE44NkMrM0Fy?=
 =?utf-8?B?QTFQT3hLT0tQSWtnTG13N1RYUVFQOTREYi9OV1BFZWVmSTVlMDBkT29vNm9M?=
 =?utf-8?B?d0dZN1VvaUtNY2lJenZzQnFxa0hjNlFzNEk3Si9jRzJFdmgzaFF6Vzl0bDIx?=
 =?utf-8?B?RE5MMnVKM1NVM1pTLzZlbzVTcVNJQWRMU09jaHZXSnNFSThmbGZQcGg0YS92?=
 =?utf-8?B?TWNSdHFpenhQL1FrMlprdFFPemkyUzZyOGY1MmJrOTI4dmJUOWVSVlo4eUhB?=
 =?utf-8?B?Y3FoMlJsQVd0TmYwZ0dKelBGSGUvRXRTbHlraXNNb0d1ZEZ6dVFWZXVtUTlZ?=
 =?utf-8?B?TkgwdTYybDVveUVEK2ZYcU1GNlp1NHhqemZaYzNIelp6cDNtYTJsZGhWeTl0?=
 =?utf-8?B?dkYwbXRra2dIQ0RXY1B6ZUkwWUR1V014cHF1ZmJPZXZub25KVjJiOEcveDh6?=
 =?utf-8?B?UDNhajBYTnQ5OStvYkFsSDhxdm42ankxVkd5WTlrTnZ4RFAzZ1F0M3daYkNy?=
 =?utf-8?B?bEwvYXFpQ2dXandCcTJrK2ZSZTM3VGdINDB3WVZlYkgyYkVpQjQ2OGtXN3U3?=
 =?utf-8?B?SVF6MDlHTHMwQTV2ZnZacGNLS0VURkhvK0VGdDlrY2c4QmZRckJsVzNRVmR6?=
 =?utf-8?B?WkJ3WWlkUmp5anRidEZ5L295SzZ1VDVIbEVhdXdiQWZ3RnhWbzMxdUQvNW5O?=
 =?utf-8?B?S2g4aHhrSUhCZHNNSjFqWTJWMnlQZktmK3V0b0JiTHdKMVhQaDM5T21rZVZO?=
 =?utf-8?B?bWpSNVRCNmttQU5Tb2dEbzA5UkQzY3I4TnJnUW5GRG81N0ovVy9RSkQ1c2Yr?=
 =?utf-8?B?WmM1em5DMjg3NUEvTUJRQTBIcTEzVlNDU0FSSHFWUmFhMWJKbkpTNHd4VEs4?=
 =?utf-8?B?TTdSV29JSDcrKzVEVzJRRXpwelVUUC9KY2JQaVFNeUVMbkdHTHhHZSs5ZnFm?=
 =?utf-8?B?NWVVbVJiK09VS1luUXNqRENVNmJUZk82aHpTVlBZSFBDd3RQSnJVOGt1SlNr?=
 =?utf-8?B?UFlxQzZqS2t5SjRWRDhaUTRlOVl0R0lsSnZyWkkwRHNQelZRRjllRzJNMHdE?=
 =?utf-8?B?NVoxVzNlSTU3QW12RDA1UnE5U0Z6Q0xMa0huOVlEVjE0MXp1U0xpRUFZNDZx?=
 =?utf-8?B?Uy9OTUJKWXk4UlZQSTJEZEZFcXYxbXY4bkRBazZZQnMrVkJjbXMvS08rMjNE?=
 =?utf-8?B?bkErcXFkNldoOVYzNUdUYUk3ajFsZG4zK2djMWk0M1BIYkh3aXpiQ3d3MC9s?=
 =?utf-8?B?T3Jmakh2UGxsbldTUmJLWDZxd0E4dmtjMlQ3UDBzU0pOb2lCU056TFk5TFB6?=
 =?utf-8?B?OWI1dkxsSlRWcktaV0RFdEh3ZVRxQ0pOT3UvTmdadCtqY29UY2QxWlNFTkZw?=
 =?utf-8?B?TENEU3MwM2J3MHB3N0NEM2c4WUZXWVQ0T0hrMkltOVlyVlEwbmRvTWIrdzBK?=
 =?utf-8?B?NWsvcXVub2FzQ083aWhKdk5FOXptOVNaRXJrNWFMdjVGSlZBNlVodkRPV3B1?=
 =?utf-8?Q?ESpW3X7UhcMAEFLJVQKeOfqHg1PLGM6AqQBWCvF?=
Content-ID: <F8A7DB5F973CD4418AF7AD2BC2DD9531@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7b099d3-994e-4e66-b23b-08d8e4d19f3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2021 21:07:04.2913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DQR6BGYebtGBH94FaVaEBxVAiqmAxcmNuAn0SEI2ujBFohh85BwK9HvG+JLa0wQvN+4BS6yv2lgrotitPKVq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR05MB4497
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQo+IE9uIE1hciAxMSwgMjAyMSwgYXQgMDU6NDYsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
PHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBJIHRyaWVk
IGxhdGVzdCBkcm0tZml4ZXMgdG9kYXkgYW5kIHNhdyBhIGxvdCBvZiB0aGVzZTogRmFsbG91dCBm
cm9tIHR0bSByZXdvcms/DQoNClllcywgSSBmaXhlZCB0aGlzIGluIGQxYTczYzY0MWFmZDI2MTdi
ZDgwYmNlOGI3MWEwOTZmYzViNzRiN2UgaXQgd2FzIGluIGRybS1taXNjLW5leHQgaW4gdGhlIGRy
bS1taXNjIHRyZWUgZm9yIGEgd2hpbGUgYnV0IGhhc27igJl0IGJlZW4gbWVyZ2VkIGZvciA1LjEy
Lg0KDQp6DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
