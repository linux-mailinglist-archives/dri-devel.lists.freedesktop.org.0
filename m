Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD42B95A6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 16:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964216E52E;
	Thu, 19 Nov 2020 15:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2049.outbound.protection.outlook.com [40.107.220.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B296E52D;
 Thu, 19 Nov 2020 15:02:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWbQcmLNf9bMXlvaQjAz1KvSiJ4H4tnGYk59sBbY56gbvc2Hnp7Qx901fJTJtI8BidJdSGrXGI9HdA05cPhlEk/6BroFHOCczY2NCjQICnZhm5CPZsyJuoDqLS+/i8he01hplLMdVplNMnQxwCiJXcnFfRcuvtdI2+/vZNG5fGS1z/wuL7KNzlx8DIkF2cUOdxqwKApPW7jKsDg7CluLBegS3JcmGiB/v7C4N7JjjoiuyhI8xxDZn46yPMijBjRrG3OKKID6mEPx9jRL/f7sKZ7GdkLbCTkuEXo20yjZKB2CiKwB6kB2vDw3TNRNks1S3vgviP7/laGV1xlyVOzPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ernkG8hPZnkHqR7SVpkY9DNL9IfsoO3XCKVVS/fRr8=;
 b=HXVlFX6cHfy7esgBZ2F0SivIDUeBu8OKsSqMjq3GL29AmmUC5JjCTDzdeUvvr31AG8iRx7HfUDhxMzXByD/+NKlsD+rcYoRw9wU3LgLfLCwT+FDE0f+inu764ug1IVSUa3JAKZ3dLCgVcgh2xsfJX8ZoAY2Ldg/0bx0cNd9Kod7ZShKY3L2WjUvB7gG40OI/cUs8P2x6KjT0/obGfye9sOWX3SaL6eXwxVA/ty9scMhgx+AmCLxBkoSVaApcoa1byREPnP5vIvIWCGh7c6dUVRWBTEPcJf4SBQJg0BiTcaMVUnCsEkgWexiThudt7r4IJav5KcIfPi0i3htxCF3Eog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ernkG8hPZnkHqR7SVpkY9DNL9IfsoO3XCKVVS/fRr8=;
 b=Ae1u/maJDjG8HC256swuxGOCr2AhG4hi4pAFZjKRSrSDGjS+hgXOAOHEqf1qSEdYHrMiouEu3sxNuFndU6psJ9sWjpxyZ/875KyxcbjCYqKgZoPpQ5WuHp05/K5HoTqbgwaDhX+LWPG2Y494PbfIgp7jjWVrRkqk8dFopHQ2QXY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1881.namprd12.prod.outlook.com (2603:10b6:3:10f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.28; Thu, 19 Nov 2020 15:02:30 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 15:02:30 +0000
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Prevent any job recoveries after
 device is unplugged.
To: christian.koenig@amd.com, Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-9-git-send-email-andrey.grodzovsky@amd.com>
 <20200622095345.GF20149@phenom.ffwll.local>
 <24dd3691-5599-459c-2e5d-a8f2e504ec66@amd.com>
 <20201117185255.GP401619@phenom.ffwll.local>
 <b827fa7a-d89e-d138-d275-60a9f15c128a@amd.com>
 <20201117194922.GW401619@phenom.ffwll.local>
 <064ef461-8f59-2eb8-7777-6ff5b8d28cdd@amd.com>
 <CAKMK7uF9uvT09zDb6fS0j68fWrq2qV7h_JQAt8vpaGPJ1d64cQ@mail.gmail.com>
 <d0a3ee49-64f3-a223-7e84-0c8eb3481f61@gmail.com>
 <e462f296-75d0-316a-e30f-c985e7aac88d@amd.com>
 <f65c5d45-8cb2-fde1-1785-756088aa95d5@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <d67bcb18-c26c-542c-3fbb-67c69c0980b5@amd.com>
Date: Thu, 19 Nov 2020 10:02:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <f65c5d45-8cb2-fde1-1785-756088aa95d5@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c99d:8669:45d1:4d60]
X-ClientProxiedBy: YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::29) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c99d:8669:45d1:4d60]
 (2607:fea8:3edf:49b0:c99d:8669:45d1:4d60) by
 YTOPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 15:02:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b19cede-9cb6-4de3-f77b-08d88c9c22ad
