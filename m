Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C72B6F95
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 21:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F38E789EAC;
	Tue, 17 Nov 2020 20:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423989EAC;
 Tue, 17 Nov 2020 20:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXyjNuFpTmG7/kDPH5vv5DuVoTnUcfYFKLJ4jurw/M8Z3bEPJIpYD7+33X+iLFwaQ4Oxlm8iHabtWZauPJk3qZmsatXqNjUeIL41NsAwITrLFgtwQ3ZpB96OczO3e5umiRHaEjKZVXjNxKJEdEUgf28faqz92RugOzFuCc9DBfezLnwVMC6pOdK80ameGx6kihYqbg5vWS6vd6McCUiU/djrTnrssoMObJ2Vhxc2pt/NqI29eX4f6bA8tTe2NkvtHBBN8XRDwjerM/nJ08k2OjKaUc4GOHrWAUcLUIb45zCDv7rvzzd0R/2GYZKt8Kx9h0ZKGS7QuAy3zc/czrKpjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vsDAAuoTPbTHad5jR400rAwz/3znQo+ACy0q4Ko/ek=;
 b=m9Q1cBIMvpGeDi1oU7GDBT9nPo/EFozz9by6F7oMh+m9ffWBzABOSvrsTrfpK8sUvviVMRmGLqCAp5NoPTfq1HToOLxv0/yvy5YkwnuD8OM4LliEIh4OUDBp3y7HmSHJgwJxKV0mMRziA7GvAS7p4VkXrJIuO8xY8YZJS2V96PsPA/yjmCvQSZkYaWRZnandlFgztmovZwMWMHnDGCRpss/qBmSZMOUY/sL7AB4TdWZTxkHvU6LIJ6Re6ccPr4ZvCm4g+D4u6RClQoZbLRInbB6OrCsO/nCfbHmV+TBj1RoYfGpK8Qra9zhvsqBGFG1hcvdiAG0MJHDUfCoqyJplpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vsDAAuoTPbTHad5jR400rAwz/3znQo+ACy0q4Ko/ek=;
 b=0PWT4zbN5F/U0Th4zGs+TDkoWP6A9TajxhwiO7XxfTGMdfbwtMRIzeZ9SRwPL0n/T6kB0JWTJS7mOZdGC+mBUb46mTkbeQNF+4gOs7jFBcRQBBEUk5mHaa0I7j2MWLGadmvdoWpoal9FEvyFv7uP5RqPi2jmeMz6kL9rClNEcj4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25; Tue, 17 Nov 2020 20:07:26 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 20:07:26 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
