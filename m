Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3AF27FC93
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 11:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D486E131;
	Thu,  1 Oct 2020 09:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BAA6E131
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 09:41:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MznE2FhOekBj8d4v2AdqfIrp9o7Jv0JlwoC1YHBKpyBcmq637uo3rsAEEKjA1gjJqeY078czsCaiMlcrfoYkwjBvDYlv8MYZxNlO0jWGMxqoMHOeuDG4a10WyECaQ81biyxIVDx6yP1OdfHSehzuLes/cqOmuKTMbRckUelKCgzZf/aE8cMrHPCYz1N+ukItQ6HiqMe2uHCpg4RRkCKvJr2T0u6+918IR0bc/woNFx1UkkoL4zdZN4lyNPXm/G2rc6DlZ+6S63OlOZ/A4UvBtZqjZ8vISe2S3zizSBeasQJjrvkzMllII4eVN+HZhZCB9Yopa1quQsB66xQ5BQnJvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxXd4gTxwMRy7Y1KRLYzIyQyvc98tNXNbEOKMFQMQaM=;
 b=VfaWplpz+aZx2mmWGT+WDzwAbtXKYVt8hYeU1ANTSJ2Iec21KzFTF9MJmyHU5yjEfbFQibZP3ObGD4b9hoPea/05Jxf3UNesNII+czrXsQuz1vmcroksAKjB8Ks2aZ/woBJiEUmZ1PFatJiw3aP70YAMrUl/vDc1YSPczIItDrBvrCAKJmbF4EjWuGXjnZElBnMt1y/fU+k1gTQFMHTYEYx8hBYqFNeAsPeTBf5aIYEIdWpbfz+6koW/iC3bPP4H542mOEciDmBGVz5951wRp8v20/jcUIpcWrAUiDC3F77cQOQFBbN+EzAvs8YvrP0GGUJg4R4PKd4y90hxdm+CTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxXd4gTxwMRy7Y1KRLYzIyQyvc98tNXNbEOKMFQMQaM=;
 b=oJZZjAS5dNEjmsz+e8bLeKPEv6ipan4qnZi4K3lDLwklwgo5ujJRAlFDM2GAZcoMre4hGliEYeLCTzIJYdsVqiZX2yJ2EoRy9YeGl+j9MgchWUt8OvB5PtwJ3OCjBBitpkGX6Qq0n15msxfKFBLaJNZlzJaDMlC1Xs6V2UvNWmg=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.24; Thu, 1 Oct
 2020 09:41:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 09:41:53 +0000
Subject: Re: [PATCH] drm/ttm: fix regression in ttm moves
To: Dave Airlie <airlied@gmail.com>
References: <20200930055459.31310-1-airlied@gmail.com>
 <CAPM=9txdYB4WPaXZGZ1XO-s_9BHjv===-QGvW+-N405T1_RsDQ@mail.gmail.com>
 <CAPM=9tzdT8suD5PZJGrWMM-kOSYYcvA3ZP2y=muZoQ6gNyJkRQ@mail.gmail.com>
 <7fe46260-95ed-114d-940b-0512f39b857d@amd.com>
 <CAPM=9tzsY7a2iQbdBo7c3zVuV8WVzaGrxzaNce_4dC8n2fQGng@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2d5c3256-a8df-26f5-a5eb-9bf7d0c2bdc4@amd.com>
