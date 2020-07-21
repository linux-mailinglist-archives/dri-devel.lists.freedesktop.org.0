Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79BA228838
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 20:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583616E446;
	Tue, 21 Jul 2020 18:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700084.outbound.protection.outlook.com [40.107.70.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05116E446;
 Tue, 21 Jul 2020 18:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JStp5UWhvGbTuPcEFbUJhzEXV6RY3SAsDqXKVK876yTRxbpEgXJrAvRYvLNQlq1trNbWOzD9lTnxls3vBAgWhhcDY/tMItqTYUerNEx1I0KEjihZY6aSshL+AvPd08cGskueAHJulyeDbJ5WCceVyqm1AAu/qoBWDueMuxXrJCbGLpUn2usVBb6XdI0jJJu5gL1jRuv04BHI3lKBiSlAYTl4joMoNKGZvx9o7ttFb1x6IBA8JHSm2I0kq09/r3PbuqEMJ6C2CaRzUq6AU1mdara2Rr5AEySVYw62TfOl0W1fIcx9Jh9V1w6CPQyMUm439Zm833KJR8Gzm7WCIK1j1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0eWWm26+CsmmcJu7wvZVg0L5lQq1FveRDVsubp0Pfo=;
 b=W2ehOtAd0Fo8Me/cUMa/pGjtaSr04/MZ3j3kRKas4MJS1Z9xzxboCsKbwiTmB1G2sRFPEZVyGbITMQnCfzw7SjK5+pEG6P3opY4X/Gq+UUsD/R4K0ss+n9heur9gJ4plHxlouDeAKnrBorhp2+5Ly5TBYBdPBre2XfDKWanaCFUefJ3EkWZvT8K+wagZhDxnk7ZY67QSgEnYnJTdyRinNxo99V+rDV1OwLsF+fMCtR1yztdhxsEFXxA/qfGUc1Z1YRXKWZhu3MU5g1gXygfawJiBEyd/RIa12DZMElHVxnSkUlcLCnzzFQ86LDepHrR1hdEFhqBOk/aBqqvSr1Y0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0eWWm26+CsmmcJu7wvZVg0L5lQq1FveRDVsubp0Pfo=;
 b=j1vZvk4G42a6gLQcqiqdzLvViJB3lYVQ4NmFDgzGqQNMvSfe1ctS2KkmrVnoLD9yoXH4ZWuD4gBHACQJXIbE9aeSMYzB6rfuNDJXgpP8GTzxeDK/1SH9N08HaZxxXAUZpkEfha2HvHam/Cnl0BPph+reTXe5FqSGAto+iK2RPeM=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3124.namprd12.prod.outlook.com (2603:10b6:408:41::12)
 by BN8PR12MB3523.namprd12.prod.outlook.com (2603:10b6:408:69::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.26; Tue, 21 Jul
 2020 18:29:17 +0000
Received: from BN8PR12MB3124.namprd12.prod.outlook.com
 ([fe80::5117:9f4f:6cad:786d]) by BN8PR12MB3124.namprd12.prod.outlook.com
 ([fe80::5117:9f4f:6cad:786d%4]) with mapi id 15.20.3216.020; Tue, 21 Jul 2020
 18:29:17 +0000
Subject: Re: [PATCH v4] drm/scheduler: Avoid accessing freed bad job.
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>, Alex Deucher <alexdeucher@gmail.com>
References: <1574715089-14875-1-git-send-email-andrey.grodzovsky@amd.com>
 <0de5ad33ca2ff86fee13a453aa9096c274afbd3c.camel@pengutronix.de>
 <d710aba7c3acc537bfb1c20362f7c8dbee421f02.camel@pengutronix.de>
 <740fb929-e788-075b-87db-e2524ed4b086@gmail.com>
 <CADnq5_Np=OFgqAb4TPRz5yqx1YZSwWybS=F6R_r6r01QRrzADA@mail.gmail.com>
 <61128c11-9e65-bc21-6306-ea4efea18b76@amd.com>
 <90de1234-a103-a695-4ad7-83b1486e15ee@amd.com>
 <02ba868c-e904-3681-c795-59a4e48926d5@amd.com>
 <b1ebac7c-5593-bc87-1f36-ea55503f05d1@amd.com>
 <4b5c56d2-4ce4-3626-623f-d4a8124d76fa@amd.com>
 <d4ba6ed9-604e-5e88-f427-679639dcf8e9@amd.com>
 <dbb2e7f0-85b7-f9e0-7875-144a8cca4993@amd.com>
 <2cef1ca3-115c-44ee-9caf-6cb8d6404796@amd.com>
 <e38c494a544d7e0607ee89abcc6a85419e700011.camel@pengutronix.de>
 <d4368e17-cbdf-d67b-7386-03b6eec7ba17@amd.com>
 <de43fd14-47a5-3089-0cce-4b39a0ae47f6@amd.com>
 <2a65789b-6958-9bef-58ec-e88e7e907b8b@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
Date: Tue, 21 Jul 2020 14:29:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2a65789b-6958-9bef-58ec-e88e7e907b8b@amd.com>
Content-Language: en-CA
X-ClientProxiedBy: YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::37) To BN8PR12MB3124.namprd12.prod.outlook.com
 (2603:10b6:408:41::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.250) by
 YTOPR0101CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18 via Frontend
 Transport; Tue, 21 Jul 2020 18:29:16 +0000
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5f12baff-9ee2-43ac-53e6-08d82da3fa16
X-MS-TrafficTypeDiagnostic: BN8PR12MB3523:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB352340FCAC63144A0F44196A99780@BN8PR12MB3523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fmaUWRz2DmM1xGPvyJtGDRuXmRSNqTU4fCRogt5mVT9X0locVDUgvvtLAGUYkp2zJIjwYAHmmD2MGdkAG36hhjxh0WvIKmRzTvCkCeYYVVn7e47qCbjLtUwPZlXiFGBxx7Wc2NG6JmemDf/f2OPaI2/+6vs6rRC3sQE6/V3H3KXxJOAYceIK9LqmmtLBsSKDstwYfvG+Ozd0HBLNe6FJ+68/5V1Ir9g6++UJPsW+G6FE9yl0yFcwtSD0YeiB/ngmfXgMdv/pRvP3ZFYp1O9qz0eW3Qp+PEXNbyXHt3sEfFbknJq6Svg+D+VwmmaadVw9KzDCcZQXdp+/oWWBawSmdwjUIs4lgOmT+MWNTOlKOzFMdTy/3YJrj7wDYybRRrr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(8936002)(52116002)(54906003)(66556008)(44832011)(956004)(36756003)(83380400001)(110136005)(2906002)(53546011)(66946007)(66476007)(66574015)(16526019)(186003)(2616005)(4326008)(26005)(6506007)(86362001)(316002)(478600001)(6486002)(8676002)(5660300002)(31686004)(6512007)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GMnShN/Xb+w92V7QJnlEh+Tpm7iK44JlkJLotKP+jw2FDt+3KwQSLG9pETuCT8ne+RzMMTOR9i/U81/+T3hhpNPr6irlvVo04jRnV/8Dgo0YCp/XLJoN3htrIYB0UmGcb3+1MWKysY73HQoTMRC0Ga45WJm2XOQ8AtfWhYg/z9sVahHet+w6vHS97fmZvyl+RSDm+lTNcqDC/qMyB12pA56G5HZvSZJyOh52AH75RAKsrpwWxcO2sgGhFuPyzBOZYVBFHuuIJuJovqE8jVtN65vZSxlaeWUuxZ7P2VhMdI7QAKhSon5Gll8mKntq5U/TOdOqYjgO9Xf8gac8aqPlrRYFCkJVFIhnLJgRj2BT+ZmP3oB24um6zQGsHhQXhIK8TfrfIoE6m1X+oVf4UwoJYIlE5nnxBO+w2ZFZG3KyrWhe3l//ALDD0NTmlEeiqOtA5MqB83NiV/V/8dfFKVmMJJOd5DNfGepB41yTdAea1p0=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f12baff-9ee2-43ac-53e6-08d82da3fa16
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2020 18:29:17.3940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTTT3wVXuMU+cKjZRruwkbXBiuZLYag+oHi7WG+QV248dBoQ9RqNm+GT2e/eFqh/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3523
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
Cc: Emily Deng <Emily.Deng@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 steven.price@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHVjYXMsCgpUaGFuayB5b3UgZm9yIGZvbGxvd2luZyB1cCBvbiB0aGlzLiBTb21lIHRoaW5n
cyBoYXZlIHNsb3dlZCBkb3duLApnaXZlbiB0aGUgd29ybGQgcGFuZGVtaWMgd2UndmUgYmVlbiBl
eHBlcmllbmNpbmcgdGhpcyB5ZWFyLgoKSSd2ZSBoYWQgdGhlIGRlc2lnbiByZWFkeSBhbmQgaGFs
ZiBvZiBpdCBpbXBsZW1lbnRlZCBhbmQgY29tbWl0dGVkCmludG8gYSBicmFuY2guIEp1c3QgYXMg
cGVyIHdoYXQgSSB3cm90ZSBlYXJsaWVyIHRoaXMgeWVhciBvbiB0aGlzIHRocmVhZC4KCkkgbmVl
ZCB0byBmaW5pc2ggdGhlIHJlc3Qgd2hpY2ggaXNuJ3QgYmlnLCBidXQgZG9lcyBuZWVkCnNvbWUg
dW5yYXZlbGxpbmcgb2YgdGhlIGN1cnJlbnQgY29kZS4gVGhlbiBJIG5lZWQgdGVzdGluZywKd2hp
Y2ggSSBzdXBwb3NlIGEgbnVtYmVyIG9mIHBlb3BsZSBjYW4gaGVscCwgc28gbG9uZyBhcwp0aGV5
IGNhbiBtYWtlIGEgZnJhbWUgdGltZSBvdXQgYW5kIGtpY2sgaW4gdGhlIHRpbWVvdXQgaGFuZGxl
ci4KCkknbGwgaGF2ZSBtb3JlIGRldGFpbHMgaW4gYSBmZXcgd2Vla3MuCgpSZWdhcmRzLApMdWJl
bgoKT24gMjAyMC0wNy0yMSA5OjQyIGEubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+IENo
cmlzdGlhbiwgSSB3b3VsZCB3YW50IHRoaXMgdmVyeSBtdWNoIGJ1dCB1bmZvcnR1bmF0ZWx5IEkg
YW0gb24gYSBzdHJpY3QgCj4gc2NoZWR1bGUgZm9yIGFuIGludGVybmFsIHByb2plY3QgY3VycmVu
dGx5IGFuZCBoZW5jZSB3aWxsIG5vdCBiZSBhYmxlIHRvIAo+IGFjdGl2ZWx5IHBhcnRpY2lwYXRl
LiBJIHdpbGwgZG8gbXkgYmVzdCB0byBhbnN3ZXIgYW55IHF1ZXN0aW9ucyBMdWJlbiBtaWdodCBo
YXZlIAo+IGFib3V0IGN1cnJlbnQgaW1wbGVtZW50YXRpb24uCj4gCj4gQW5kcmV5Cj4gCj4gT24g
Ny8yMS8yMCA5OjM5IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBMdWJlbiBoYWQgYSBn
b29kIGlkZWEgaG93IHRvIHRhY2tsZSB0aGUgd2hvbGUgam9iIGhhbmRsaW5nLgo+Pgo+PiBBbmRy
ZXkvTHVjYXMgY2FuIHlvdSB3b3JrIHdpdGggTHViZW4gdG8gZ2V0IHRoaXMgY2xlYW5lZCB1cCBi
ZWNhdXNlIHRoZXJlIGFyZSAKPj4gYSBsb3Qgb2YgcmVxdWlyZW1lbnRzIG9uIHRoaXMgd2hpY2gg
bm90IG9ubHkgY29tZSBmcm9tIEFNRC4KPj4KPj4gVGhhbmtzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+
IEFtIDIxLjA3LjIwIHVtIDE1OjM2IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+PiBMdWNh
cywgTHViZW4gcGlja2VkIHRoZSB3b3JrIG9uIHRoaXMgYSBmZXcgbW9udGggYWdvIGFzIEkgd2Fz
IGRpdmVydGVkIHRvIGEgCj4+PiBkaWZmZXJlbnQgcHJvamVjdC4KPj4+Cj4+PiBMdWJlbiwgY2Fu
IHlvdSB1cGRhdGUgTHVjYXMgcGxlYXNlID8KPj4+Cj4+PiBBbmRyZXkKPj4+Cj4+PiBPbiA3LzIx
LzIwIDc6MDMgQU0sIEx1Y2FzIFN0YWNoIHdyb3RlOgo+Pj4+IEl0IHNlZW1zIHdlIGFsbCBkcm9w
cGVkIHRoZSBiYWxsIG9uIHRoaXMgb25lLiBJIGJlbGlldmUgdGhpcyBpcyBzdGlsbAo+Pj4+IGFu
IG9wZW4gaXNzdWUuIEhhcyB0aGVyZSBiZWVuIGFueSBwcm9ncmVzcyBmcm9tIHlvdXIgc2lkZSBv
biBmaXhpbmcKPj4+PiB0aGlzPwo+Pj4+Cj4+Pj4gUmVnYXJkcywKPj4+PiBMdWNhcwo+PgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