X-MS-TrafficTypeDiagnostic: DM5PR12MB1881:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18815AEBF229295792DC4CD8EAE00@DM5PR12MB1881.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Hba4EzERcM+95TEoyfbj0XgX7sdWyWcb+BXujygCBFRQV42VM7rGl79M2E919diPNSzQXziGg8QtaE84E7hRyWnKCgktFHBeDjCRZzZT4ksyJ6Z9ReTYvqx9wvWIL8bbfUIjxQUAPRDeyHP/RFxT3EqsRFbSpdSYM6K+8v+uyvaYDAp4NSapqjK1ugVeSsE1HeYZQqUSUMOrILdmRXYxskocm2jEC8Q0zXPZsSBQ3QjE8+GA+H1gQFdxWcZFyzg734oFxAdBOyllkGN/bh8Y8YpuB3thQQdGAEoWuuuGy0f5umxby+TEpYYgQi6Fjg2hjOWWq95i5wNrakRzbUzcvV8Jhi8GbVBZk1Nr/FKth/HN+pTlPE9qrYhDiU9zzIA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(2906002)(66556008)(6916009)(86362001)(83380400001)(8676002)(66476007)(4326008)(53546011)(6486002)(31686004)(186003)(16526019)(52116002)(8936002)(36756003)(66946007)(66574015)(478600001)(5660300002)(2616005)(31696002)(316002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cEd3STFrOGladnlRMU1vMjdVWXhBMEg2ZDVXazltWHhUeWtVUHI2ZTVGamZp?=
 =?utf-8?B?MWVydGN1eUhjdE9WRGRqMEZKYTRINWVrVVJMM1FQMlFoN3FmY09ManBBSkcv?=
 =?utf-8?B?clA5OHh6d25ZNEJ0cFlhVkNZc3BYMnErTzR3MTZLTml6bFkrblUySDhldGNM?=
 =?utf-8?B?NjkxRzJTSEltWjFWV2ZEdGw3amxPYnlBR0ZOWTFJMjJodElNLzlyWnR5Vlp4?=
 =?utf-8?B?YkVhajErU2tnQnJUVTh3UW5iTmE2RHJmTWtqYTV5Z3R1YWI5aDBYb3FsRzlE?=
 =?utf-8?B?N25RbGNvbzFwMlVMSkt2N3kzUmhkMUJ2S2ZxQVI2UFRtRm5OVEdmVldxQ1dG?=
 =?utf-8?B?ZkdEdTR6bktaUnEzUVEvaUhLVFg2MXZEQ3Rqbkt2RjB4Vm5UTUU2L2tQQ1VG?=
 =?utf-8?B?MVc1N01Yc2NMeU10ZXdhZXZzaFc5Qys3bnhxelhBT0t6RG5JdXFkemNKVEpF?=
 =?utf-8?B?VWp0L1VMRE1iQVlhUUdQNUZ1cEZmbm1UL1c1ZTdCSWFFSUo3L29wWmRvRits?=
 =?utf-8?B?clBTcWhlZVo4VHppNnh6d29DNkJkNkZWQlk4eG43S0IvVGo5N2dudm50YkF2?=
 =?utf-8?B?VnFJY0tBZGdVek5NcnVjTldvVE5rS3U0elNmRTZ4WERMb3lCSDhPUWxzVytT?=
 =?utf-8?B?WVIyR2xTdWV4R3JOam1XMWxOcW00dXRldk44dHN6Wmo0OW1IWDRWQzYwWUpq?=
 =?utf-8?B?b0FhWFBxREtnU2hIYkxHaWxQL0lYRHA1ZmdwdVhKc3FWcWFaOC93WEdLNEd0?=
 =?utf-8?B?dUZKcmhlQjczc0RuVVZ4d1AreVg4YWNTcUZ2NFJ4RFRFZXdheTNlTW85MjNZ?=
 =?utf-8?B?SDl2cVJLY2JMbjBJMmhsNFB3V2dvNk1mNWwzdjJPRGpiSm9uZXVuVnVZazFP?=
 =?utf-8?B?dC9NZ1FLdEFiRUtjYkhSR2FkTmpjdzhwRWtOUWJhSVVBbm5wOUh6T2ZCUS81?=
 =?utf-8?B?Z2orck5lTzBXRlNjMUcyUlJnU25nL3VVdEtobUg2TlFtbEV3M0hRT3RkN3BX?=
 =?utf-8?B?UnUrakduckpRbjhrVkxScFcvblNuNjIrOEg0OWJqMjIzQjJCb0E5Q2RNVXBv?=
 =?utf-8?B?WHRoQmg4ZUt3cXhpWFlOQU9PaE84YjhNc2tTQW5WMjNDT0hDU2lHbjlHZXJi?=
 =?utf-8?B?eCt4UGZObUFUT1hyclE2MXpiZGRER3ZHQ3JXZlJsL3VKUk1PWXhSUW5va3lw?=
 =?utf-8?B?WHhIc1l4d2Z6elNWbUJFNHpYVzdUUStSVG1KMTBYbVdyZ3pvWWk3bFg0WWxa?=
 =?utf-8?B?SXVteDZneHc4TVFULzBZUS9WR2d4RmR6UmZVTDh1b1VUdW9aUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b19cede-9cb6-4de3-f77b-08d88c9c22ad
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 15:02:29.9041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U43MOOJlt34gUwuv/okLamYhJ4j48vP86KBc+hMmUzs0qmAT86E++2PVePcHMVVusfdIVywsy/Jb8/gUbdyjrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1881
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
Cc: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzE5LzIwIDI6NTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMTguMTEu
MjAgdW0gMTc6MjAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMTEvMTgvMjAg
NzowMSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDE4LjExLjIwIHVtIDA4OjM5
IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+PiBPbiBUdWUsIE5vdiAxNywgMjAyMCBhdCA5OjA3
IFBNIEFuZHJleSBHcm9kem92c2t5Cj4+Pj4gPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+IHdy
b3RlOgo+Pj4+Pgo+Pj4+PiBPbiAxMS8xNy8yMCAyOjQ5IFBNLCBEYW5pZWwgVmV0dGVyIHdyb3Rl
Ogo+Pj4+Pj4gT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDI6MTg6NDlQTSAtMDUwMCwgQW5kcmV5
IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4gT24gMTEvMTcvMjAgMTo1MiBQTSwgRGFuaWVsIFZl
dHRlciB3cm90ZToKPj4+Pj4+Pj4gT24gVHVlLCBOb3YgMTcsIDIwMjAgYXQgMDE6Mzg6MTRQTSAt
MDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+PiBPbiA2LzIyLzIwIDU6NTMg
QU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+Pj4gT24gU3VuLCBKdW4gMjEsIDIwMjAg
YXQgMDI6MDM6MDhBTSAtMDQwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+Pj4+
IE5vIHBvaW50IHRvIHRyeSByZWNvdmVyeSBpZiBkZXZpY2UgaXMgZ29uZSwganVzdCBtZXNzZXMg
dXAgdGhpbmdzLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkg
R3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+Pj4+Pj4gLS0tCj4+
Pj4+Pj4+Pj4+IMKgwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyB8IDE2ICsrKysrKysrKysrKysrKysKPj4+Pj4+Pj4+Pj4gwqDCoMKgwqAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIHwgOCArKysrKysrKwo+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoCAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYu
YyAKPj4+Pj4+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMK
Pj4+Pj4+Pj4+Pj4gaW5kZXggNjkzMmQ3NS4uNWQ2ZDNkOSAxMDA2NDQKPj4+Pj4+Pj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4+Pj4+Pj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+Pj4+Pj4+Pj4+PiBA
QCAtMTEyOSwxMiArMTEyOSwyOCBAQCBzdGF0aWMgaW50IGFtZGdwdV9wY2lfcHJvYmUoc3RydWN0
IHBjaV9kZXYgCj4+Pj4+Pj4+Pj4+ICpwZGV2LAo+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIHJldDsKPj4+Pj4+Pj4+Pj4gwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4+PiArc3RhdGlj
IHZvaWQgYW1kZ3B1X2NhbmNlbF9hbGxfdGRyKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+
Pj4+Pj4+Pj4+PiArewo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaW50IGk7Cj4+Pj4+Pj4+
Pj4+ICsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBBTURHUFVf
TUFYX1JJTkdTOyArK2kpIHsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcgPSBhZGV2LT5yaW5nc1tpXTsKPj4+Pj4+Pj4+
Pj4gKwo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcmlu
ZyB8fCAhcmluZy0+c2NoZWQudGhyZWFkKQo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4+Pj4+Pj4gKwo+Pj4+
Pj4+Pj4+PiArIGNhbmNlbF9kZWxheWVkX3dvcmtfc3luYygmcmluZy0+c2NoZWQud29ya190ZHIp
Owo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgfQo+Pj4+Pj4+Pj4+PiArfQo+Pj4+Pj4+Pj4+
IEkgdGhpbmsgdGhpcyBpcyBhIGZ1bmN0aW9uIHRoYXQncyBzdXBwb3NlZCB0byBiZSBpbiBkcm0v
c2NoZWR1bGVyLCBub3QKPj4+Pj4+Pj4+PiBoZXJlLiBNaWdodCBhbHNvIGp1c3QgYmUgeW91ciBj
bGVhbnVwIGNvZGUgYmVpbmcgb3JkZXJlZCB3cm9uZ2x5LCBvciAKPj4+Pj4+Pj4+PiB5b3VyCj4+
Pj4+Pj4+Pj4gc3BsaXQgaW4gb25lIG9mIHRoZSBlYXJsaWVyIHBhdGNoZXMgbm90IGRvbmUgcXVp
dGUgcmlnaHQuCj4+Pj4+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4+Pj4gVGhpcyBmdW5jdGlvbiBpdGVy
YXRlcyBhY3Jvc3MgYWxsIHRoZSBzY2hlZHVsZXJzIHBlciBhbWRncHUgZGV2aWNlIGFuZCAKPj4+
Pj4+Pj4+IGFjY2Vzc2VzCj4+Pj4+Pj4+PiBhbWRncHUgc3BlY2lmaWMgc3RydWN0dXJlcyAsIGRy
bS9zY2hlZHVsZXIgZGVhbHMgd2l0aCBzaW5nbGUgc2NoZWR1bGVyIAo+Pj4+Pj4+Pj4gYXQgbW9z
dAo+Pj4+Pj4+Pj4gc28gbG9va3MgdG8gbWUgbGlrZSB0aGlzIGlzIHRoZSByaWdodCBwbGFjZSBm
b3IgdGhpcyBmdW5jdGlvbgo+Pj4+Pj4+PiBJIGd1ZXNzIHdlIGNvdWxkIGtlZXAgdHJhY2sgb2Yg
YWxsIHNjaGVkdWxlcnMgc29tZXdoZXJlIGluIGEgbGlzdCBpbgo+Pj4+Pj4+PiBzdHJ1Y3QgZHJt
X2RldmljZSBhbmQgd3JhcCB0aGlzIHVwLiBUaGF0IHdhcyBraW5kYSB0aGUgaWRlYS4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gTWluaW1hbGx5IEkgdGhpbmsgYSB0aW55IHdyYXBwZXIgd2l0aCBkb2NzIGZv
ciB0aGUKPj4+Pj4+Pj4gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZzY2hlZC0+d29ya190ZHIp
OyB3aGljaCBleHBsYWlucyB3aGF0IHlvdSBtdXN0Cj4+Pj4+Pj4+IG9ic2VydmUgdG8gbWFrZSBz
dXJlIHRoZXJlJ3Mgbm8gcmFjZS4KPj4+Pj4+PiBXaWxsIGRvCj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+
Pj4+PiBJJ20gbm90IGV4YWN0bHkgc3VyZSB0aGVyZSdzIG5vCj4+Pj4+Pj4+IGd1YXJhbnRlZSBo
ZXJlIHdlIHdvbid0IGdldCBhIG5ldyB0ZHIgd29yayBsYXVuY2hlZCByaWdodCBhZnRlcndhcmRz
IGF0Cj4+Pj4+Pj4+IGxlYXN0LCBzbyB0aGlzIGxvb2tzIGEgYml0IGxpa2UgYSBoYWNrLgo+Pj4+
Pj4+IE5vdGUgdGhhdCBmb3IgYW55IFREUiB3b3JrIGhhcHBlbmluZyBwb3N0IGFtZGdwdV9jYW5j
ZWxfYWxsX3Rkcgo+Pj4+Pj4+IGFtZGdwdV9qb2JfdGltZWRvdXQtPmRybV9kZXZfaXNfdW5wbHVn
Z2VkCj4+Pj4+Pj4gd2lsbCByZXR1cm4gdHJ1ZSBhbmQgc28gaXQgd2lsbCByZXR1cm4gZWFybHku
IFRvIG1ha2UgaXQgd2F0ZXIgcHJvb2YgdGlnaHQKPj4+Pj4+PiBhZ2FpbnN0IHJhY2UKPj4+Pj4+
PiBpIGNhbiBzd2l0Y2ggZnJvbSBkcm1fZGV2X2lzX3VucGx1Z2dlZCB0byBkcm1fZGV2X2VudGVy
L2V4aXQKPj4+Pj4+IEhtIHRoYXQncyBjb25mdXNpbmcuIFlvdSBkbyBhIHdvcmtfY2FuY2VsX3N5
bmMsIHNvIHRoYXQgYXQgbGVhc3QgbG9va3MKPj4+Pj4+IGxpa2UgInRkciB3b3JrIG11c3Qgbm90
IHJ1biBhZnRlciB0aGlzIHBvaW50Igo+Pj4+Pj4KPj4+Pj4+IElmIHlvdSBvbmx5IHJlbHkgb24g
ZHJtX2Rldl9lbnRlci9leGl0IGNoZWNrIHdpdGggdGhlIHRkciB3b3JrLCB0aGVuCj4+Pj4+PiB0
aGVyZSdzIG5vIG5lZWQgdG8gY2FuY2VsIGFueXRoaW5nLgo+Pj4+Pgo+Pj4+PiBBZ3JlZSwgc3lu
Y2hyb25pemVfc3JjdSBmcm9tIGRybV9kZXZfdW5wbHVnIHNob3VsZCBwbGF5IHRoZSByb2xlCj4+
Pj4+IG9mICdmbHVzaGluZycgYW55IGVhcmxpZXIgKGluIHByb2dyZXNzKSB0ZHIgd29yayB3aGlj
aCBpcwo+Pj4+PiB1c2luZyBkcm1fZGV2X2VudGVyL2V4aXQgcGFpci4gQW55IGxhdGVyIGFyaXNp
bmcgdGRyIHdpbGwgdGVybWluYXRlIGVhcmx5IAo+Pj4+PiB3aGVuCj4+Pj4+IGRybV9kZXZfZW50
ZXIKPj4+Pj4gcmV0dXJucyBmYWxzZS4KPj4+PiBOb3BlLCBhbnl0aGluZyB5b3UgcHV0IGludG8g
dGhlIHdvcmsgaXRzZWxmIGNhbm5vdCBjbG9zZSB0aGlzIHJhY2UuCj4+Pj4gSXQncyB0aGUgc2No
ZWR1bGVfd29yayB0aGF0IG1hdHRlcnMgaGVyZS4gT3IgSSdtIG1pc3Npbmcgc29tZXRoaW5nIC4u
Lgo+Pj4+IEkgdGhvdWdodCB0aGF0IHRoZSB0ZHIgd29yayB5b3UncmUgY2FuY2VsbGluZyBoZXJl
IGlzIGxhdW5jaGVkIGJ5Cj4+Pj4gZHJtL3NjaGVkdWxlciBjb2RlLCBub3QgYnkgdGhlIGFtZCBj
YWxsYmFjaz8KPj4KPj4KPj4gTXkgYmFkLCB5b3UgYXJlIHJpZ2h0LCBJIGFtIHN1cHBvc2VkIHRv
IHB1dCBkcm1fZGV2X2VudGVyLmV4aXQgcGFpciBpbnRvIAo+PiBkcm1fc2NoZWRfam9iX3RpbWVk
b3V0Cj4+Cj4+Cj4+Pgo+Pj4gWWVzIHRoYXQgaXMgY29ycmVjdC4gQ2FuY2VsaW5nIHRoZSB3b3Jr
IGl0ZW0gaXMgbm90IHRoZSByaWdodCBhcHByb2FjaCBhdCAKPj4+IGFsbCwgbm9yIGlzIGFkZGlu
ZyBkZXZfZW50ZXIvZXhpdCBwYWlyIGluIHRoZSByZWNvdmVyeSBoYW5kbGVyLgo+Pgo+Pgo+PiBX
aXRob3V0IGFkZGluZyB0aGUgZGV2X2VudGVyL2V4aXQgZ3VhcmRpbmcgcGFpciBpbiB0aGUgcmVj
b3ZlcnkgaGFuZGxlciB5b3UgCj4+IGFyZSBlbmRpbmcgdXAgd2l0aCBHUFUgcmVzZXQgc3RhcnRp
bmcgd2hpbGUKPj4gdGhlIGRldmljZSBpcyBhbHJlYWR5IHVucGx1Z2dlZCwgdGhpcyBsZWFkcyB0
byBtdWx0aXBsZSBlcnJvcnMgYW5kIGdlbmVyYWwgbWVzcy4KPj4KPj4KPj4+Cj4+PiBXaGF0IHdl
IG5lZWQgdG8gZG8gaGVyZSBpcyB0byBzdG9wIHRoZSBzY2hlZHVsZXIgdGhyZWFkIGFuZCB0aGVu
IHdhaXQgZm9yIAo+Pj4gYW55IHRpbWVvdXQgaGFuZGxpbmcgdG8gaGF2ZSBmaW5pc2hlZC4KPj4+
Cj4+PiBPdGhlcndpc2UgaXQgY2FuIHNjaGVkdWxlciBhIG5ldyB0aW1lb3V0IGp1c3QgYWZ0ZXIg
d2UgaGF2ZSBjYW5jZWxlZCB0aGlzIG9uZS4KPj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hyaXN0aWFu
Lgo+Pgo+Pgo+PiBTY2hlZHVsZXJzIGFyZSBzdG9wcGVkIGZyb20gYW1kZ3B1X2RyaXZlcl91bmxv
YWRfa21zIHdoaWNoIGluZGVlZCBoYXBwZW5zIAo+PiBhZnRlciBkcm1fZGV2X3VucGx1Zwo+PiBz
byB5ZXMsIHRoZXJlIGlzIHN0aWxsIGEgY2hhbmNlIGZvciBuZXcgd29yayBiZWluZyBzY2hlZHVs
ZXIgYW5kIHRpbWVvdXQgCj4+IGFybWVkIGFmdGVyIGJ1dCwgb25jZSBpIGZpeCB0aGUgY29kZQo+
PiB0byBwbGFjZSBkcm1fZGV2X2VudGVyL2V4aXQgcGFpciBpbnRvIGRybV9zY2hlZF9qb2JfdGlt
ZW91dCBJIGRvbid0IHNlZSB3aHkgCj4+IHRoYXQgbm90IGEgZ29vZCBzb2x1dGlvbiA/Cj4KPiBZ
ZWFoIHRoYXQgc2hvdWxkIHdvcmsgYXMgd2VsbCwgYnV0IHRoZW4geW91IGFsc28gZG9uJ3QgbmVl
ZCB0byBjYW5jZWwgdGhlIHdvcmsgCj4gaXRlbSBmcm9tIHRoZSBkcml2ZXIuCgoKSW5kZWVkLCBh
cyBEYW5pZWwgcG9pbnRlZCBvdXQgbm8gbmVlZCBhbmQgSSBkcm9wcGVkIGl0LiBPbmUgY29ycmVj
dGlvbiAtIEkgCnByZXZpb3VzbHkgc2FpZCB0aGF0IHcvbwpkZXZfZW50ZXIvZXhpdCBndWFyZGlu
ZyBwYWlyIGluIHNjaGVkdWxlcidzIFRPIGhhbmRsZXIgeW91IHdpbGwgZ2V0IEdQVSByZXNldCAK
c3RhcnRpbmcgd2hpbGUgZGV2aWNlIGFscmVhZHkgZ29uZSAtCm9mIGNvdXJzZSB0aGlzIGlzIG5v
dCBmdWxseSBwcmV2ZW50aW5nIHRoaXMgYXMgdGhlIGRldmljZSBjYW4gYmUgZXh0cmFjdGVkIGF0
IAphbnkgbW9tZW50IGp1c3QgYWZ0ZXIgd2UKYWxyZWFkeSBlbnRlcmVkIEdQVSByZWNvdmVyeS4g
QnV0IGl0IGRvZXMgc2F2ZXMgdXMgcHJvY2Vzc2luZyBhIGZ1dGlsZcKgIEdQVSAKcmVjb3Zlcnkg
d2hpY2ggYWx3YXlzCnN0YXJ0cyBvbmNlIHlvdSB1bnBsdWcgdGhlIGRldmljZSBpZiB0aGVyZSBh
cmUgYWN0aXZlIGdvYnMgaW4gcHJvZ3Jlc3MgYXQgdGhlIAptb21lbnQgYW5kIHNvIEkgdGhpbmsg
aXQncwpzdGlsbCBqdXN0aWZpYWJsZSB0byBrZWVwIHRoZSBkZXZfZW50ZXIvZXhpdCBndWFyZGlu
ZyBwYWlyIHRoZXJlLgoKQW5kcmV5CgoKPgo+Cj4+IEFueSB0ZHIgd29yayBzdGFydGVkIGFmdGVy
IGRybV9kZXZfdW5wbHVnIGZpbmlzaGVkIHdpbGwgc2ltcGx5IGFib3J0IG9uIGVudHJ5IAo+PiB0
byBkcm1fc2NoZWRfam9iX3RpbWVkb3V0Cj4+IGJlY2F1c2UgZHJtX2Rldl9lbnRlciB3aWxsIGJl
IGZhbHNlIGFuZCB0aGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gd2l0aG91dCAKPj4gcmVhcm1pbmcg
dGhlIHRpbWVvdXQgdGltZXIgYW5kCj4+IHNvIHdpbGwgaGF2ZSBubyBpbXBhY3QuCj4+Cj4+IFRo
ZSBvbmx5IGlzc3VlIGkgc2VlIGhlcmUgbm93IGlzIG9mIHBvc3NpYmxlIHVzZSBhZnRlciBmcmVl
IGlmIHNvbWUgbGF0ZSB0ZHIgCj4+IHdvcmsgd2lsbCB0cnkgdG8gZXhlY3V0ZSBhZnRlcgo+PiBk
cm0gZGV2aWNlIGFscmVhZHkgZ29uZSwgZm9yIHRoaXMgd2UgcHJvYmFibHkgc2hvdWxkIGFkZCAK
Pj4gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKHNjaGVkLndvcmtfdGRyKQo+PiB0byBkcm1fc2No
ZWRfZmluaSBhZnRlciBzY2hlZC0+dGhyZWFkIGlzIHN0b3BwZWQgdGhlcmUuCj4KPiBHb29kIHBv
aW50LCB0aGF0IGlzIGluZGVlZCBtaXNzaW5nIGFzIGZhciBhcyBJIGNhbiBzZWUuCj4KPiBDaHJp
c3RpYW4uCj4KPj4KPj4gQW5kcmV5Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