Date: Thu, 1 Oct 2020 11:41:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAPM=9tzsY7a2iQbdBo7c3zVuV8WVzaGrxzaNce_4dC8n2fQGng@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:205:1::44) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:205:1::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.18 via Frontend Transport; Thu, 1 Oct 2020 09:41:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 132e2e88-7939-4b57-cb5f-08d865ee3ac7
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839AE7D13908E1C83EE69E483300@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzwPgJQY28FZACu14xYNuTsxWsOUdOnQb80/oq+rozeZZsw45g5OysaL2xA6S9vEhg7inTc0qChReLGJiQ3TJ5o8ZEq9bwv5gIsANvyTgz72qp42eoV8OpnByHdD5oUtZ2o23Im5Zb02xKOUydHzvAgyKSpXRWvsnpJjNzp1UgPN8UeT4wOtCBOSMgdjBrAdOCTaixbgZVI3rcAwG2yrWaYM47GQoIqzkJXMyZKbirPrT1ThVRSZXddEm8Icowg2casYU+unIGrTR0PDegT29hqdNnfffLUBRy54LGNZYrzC8eaYEpdlYd5eYbPA3GTRkXu1LniddWucZ+oq3oBn9/yHKJ4cxOWfzuJRP4qc9FMkf/kGnBflOmIIsxYeB+pAOSXlrEhDS0Amv64cAumrqgT7eJBUVSu8deyeGFhaWRXziXJrfUwPTgWNRihjFw4u7Qd6j4YZpzGA/pOJlZOFnw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(31686004)(36756003)(54906003)(8936002)(6666004)(6916009)(66574015)(8676002)(31696002)(66476007)(2906002)(66946007)(86362001)(83380400001)(186003)(66556008)(45080400002)(5660300002)(16526019)(966005)(478600001)(2616005)(4326008)(316002)(6486002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: FU23IPp93zKpLWmX1+oU/cpWzZ3Nsk9VeCaA7m2ysMaZnk8Rk8g2omhCUZc2D+HLTxCN+ICPssexalG6YE3DcZyjJwLn/BADYEPv5HGiPkyz8lz1O80MlN1wy/E8ZqNLoJt51u9TmPoEFSgKzC0/PDkkn+p0EZK6oyEaLlOBbTaRxdvX2enh+scMJ5cM+n+/tQ2PfMkr++2OtJVAPn7XWHFXI2w4806XHUyManTrs0N/kdoUcpaxO7kvIaEHpbMMWtzMioCjA7maAZQ/G9tvJptv+oICirAoMCMxlBe4vYBkOj3OqKX/bWK+0pXixu4Jcozgh7FRIwc0p/0WfmjCsBTrhgGDkCStHOikBdLBfWJSEYJ8TvVZROAqo7kSTSv+kPz3gSelpqlZob/OIPILtpWQMiw8ZGmS+dbmux1d5ZBmmQxH3jOEdW3Xok2P3EUKIhxi7cIiu1IQuoFiojVC+X0Gmz/OdRULvj7a1beEzb/tiiA0nzMVuj7CylI3kCqoDMUXgTI18EGtEzdB7q+KFAI8ZlxlwVQ5m2kQpOuz5T/+S0iE/UBQBrwulldw7umUWfqjlckeH7ygbmQdyW4s9YsX5pogx+Jdvr6WuIrTsZ4NNJR9tAobUlcJjlgWdZmIgC0yzLNXr23Qub/Z6ZAuNKbPV+cx57LdvOGk/kpOoE4oFYmnyTue/xMDJ4s8Y1rlxQnSFetZ9LIvuguQY2wXYg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132e2e88-7939-4b57-cb5f-08d865ee3ac7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2020 09:41:53.8897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/JZNwufq8dk8DXi5eHcTMPMAa0/ATVB0P32MPgtbyqxtwi74OBNlq7LVVuLRSBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Cc: Dave Airlie <airlied@redhat.com>, Huang Rui <ray.huang@amd.com>,
 Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBkb24ndCBzZWUgdGhlIHBhdGNoLCBjYW4geW91IHBvaW50IG1lIHRvIGl0PwoKVGhhbmtzLApD
aHJpc3RpYW4uCgpBbSAwMS4xMC4yMCB1bSAwNzoyNSBzY2hyaWViIERhdmUgQWlybGllOgo+IFRy
YWNrZWQgaXQgZG93biB0byBteSBpbml0IG1lbSB0eXBlIGNoYW5nZXMsIHBhdGNoIGlzIG9uIHRo
ZSBsaXN0Lgo+Cj4gRGF2ZS4KPgo+IE9uIFdlZCwgMzAgU2VwIDIwMjAgYXQgMTg6MjgsIENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4+IFRoYXQgc291
bmRzIGxpa2UgdGhlIHNhbWUgcHJvYmxlbSBJJ3ZlIGdvdCB3aGVuIGRybS1uZXh0IHdhcyBtZXJn
ZWQgaW50bwo+PiBkcm0tbWlzYy1uZXh0Lgo+Pgo+PiBJJ3ZlIGZpeGVkIGl0IGluIHRoaXMgY29t
bWl0Ogo+Pgo+PiBjb21taXQgMGIwNjI4NjU3OWI4MTQ0OWIxZThmMTRmODhkM2E4ZGIwOTFmZDQ0
Mwo+PiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Pj4gRGF0ZTogICBXZWQgQXVnIDE5IDE1OjI3OjQ4IDIwMjAgKzAyMDAKPj4KPj4gICAgICAgZHJt
L3R0bTogZml4IGJyb2tlbiBtZXJnZSBiZXR3ZWVuIGRybS1uZXh0IGFuZCBkcm0tbWlzYy1uZXh0
Cj4+Cj4+ICAgICAgIGRybS1uZXh0IHJldmVydGVkIHRoZSBjaGFuZ2VzIHRvIHR0bV90dF9jcmVh
dGUoKSB0byBkbyB0aGUKPj4gICAgICAgTlVMTCBjaGVjayBpbnNpZGUgdGhlIGZ1bmN0aW9uLCBi
dXQgZHJtLW1pc2MtbmV4dCBhZGRzIG5ldwo+PiAgICAgICB1c2VycyBvZiB0aGlzIGFwcHJvYWNo
Lgo+Pgo+PiAgICAgICBSZS1hcHBseSB0aGUgTlVMTCBjaGVjayBjaGFuZ2UgaW5zaWRlIHRoZSBm
dW5jdGlvbiB0byBmaXggdGhpcy4KPj4KPj4gICAgICAgU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+PiAgICAgICBSZXZpZXdlZC1ieTog
RGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KPj4gICAgICAgTGluazogaHR0cHM6Ly9u
YW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZyUyRnBhdGNoJTJGMzg2NjI4JTJGJmFtcDtkYXRhPTAy
JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzlmM2FhMjM1M2YwNDQxY2NlZmE0
MDhkODY1Y2E2NmU2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3
QzYzNzM3MTI2NzI3Nzk5ODUzNCZhbXA7c2RhdGE9NDNaR053NUlyR21iTXNWem03NVdYayUyQnA1
NUNJSzBMaiUyQlZYRkNaUlNxeEUlM0QmYW1wO3Jlc2VydmVkPTAKPj4KPj4KPj4gTm90IHN1cmUg
d2h5IGl0IHNob3VsZCBjYXVzZSBwcm9ibGVtcyB3aXRoIGRybS1maXhlcyBhbmQgZHJtLW5leHQg
YXMgd2VsbC4KPj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+PiBBbSAzMC4wOS4yMCB1
bSAwOTowOSBzY2hyaWViIERhdmUgQWlybGllOgo+Pj4ganVzdCBGWUkgSSdtIHNlZWluZyBhIHJl
Z3Jlc3Npb24gb24gdm13Z2Z4IHdpdGggZHJtLWZpeGVzIGFuZCBkcm0tbmV4dAo+Pj4gbWVyZ2Vk
IGludG8gaXQuCj4+Pgo+Pj4gSSdtIGdvaW5nIHRha2Ugc29tZSB0aW1lIHRvIGRpZyB0aHJvdWdo
IGFuZCB3b3JrIG91dCB3aGVyZSwgdGhlCj4+PiByZWdyZXNzaW9uIGlzIGEgY29tbWFuZCBmYWls
dXJlIGFuZCBhIGlvcmVtYXAgZmFpbHVyZS4KPj4+Cj4+PiBEYXZlLgo+Pj4KPj4+IE9uIFdlZCwg
MzAgU2VwIDIwMjAgYXQgMTY6MjYsIERhdmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+Pj4gVWdnaCB0aGlzIGlzIHBhcnQgb2YgdGhlIG1lc3Mgd2l0aCB0aGUgcmV2ZXJ0LCBJ
J20gbm90IHN1cmUgaG93IGJlc3QKPj4+PiB0byBkaWcgb3V0IG9mIHRoaXMgb25lIHlldC4KPj4+
Pgo+Pj4+IERhdmUuCj4+Pj4KPj4+PiBPbiBXZWQsIDMwIFNlcCAyMDIwIGF0IDE1OjU1LCBEYXZl
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+PiBGcm9tOiBEYXZlIEFpcmxp
ZSA8YWlybGllZEByZWRoYXQuY29tPgo+Pj4+Pgo+Pj4+PiBUaGlzIGZpeGVzIGEgYnVnIGludHJv
ZHVjZWQgaW4gYmUxMjEzYTM0MWEyODlhZmM1MWY4OTE4MWMzMTBlMzY4ZmJhMGI2Ngo+Pj4+PiBk
cm0vdHRtOiByZW1vdmUgVFRNX01FTVRZUEVfRkxBR19GSVhFRCB2Mgo+Pj4+Pgo+Pj4+PiBPbiB2
bXdnZnggdGhpcyBjYXVzZXMgYSBDb21tYW5kIGJ1ZmZlciBlcnJvciBXQVJOIHRvIHRyaWdnZXIu
Cj4+Pj4+Cj4+Pj4+IFRoaXMgaXMgYmVjYXVzZSB0aGUgb2xkIGNvZGUgdXNlZCB0byBjaGVjayBp
ZiBiby0+dHRtIHdhcyB0cnVlLAo+Pj4+PiBhbmQgdGhlIG5ldyBjb2RlIGRvZXNuJ3QsIGZpeCBp
dCBjb2RlIHRvIGFkZCBiYWNrIHRoZSBjaGVjayByZXNvbHZlcwo+Pj4+PiB0aGUgaXNzdWUuCj4+
Pj4+Cj4+Pj4+IEZpeGVzOiBiZTEyMTNhMzQxYTIgKCJkcm0vdHRtOiByZW1vdmUgVFRNX01FTVRZ
UEVfRkxBR19GSVhFRCB2MiIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJs
aWVkQHJlZGhhdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgOCArKysrKy0tLQo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gaW5k
ZXggNzBiM2JlZTI3ODUwLi5lOGFhMmZlOGU5ZDEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwo+Pj4+PiBAQCAtMjUxLDkgKzI1MSwxMSBAQCBzdGF0aWMgaW50IHR0bV9ib19oYW5kbGVf
bW92ZV9tZW0oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4+Pj4gICAgICAgICAgICAg
ICAgICAgLyogWmVybyBpbml0IHRoZSBuZXcgVFRNIHN0cnVjdHVyZSBpZiB0aGUgb2xkIGxvY2F0
aW9uIHNob3VsZAo+Pj4+PiAgICAgICAgICAgICAgICAgICAgKiBoYXZlIHVzZWQgb25lIGFzIHdl
bGwuCj4+Pj4+ICAgICAgICAgICAgICAgICAgICAqLwo+Pj4+PiAtICAgICAgICAgICAgICAgcmV0
ID0gdHRtX3R0X2NyZWF0ZShibywgb2xkX21hbi0+dXNlX3R0KTsKPj4+Pj4gLSAgICAgICAgICAg
ICAgIGlmIChyZXQpCj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsK
Pj4+Pj4gKyAgICAgICAgICAgICAgIGlmICghYm8tPnR0bSkgewo+Pj4+PiArICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSB0dG1fdHRfY3JlYXRlKGJvLCBvbGRfbWFuLT51c2VfdHQpOwo+Pj4+
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+Pj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8gb3V0X2VycjsKPj4+Pj4gKyAgICAgICAgICAgICAgIH0KPj4+
Pj4KPj4+Pj4gICAgICAgICAgICAgICAgICAgcmV0ID0gdHRtX3R0X3NldF9wbGFjZW1lbnRfY2Fj
aGluZyhiby0+dHRtLCBtZW0tPnBsYWNlbWVudCk7Cj4+Pj4+ICAgICAgICAgICAgICAgICAgIGlm
IChyZXQpCj4+Pj4+IC0tCj4+Pj4+IDIuMjAuMQo+Pj4+Pgo+Pj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4gaHR0cHM6Ly9u
YW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJG
bGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJpLWRldmVsJmFt
cDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzlmM2FhMjM1M2Yw
NDQxY2NlZmE0MDhkODY1Y2E2NmU2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2Ql
N0MwJTdDMCU3QzYzNzM3MTI2NzI3Nzk5ODUzNCZhbXA7c2RhdGE9RXBxenc3TzBiWjZHM0pqWFJk
YzJLdFN1ZzNKVnVjVWJ2bGhKTHRETWt6QSUzRCZhbXA7cmVzZXJ2ZWQ9MAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