Date: Tue, 17 Nov 2020 15:07:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201117194922.GW401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: CH0PR04CA0091.namprd04.prod.outlook.com
 (2603:10b6:610:75::6) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.0.72] (165.204.55.251) by
 CH0PR04CA0091.namprd04.prod.outlook.com (2603:10b6:610:75::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Tue, 17 Nov 2020 20:07:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 97c5146c-4cb5-449e-21ed-08d88b34673b
X-MS-TrafficTypeDiagnostic: DM5PR12MB1145:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1145416658E74A382A60F42EEAE20@DM5PR12MB1145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxmDrlv97/+t6WJgAxKUuHlM2j7YKlNnXnwc2q/Z54ev2nhLbp0XHMM3/kn+FxfBl8NSraTu1CnYy1AQL17aJIDQiAp/WiEYwdcmIpYeYSAv6MJWbVV0OYz0VtZu8DZLsou3tAlY0hJah2sozznXkFUyqPDyJ91PZIRGzZ7YM/2Ghv5m6OZZQpXPAd7RBycA2NymQ45V35GQMRtFxFAQqzZG+SdlQkJOgBPAXQGvEQXZNcvi22UdPtI3jsIz4RUWz69utGEXXcK2aZjWsE1TuUQPFobhuEH5NWx4RGNM0AGl8B3HPDoJNBnN7JVP/gqdx9Rvy7lfyAfJZh0mjObpEIDrjCiDs05yHDweTGJAYUnjngS/8kUuRLNURDsJqzk5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(2616005)(186003)(16526019)(956004)(26005)(6486002)(31686004)(52116002)(6916009)(53546011)(478600001)(36756003)(86362001)(83380400001)(31696002)(16576012)(316002)(4326008)(2906002)(66946007)(8936002)(66556008)(66476007)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: StQ+3AOklg/yCl1et9+MZfV1/XaXXuClNA7VCC1N6wRdtGvkJyfR4IUETV2BJsmtfs/COnIeDAKKYGDQ4lSHbh/Y2ApkkY62znOIKPOhmhwyqISseKD0Ryz/5KJOzNBTDgWxUbpohMb4Z3QXDTxNupsr3NNk+WEmDPRMQOjpoP7ZvCKTxPveBRb0ZXG9cmFigGhfgxuhoirwupHLt66b6twQCxrJ+weaRu2tlk1/m0HcNQNghG58nWyDSbB4GsSKW+ZCm9U2IgZekGJ53AhYskEZi0v0zNI8AOIHQslN5RZuOfOJ5hXDLAXv6leoLzyUWlfE9VJ+p6G+y1WRnDVDy1g02k/UmVjHUT6WiG1CjSdU4a/i9JvBZ3w9p2DjjuVsyxpJl263jUXC5Tl2eRmwMyZ3w/cIVvQUjOmSFaVOjOLZUxW4iWqsHPidCBCL69WP3yKjzgqAMFcAShlqqXUE9iL7GOxeRscoH4Q+dckpG0RyaV0J2wlSracR8sCpHAgCiMj+om9eK3g9t3ILPsAv298iiJERAeTxd5T+XJD8jnPkPEgSfTHkXkvydBhV+gw9PiVPODgl0L3760K0rcrHm9SO0pFtADKwZouUwr5WJi2eYfnPA1lDnVq8Orn3tcxJVrEzc2fBzt8zbgvtFAPyAi5KGzOXQrC/Lrw4EclQTRaPlNEVzQOmW6go8GMcpk/1iTRH11tmdQ620zXGd+YAKHd2RwA9WC1+MXZn5rhoQI/QsDbto1pOZiGkgcNWU+XlBSIXRoi4sPJlQJd3ZAeEJQ/CTZhcBC7rw8GCQmL9bq9YQMze9I9vMBlBFhkVOzfQGvbpPw5RjvlucCPN9VxjVS6+KzQRic+bjeTtSOeo9AJ/e4plJKbJBM7x8UXyL/9ugYNBiAipx7KQOCh1kb8aMw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c5146c-4cb5-449e-21ed-08d88b34673b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 20:07:26.1186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3E5XVZzOGJR4W7bAIRzkMyeCgRwBTGkJwXlwChCf7uPR0ZpI6NU4odddMW7mmt0DfVzLGZHm56Cgl8FHyPk9Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1145
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzE3LzIwIDI6NDkgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gVHVlLCBOb3Yg
MTcsIDIwMjAgYXQgMDI6MTg6NDlQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+
IE9uIDExLzE3LzIwIDE6NTIgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+PiBPbiBUdWUsIE5v
diAxNywgMjAyMCBhdCAwMTozODoxNFBNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToK
Pj4+PiBPbiA2LzIyLzIwIDU6NTMgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+IE9uIFN1
biwgSnVuIDIxLCAyMDIwIGF0IDAyOjAzOjA4QU0gLTA0MDAsIEFuZHJleSBHcm9kem92c2t5IHdy
b3RlOgo+Pj4+Pj4gTm8gcG9pbnQgdG8gdHJ5IHJlY292ZXJ5IGlmIGRldmljZSBpcyBnb25lLCBq
dXN0IG1lc3NlcyB1cCB0aGluZ3MuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+
ICAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAxNiArKysrKysr
KysrKysrKysrCj4+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pv
Yi5jIHwgIDggKysrKysrKysKPj4+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlv
bnMoKykKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5j
Cj4+Pj4+PiBpbmRleCA2OTMyZDc1Li41ZDZkM2Q5IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMKPj4+Pj4+IEBAIC0xMTI5LDEyICsxMTI5LDI4
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKPj4+
Pj4+ICAgICAJcmV0dXJuIHJldDsKPj4+Pj4+ICAgICB9Cj4+Pj4+PiArc3RhdGljIHZvaWQgYW1k
Z3B1X2NhbmNlbF9hbGxfdGRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+Pj4gK3sK
Pj4+Pj4+ICsJaW50IGk7Cj4+Pj4+PiArCj4+Pj4+PiArCWZvciAoaSA9IDA7IGkgPCBBTURHUFVf
TUFYX1JJTkdTOyArK2kpIHsKPj4+Pj4+ICsJCXN0cnVjdCBhbWRncHVfcmluZyAqcmluZyA9IGFk
ZXYtPnJpbmdzW2ldOwo+Pj4+Pj4gKwo+Pj4+Pj4gKwkJaWYgKCFyaW5nIHx8ICFyaW5nLT5zY2hl
ZC50aHJlYWQpCj4+Pj4+PiArCQkJY29udGludWU7Cj4+Pj4+PiArCj4+Pj4+PiArCQljYW5jZWxf
ZGVsYXllZF93b3JrX3N5bmMoJnJpbmctPnNjaGVkLndvcmtfdGRyKTsKPj4+Pj4+ICsJfQo+Pj4+
Pj4gK30KPj4+Pj4gSSB0aGluayB0aGlzIGlzIGEgZnVuY3Rpb24gdGhhdCdzIHN1cHBvc2VkIHRv
IGJlIGluIGRybS9zY2hlZHVsZXIsIG5vdAo+Pj4+PiBoZXJlLiBNaWdodCBhbHNvIGp1c3QgYmUg
eW91ciBjbGVhbnVwIGNvZGUgYmVpbmcgb3JkZXJlZCB3cm9uZ2x5LCBvciB5b3VyCj4+Pj4+IHNw
bGl0IGluIG9uZSBvZiB0aGUgZWFybGllciBwYXRjaGVzIG5vdCBkb25lIHF1aXRlIHJpZ2h0Lgo+
Pj4+PiAtRGFuaWVsCj4+Pj4gVGhpcyBmdW5jdGlvbiBpdGVyYXRlcyBhY3Jvc3MgYWxsIHRoZSBz
Y2hlZHVsZXJzwqAgcGVyIGFtZGdwdSBkZXZpY2UgYW5kIGFjY2Vzc2VzCj4+Pj4gYW1kZ3B1IHNw
ZWNpZmljIHN0cnVjdHVyZXMgLCBkcm0vc2NoZWR1bGVyIGRlYWxzIHdpdGggc2luZ2xlIHNjaGVk
dWxlciBhdCBtb3N0Cj4+Pj4gc28gbG9va3MgdG8gbWUgbGlrZSB0aGlzIGlzIHRoZSByaWdodCBw
bGFjZSBmb3IgdGhpcyBmdW5jdGlvbgo+Pj4gSSBndWVzcyB3ZSBjb3VsZCBrZWVwIHRyYWNrIG9m
IGFsbCBzY2hlZHVsZXJzIHNvbWV3aGVyZSBpbiBhIGxpc3QgaW4KPj4+IHN0cnVjdCBkcm1fZGV2
aWNlIGFuZCB3cmFwIHRoaXMgdXAuIFRoYXQgd2FzIGtpbmRhIHRoZSBpZGVhLgo+Pj4KPj4+IE1p
bmltYWxseSBJIHRoaW5rIGEgdGlueSB3cmFwcGVyIHdpdGggZG9jcyBmb3IgdGhlCj4+PiBjYW5j
ZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7IHdoaWNoIGV4cGxhaW5zIHdo
YXQgeW91IG11c3QKPj4+IG9ic2VydmUgdG8gbWFrZSBzdXJlIHRoZXJlJ3Mgbm8gcmFjZS4KPj4K
Pj4gV2lsbCBkbwo+Pgo+Pgo+Pj4gSSdtIG5vdCBleGFjdGx5IHN1cmUgdGhlcmUncyBubwo+Pj4g
Z3VhcmFudGVlIGhlcmUgd2Ugd29uJ3QgZ2V0IGEgbmV3IHRkciB3b3JrIGxhdW5jaGVkIHJpZ2h0
IGFmdGVyd2FyZHMgYXQKPj4+IGxlYXN0LCBzbyB0aGlzIGxvb2tzIGEgYml0IGxpa2UgYSBoYWNr
Lgo+Pgo+PiBOb3RlIHRoYXQgZm9yIGFueSBURFIgd29yayBoYXBwZW5pbmcgcG9zdCBhbWRncHVf
Y2FuY2VsX2FsbF90ZHIKPj4gYW1kZ3B1X2pvYl90aW1lZG91dC0+ZHJtX2Rldl9pc191bnBsdWdn
ZWQKPj4gd2lsbCByZXR1cm4gdHJ1ZSBhbmQgc28gaXQgd2lsbCByZXR1cm4gZWFybHkuIFRvIG1h
a2UgaXQgd2F0ZXIgcHJvb2YgdGlnaHQKPj4gYWdhaW5zdCByYWNlCj4+IGkgY2FuIHN3aXRjaCBm
cm9tIGRybV9kZXZfaXNfdW5wbHVnZ2VkIHRvIGRybV9kZXZfZW50ZXIvZXhpdAo+IEhtIHRoYXQn
cyBjb25mdXNpbmcuIFlvdSBkbyBhIHdvcmtfY2FuY2VsX3N5bmMsIHNvIHRoYXQgYXQgbGVhc3Qg
bG9va3MKPiBsaWtlICJ0ZHIgd29yayBtdXN0IG5vdCBydW4gYWZ0ZXIgdGhpcyBwb2ludCIKPgo+
IElmIHlvdSBvbmx5IHJlbHkgb24gZHJtX2Rldl9lbnRlci9leGl0IGNoZWNrIHdpdGggdGhlIHRk
ciB3b3JrLCB0aGVuCj4gdGhlcmUncyBubyBuZWVkIHRvIGNhbmNlbCBhbnl0aGluZy4KCgpBZ3Jl
ZSwgc3luY2hyb25pemVfc3JjdSBmcm9tIGRybV9kZXZfdW5wbHVnIHNob3VsZCBwbGF5IHRoZSBy
b2xlCm9mICdmbHVzaGluZycgYW55IGVhcmxpZXIgKGluIHByb2dyZXNzKSB0ZHIgd29yayB3aGlj
aCBpcwp1c2luZyBkcm1fZGV2X2VudGVyL2V4aXQgcGFpci4gQW55IGxhdGVyIGFyaXNpbmcgdGRy
IHdpbGwgdGVybWluYXRlIGVhcmx5IHdoZW4gCmRybV9kZXZfZW50ZXIKcmV0dXJucyBmYWxzZS4K
CldpbGwgdXBkYXRlLgoKQW5kcmV5CgoKPgo+IEZvciByYWNlIGZyZWUgY2FuY2VsX3dvcmtfc3lu
YyB5b3UgbmVlZDoKPiAxLiBtYWtlIHN1cmUgd2hhdGV2ZXIgaXMgY2FsbGluZyBzY2hlZHVsZV93
b3JrIGlzIGd1YXJhbnRlZWQgdG8gbm8gbG9uZ2VyCj4gY2FsbCBzY2hlZHVsZV93b3JrLgo+IDIu
IGNhbGwgY2FuY2VsX3dvcmtfc3luYwo+Cj4gQW55dGhpbmcgZWxzZSBpcyBjYXJnby1jdWx0ZWQg
d29yayBjbGVhbnVwOgo+Cj4gLSAxLiB3aXRob3V0IDIuIG1lYW5zIGlmIGEgd29yayBnb3Qgc2No
ZWR1bGVkIHJpZ2h0IGJlZm9yZSBpdCdsbCBzdGlsbCBiZQo+ICAgIGEgcHJvYmxlbS4KPiAtIDIu
IHdpdGhvdXQgMS4gbWVhbnMgYSBzY2hlZHVsZV93b3JrIHJpZ2h0IGFmdGVyIG1ha2VzIHlvdSBj
YWxsaW5nCj4gICAgY2FuY2VsX3dvcmtfc3luYyBwb2ludGxlc3MuCj4KPiBTbyBlaXRoZXIgYm90
aCBvciBub3RoaW5nLgo+IC1EYW5pZWwKPgo+PiBBbmRyZXkKPj4KPj4KPj4+IC1EYW5pZWwKPj4+
Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pgo+Pj4+Pj4gKwo+Pj4+Pj4gICAgIHN0YXRpYyB2b2lkCj4+
Pj4+PiAgICAgYW1kZ3B1X3BjaV9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4+Pj4+PiAg
ICAgewo+Pj4+Pj4gICAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gcGNpX2dldF9kcnZkYXRh
KHBkZXYpOwo+Pj4+Pj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3By
aXZhdGU7Cj4+Pj4+PiAgICAgCWRybV9kZXZfdW5wbHVnKGRldik7Cj4+Pj4+PiArCWFtZGdwdV9j
YW5jZWxfYWxsX3RkcihhZGV2KTsKPj4+Pj4+ICAgICAJdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRk
cmVzc19zcGFjZSgmYWRldi0+bW1hbi5iZGV2KTsKPj4+Pj4+ICAgICAJYW1kZ3B1X2RyaXZlcl91
bmxvYWRfa21zKGRldik7Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pv
Yi5jCj4+Pj4+PiBpbmRleCA0NzIwNzE4Li44N2ZmMGMwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPj4+Pj4+IEBAIC0yOCw2ICsyOCw4IEBA
Cj4+Pj4+PiAgICAgI2luY2x1ZGUgImFtZGdwdS5oIgo+Pj4+Pj4gICAgICNpbmNsdWRlICJhbWRn
cHVfdHJhY2UuaCIKPj4+Pj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KPj4+Pj4+ICsKPj4+
Pj4+ICAgICBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1fc2NoZWRf
am9iICpzX2pvYikKPj4+Pj4+ICAgICB7Cj4+Pj4+PiAgICAgCXN0cnVjdCBhbWRncHVfcmluZyAq
cmluZyA9IHRvX2FtZGdwdV9yaW5nKHNfam9iLT5zY2hlZCk7Cj4+Pj4+PiBAQCAtMzcsNiArMzks
MTIgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgZHJtX3NjaGVkX2pv
YiAqc19qb2IpCj4+Pj4+PiAgICAgCW1lbXNldCgmdGksIDAsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1
X3Rhc2tfaW5mbykpOwo+Pj4+Pj4gKwlpZiAoZHJtX2Rldl9pc191bnBsdWdnZWQoYWRldi0+ZGRl
dikpIHsKPj4+Pj4+ICsJCURSTV9JTkZPKCJyaW5nICVzIHRpbWVvdXQsIGJ1dCBkZXZpY2UgdW5w
bHVnZ2VkLCBza2lwcGluZy5cbiIsCj4+Pj4+PiArCQkJCQkgIHNfam9iLT5zY2hlZC0+bmFtZSk7
Cj4+Pj4+PiArCQlyZXR1cm47Cj4+Pj4+PiArCX0KPj4+Pj4+ICsKPj4+Pj4+ICAgICAJaWYgKGFt
ZGdwdV9yaW5nX3NvZnRfcmVjb3ZlcnkocmluZywgam9iLT52bWlkLCBzX2pvYi0+c19mZW5jZS0+
cGFyZW50KSkgewo+Pj4+Pj4gICAgIAkJRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIGJ1dCBz
b2Z0IHJlY292ZXJlZFxuIiwKPj4+Pj4+ICAgICAJCQkgIHNfam9iLT5zY2hlZC0+bmFtZSk7Cj4+
Pj4+PiAtLSAKPj4+Pj4+IDIuNy40Cj4+Pj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
