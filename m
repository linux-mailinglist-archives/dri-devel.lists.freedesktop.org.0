Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAF523D85B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 11:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7F6E8A0;
	Thu,  6 Aug 2020 09:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680053.outbound.protection.outlook.com [40.107.68.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B476E8A0
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 09:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBHI8VNPnhVce94rc0Zv7tJSyxdEaji+ftrYai8L1ULNK/fxKA5vFzKFgR+F5t3v+30lPi57oMrkWLQXpJz7P+ic9AfTHnKKsXTkWG2uTjIBhpSZihNjUMQwcoA7lyyYOORdAegy3j4BrIvSguw/XRWDvvJLcqFVLi2kqaoC2LGqFEYOebhDjcZ3tmnzy6V4GBehkEDD7WBAJYdkJ27GYA9XkmTiI0oQNsyuHLUocED/YYup3C4KrbNJQd6iFnxkhbJW6gOlx5hjQNdSDRuInOmnbCTorQyHpAW9vnhOrl0fHCla3CRjtAlhBGjhDuxsGbpqKgtZaANsZJK9EMs9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7YEXoQUD3JMjlGXZzkgYXKxViC6xGrp+7BG0l5WOX8=;
 b=elG6iUPuO4qAwPZc+LVk1ltKbUeyLh/TysHYCnrbgrgIknt5bBvu9DeW+DiJYdL9SGvsBTnHyWskLBCZcRmbetoC1jsfez+XmDWkmnbWbiirtgjnhS9YQBHNq5zzUGM04aINyKc+xViP2TUKYlIugTx2vcTUFkhZX/cPxUWzUqFplKxXTA4AEB0CVMnE5x8G0kxgQewSgDnewzyViCaUhlmVqdZokQVX2revPO2voG1vT3FoMi8wLlIDrRDgbAlfVwevzUiACXvrtJ+/yzLBreLXyeRJYZUffDnjjpbIt3Qybawoyd1mubl7tkFzSC6KVHO60coDcVkjmK71lk3c4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7YEXoQUD3JMjlGXZzkgYXKxViC6xGrp+7BG0l5WOX8=;
 b=bq8E/2p8DKObfc0iAcv230JX0qKomx9KqFDaK9pK6ERSbb9FzOjnyIoTyhKBpLQ5FMJrZBVQ55Pp0bzSwu6l0G4RfzCgYUPRVL01cIyL0lNNJjzGeSXP08+RO77FFWM6TkdJ/gT6V4RjOvxWGXOxyAVwpjBe+IfVkIXKqU9mrcM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Thu, 6 Aug
 2020 09:12:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Thu, 6 Aug 2020
 09:12:58 +0000
Subject: Re: [2/2] drm/ttm: make TT creation purely optional v3
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20200629151925.2096-2-christian.koenig@amd.com>
 <a1ba1387-1270-32e3-960f-f98495d92c11@daenzer.net>
 <03df2698-293b-2dff-923a-f8c731f55dec@gmail.com>
 <b818b065-50cd-9e8a-3cff-01dd124a04c4@daenzer.net>
 <8d5809be-104d-40e8-e8bb-5186d5b565b5@amd.com>
 <0ee49463-84d7-5150-a68c-57a1da7b5efb@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <24baac02-2fd0-c2da-c3b3-82feb0829bdf@amd.com>
Date: Thu, 6 Aug 2020 11:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0ee49463-84d7-5150-a68c-57a1da7b5efb@daenzer.net>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0018.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.17 via Frontend Transport; Thu, 6 Aug 2020 09:12:57 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3bc922e4-ff25-477e-1adf-08d839e8e973
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142EB18DE8C966A9B90691D83480@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yq8+x+D2nCJWF/9E0CswO9bmFYnTd1yxmEJGQvYtkzotPh4oU9Ar1GIdTtiDiS01uVY1JS9R6dLEpYRPbduhfgh+MFaDZpfeFBK2be9Fpy/FhR+phCqJjYMH0yuknGB/5RvSrT0wKMnt7ml6v+e/9sjA9+oCXpEyaHfXZqxU8XhXuY5szOnsztilQAsd02xVNGGaHSNHdtcEjlNWhl/ietLpnuoELiUYy47iuypPVZlZ/bqaYPD+ciFelZzcxsTmC6h/K+E0NvFa6qi8ahiqcjpxsSx90T7XEf2odmb9qPZegqjbBvpt7eJsMEDx1ekQDv9awBc/o3dfw9MFPycG4BXumpSOopwO+AB/CLulfmRTLwbuSxdyTIXEDOm5kIi+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(6666004)(36756003)(66476007)(5660300002)(4326008)(8936002)(86362001)(6486002)(66946007)(66556008)(316002)(52116002)(478600001)(83380400001)(6916009)(8676002)(16526019)(2906002)(53546011)(31696002)(2616005)(66574015)(186003)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Tq5Cpyj7wlHQ1UoHzEcTkpBsiZvLF3fKf+OJdxfThXQtCag1mJEMvalvRtDHrl62jherg1Jr6iATdAUmYp/wViKxBJbgbzbJTQbafpCwwMqdYaXkPBjOIknHyG4OcFXH+A/hr7KQA2YrtHOpLR45oTYiXjLjf5FBFEETZ/stiRGulMpOy/Unj51P7jUr4R0zVC41yvYKY2kxkwszGUhAfl0KgS6m/ouj+flNsWoKuPiYwbRYxDKcdFvj8RzstrQMj/bpQOs20p2tjBabQdWoHHiFyhO0pBLSiDVi7DWmDEyknFnXG2YuWYZ7eubxGnAghJA32MmnlTuDvcVd2p1JShBfBdiFoCtXSVv/3cSh390Uw+X4U/GkOxwUwnT9su8OaO/XjplMWvOoeS4bwXAUrp/p4Er9KrE3K3zOb8w8LIVTR19GR73spiOrSAm65dIGj0S05cObo5Yn0yCAclVOecJmGuP7FUtRLOpxicA5Zt3oEDT74q2Zh58JaUPQlcZyfL2VtRYiodFyWFM5Xh9/naTFX+fncB6rlWiMRXxIIqMtoMHMNTfj0BFnCIeNHXRxujx4HzuvoJ4Wao37Bn+qWzEYhqCp3JBMaMQOZ8q/SA3VkHHzrf9AmqxWnMp2tAT+YSupR2tB+L2pH9D9DiYMR1G9cMC4Wu8CryvbOciZMFvv212jLMVuDLWHTFxYxv/a77jwg3thH95o8q5qXsm0tg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc922e4-ff25-477e-1adf-08d839e8e973
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 09:12:58.7334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7cMguIl/rTuhipPIWdPWC09uti3RRIrzEGKkuOIO9tZdYTevz7tiEeEe9Hfu2EH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDguMjAgdW0gMTE6MDUgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTA4
LTA2IDEwOjQzIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA2LjA4LjIwIHVt
IDEwOjAxIHNjaHJpZWIgTWljaGVsIETDpG56ZXI6Cj4+PiBPbiAyMDIwLTA4LTA2IDk6MTMgYS5t
LiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAwNS4wOC4yMCB1bSAxODoxNiBzY2hy
aWViIE1pY2hlbCBEw6RuemVyOgo+Pj4+PiBPbiAyMDIwLTA2LTI5IDU6MTkgcC5tLiwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+IFdlIG9ubHkgbmVlZCB0aGUgcGFnZSBhcnJheSB3aGVu
IHRoZSBCTyBpcyBhYm91dCB0byBiZSBhY2Nlc3NlZC4KPj4+Pj4+Cj4+Pj4+PiBTbyBub3Qgb25s
eSBwb3B1bGF0ZSwgYnV0IGFsc28gY3JlYXRlIGl0IG9uIGRlbWFuZC4KPj4+Pj4+Cj4+Pj4+PiB2
MjogbW92ZSBOVUxMIGNoZWNrIGludG8gdHRtX3R0X2NyZWF0ZSgpCj4+Pj4+PiB2MzogZml4IHRo
ZSBvY2N1cnJlbmNlIGluIHR0bV9ib19rbWFwX3R0bSBhcyB3ZWxsCj4+Pj4+IFRoaXMgYnJva2Ug
YW1kZ3B1IHVzZXJwdHIgZnVuY3Rpb25hbGl0eSBmb3IgbWUsIGluIHBhcnRpY3VsYXIgYWxsCj4+
Pj4+IEdMX0FNRF9waW5uZWRfbWVtb3J5IHBpZ2xpdCB0ZXN0cywgZS5nLgo+Pj4+Pgo+Pj4+PiAu
Li4vcGlnbGl0L2Jpbi9hbWRfcGlubmVkX21lbW9yeSBkZWNyZW1lbnQtb2Zmc2V0IC1hdXRvIC1m
Ym8KPj4+Pj4gT2Zmc2V0IGlzIGRlY3JlbWVudGVkLCBubyB3YWl0Lgo+Pj4+PiBNZXNhOiBVc2Vy
IGVycm9yOiBHTF9JTlZBTElEX09QRVJBVElPTiBpbiBnbEJ1ZmZlckRhdGEKPj4+Pj4gWy4uLl0K
Pj4+Pj4gVW5leHBlY3RlZCBHTCBlcnJvcjogR0xfSU5WQUxJRF9PUEVSQVRJT04gMHg1MDIKPj4+
Pj4gKEVycm9yIGF0IHRlc3RzL3NwZWMvYW1kX3Bpbm5lZF9tZW1vcnkvdGVzdC5jOjIxNCkKPj4+
Pj4gUElHTElUOiB7InJlc3VsdCI6ICJmYWlsIiB9Cj4+Pj4gQnV0IG5vIGNyYXNoZXM/IEkgd291
bGQgaGF2ZSBleHBlY3RlZCBhIE5VTEwgcG9pbnRlciBkZXJlZiBpZiB3ZSBoYXZlCj4+Pj4gbWlz
c2VkIGNhbGwgcGF0aC4KPj4+IE5vIGNyYXNoZXMuIFNpbmNlIGEgR0wgZXJyb3IgaXMgcmFpc2Vk
LCBteSBndWVzcyB3b3VsZCBiZSB0aGF0IGFuIGlvY3RsCj4+PiB3aGljaCB3YXMgcHJldmlvdXNs
eSBzdWNjZWVkaW5nIGlzIG5vdyByZXR1cm5pbmcgYW4gZXJyb3IuCj4+IE1obSwgSSBjYW4gcmVw
cm9kdWNlIHRoZSBwcm9ibGVtIHRoYXQgdXNlcnB0cnMgZG9lc24ndCB3b3JrIGFueSBtb3JlLgo+
PiBCdXQgZXZlbiB3aXRoIHRoZSBtZW50aW9uZWQgcGF0Y2ggcmV2ZXJ0ZWQgdGhhdCBzdGlsbCBk
b2Vzbid0IHdvcmsgb24KPj4gdGhlIHRpcCBvZiBkcm0tbWlzYy1uZXh0Lgo+IE1heWJlIHRoZXJl
IGFyZSBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyBpdCBhcyB3ZWxsLCBlLmcuCj4KPiBlMDRiZTIz
MTBiNWUgImRybS90dG06IGZ1cnRoZXIgY2xlYW51cCB0dG1fbWVtX3JlZyBoYW5kbGluZyIKPiAx
ZTY5MWUyNDQ0ODcgImRybS9hbWRncHU6IHN0b3AgYWxsb2NhdGluZyBkdW1teSBHVFQgbm9kZXMi
Cj4KPiBjb21lIHRvIG1pbmQuCj4KPgo+PiBBcmUgeW91IHN1cmUgeW91ciBiaXNlY3RpbmcgaXMg
cmlnaHQ/Cj4gRmFpcmx5IHN1cmUuIElmIHRoYXQgY29tbWl0IHdvcmtzIG9yIGl0cyBwYXJlbnQg
ZG9lc24ndCB3b3JrIGZvciB5b3UsIEkKPiBjYW4gcmV0cnkuCgpJJ3ZlIGZpZ3VyZWQgb3V0IHdo
YXQncyB3cm9uZyBoZXJlLCBhbmQgeWVzIHRoYXQgbmVlZHMgdG8gZXh0cmEgaGFuZGxpbmcuCgpH
b2luZyB0byBoYXZlIGEgcGF0Y2ggaW4gYSBtaW51dGUuCgpUaGFua3MgZm9yIHRoZSBub3RpY2Us
CkNocmlzdGlhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
