Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2E020B20F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jun 2020 15:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3144E6EC8A;
	Fri, 26 Jun 2020 13:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBB46EC8A
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jun 2020 13:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmt8jvggeQXnd1ErpV/SeAWkE0EAeRJTXKlYQPNwOHCcw5LDn4t/MDUfY2Ug5WjgvTB6UVM7aqOHCteCXRI7ohsvMoUYFXLS0wd+HTpgAVyF1ZyB5tdjwB2NBbJbFhnkosDc2r9Li2R1xk8W7BxeexPJL1t6RxQdAV3/0yLGFqi5w/oGyvumlKei7t32bpn+rh6QEQY18lCb2+8xo9TO08cpbSYjWuRX4P8+5gXfoOsXkmQ3PA5ZvfYLhAfsib2JvrM6jwc4l2tDwVk0PcOYN43vDQFbJLGeCFlYZ5psd7N53WRF2GMm8uO4XcM1kvDs9TLvtzFtaOCI9DJJii3vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhHsgaprDYflDpjhv4upyqSs2tyIzHd2+3INLHnqgFI=;
 b=jgkwYJgeNugicpVzTdq09htryWX0atVcQYGQjnsN7GgIjF8oRpkrrHTq7qs3BzyoNzcl6jMEeoDpqUKlCZlnPuSx3Hi8JurH/7Eu4YsSpxj7dftWoXUYHbHp8Tx4JhN55j/VieYy1rTKIkusPqLbmlnqAKOUvpDVsTNMRUflFzJ8fSIV5vz+5coeuOZKAeAXRvbbA6TmN7Gns3tqUsYZdDcC+9MelYEj7LNHCvbskcWE0DZNM5lNafIUK28ENx6vAz7TgH5xy7cpDpTMTF8lqPqWumDTymbZy/GtbO/bt1fV7HMOrYpbewxqB8nlBjXT5H/gLXdIT9TWeKXmKDoIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhHsgaprDYflDpjhv4upyqSs2tyIzHd2+3INLHnqgFI=;
 b=a46dUg3iWP21LaHI3ldTAS+rAU8fFLRnHAvDHwws7KLia5RJzu9C8SB+XPdmj4OO+1cfumNi7gkdHGLmqOpE/zW8TQhiMImJ6HFDPWrm8gWPBFAKP4YUmKBLNpMWgm5XARxNgsjhSvNMzsf2CFIB0CWJcuT8pGqONF+3WJAUkEM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM5PR12MB1594.namprd12.prod.outlook.com (2603:10b6:4:e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.24; Fri, 26 Jun 2020 13:04:46 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::a045:f8c0:8edb:1ef1%9]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 13:04:46 +0000
Subject: Re: [RESEND] [PATCH v6 0/8] do not store GPU address in TTM
To: Daniel Vetter <daniel@ffwll.ch>,
 "Nikula, Jani" <jani.nikula@linux.intel.com>
References: <20200624182648.6976-1-nirmoy.das@amd.com>
 <b5629fcc-ba5e-4882-bafb-d88ef0ef144e@amd.com>
 <CAKMK7uGQCttt-X3eoftdO6aHRtS0RQE6P=yRQK97Hp9N2jLLYQ@mail.gmail.com>
 <803bcaee-3773-ed9d-2b55-74961d693c05@amd.com>
 <2d281cf1-07ac-45ec-c3c0-983db360888e@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <779a3a25-723b-6805-debd-a7a59e657536@amd.com>
Date: Fri, 26 Jun 2020 15:04:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <2d281cf1-07ac-45ec-c3c0-983db360888e@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0104.eurprd02.prod.outlook.com
 (2603:10a6:208:154::45) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0104.eurprd02.prod.outlook.com (2603:10a6:208:154::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.23 via Frontend
 Transport; Fri, 26 Jun 2020 13:04:43 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4d6bf886-5b7d-409a-48c3-08d819d18037
X-MS-TrafficTypeDiagnostic: DM5PR12MB1594:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1594F8EE74DB9E9D7AD33A1C83930@DM5PR12MB1594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: erFujO8xMv7k736t4Y9Cph9v1wZ0Ohb58pvft1iTi0sqCytdvUVIrsGOwEZYuwX9TR934EWKqfvWCZrE6Jjh3IaiZvWWRQeo13Fow1yoVCejb/h6JHyWhe3o9m7svcI4+mUTarcxrYZ+OFslFuZzi5sORnO4GEuH1Cvq+QcbHWLYCoHjT16cTwneOMY1o//9V7Q3/AL/oGmrS1tvdHRxZs3GSyvPPzN7YL0XHSAswbwhY9DhujnQ9K24IJIvK1+ZXX5rssmuv5ktGKwksC5pPyR5qBGRiSJgo/ntZPzGzhWfRuEbnt7IdkoVlQUku21ZWofO6PWvbR4yhxwoKyz93n7tpU24iW6LFtmUSvbiO/7g2vX2Doh33juBjg6200zohCpWCLt0zOirChDURAQPWveXb9yYn8g73LDB7rE9Bd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(66476007)(31686004)(66574015)(966005)(110136005)(54906003)(52116002)(8676002)(4326008)(83380400001)(6666004)(2616005)(316002)(7416002)(5660300002)(36756003)(186003)(6486002)(45080400002)(2906002)(53546011)(66946007)(8936002)(66556008)(31696002)(478600001)(16526019)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: La514adiypBEP9M4L1DPz+YO3q+8E0asUQDE3v3dxcGm+Xi9CNvFRQZMoXoFBQvRiYBYGrfZZXZ0kwhiGNDFLUwuXOYeMsBPnIoMTkkBKyTZiuEeJkgqOatMCJyEJiOkk5d51YCXH7Kf7hTtQQYl7ez+qauw667k38lC/kTIu/1qwgW2/CEBFBf7VeVHxiykquH3jlrjuXbL0RaRSWnQifpguiDLLewqJqSnhS61qBSixaM1gDUsorVKOL3gUNdXgYwM1FhZgcAyFazoMisw4Y8P6UOXN9Q/DRAH9Wh/keYuS+ElU+Fa0zj5c+f+DUPG2YBszTMjqRfuIRNOGctjFepZgqhDquv32U385o18DdgSLcJw4mbHaEM48x1HKf4EnwnHr0dujC7DXc7qOlZGBRwk9McgQKabu3LDAGxsis6Lfr+qLY3VVZcILufhPAfJiwgLHimTguqamGQXvkmF7FdQ45TqlgK9yFBVvVqVNu3HrN9pNP/kpdCz01oFKqB4pV2cIXg8RPL1LbhioiLXKY4Ea8H30LDzx4/1BnEiFPphDxx5P+M0JoQO1aLv4reE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6bf886-5b7d-409a-48c3-08d819d18037
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 13:04:46.5430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POz0uiQB4IBwPOZCK+i/wwIkyr7wejUKFJ95rlKjqw8K4SDvrjdMnApaJaYr62JK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
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
Cc: Sasha Levin <sashal@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Airlie <airlied@linux.ie>, "Ho, Kenny" <kenny.ho@amd.com>,
 Brian Welty <brian.welty@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Sean Paul <sean@poorly.run>, Nirmoy Das <nirmoy.aiemd@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMjAgdW0gMTg6MDIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDI1LjA2
LjIwIHVtIDE3OjUyIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4gQW0gMjUuMDYuMjAgdW0g
MTc6NDQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24gVGh1LCBKdW4gMjUsIDIwMjAgYXQg
MTE6NTAgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+Pj4gPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
d3JvdGU6Cj4+Pj4gSSd2ZSBwdXNoZWQgcGF0Y2hlcyAjMSwgIzIgYW5kICM1LSM4IG9mIHRoaXMg
c2VyaWVzIHRvIGRybS1taXNjLW5leHQuCj4+PiBJIHRoaW5rIHlvdSBsZWZ0IGFuIHVucmVzb2x2
ZWQgY29uZmxpY3QgYmVoaW5kIGluIGRybS10aXAsIHBsZWFzZSAKPj4+IHJlc29sdmUgcGVyCj4+
Pgo+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGZHJtLnBhZ2VzLmZyZWVkZXNrdG9wLm9yZyUyRm1haW50YWluZXItdG9v
bHMlMkZkcm0tdGlwLmh0bWwlMjNyZXNvbHZpbmctY29uZmxpY3RzLXdoZW4tcmVidWlsZGluZy1k
cm0tdGlwJmFtcDtkYXRhPTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2Mx
NDQxYTgxZTlkYzRmYTQ1MDcyMDhkODE5MWVhMGY2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI4Njk2NjYzMTU5NTMwMCZhbXA7c2RhdGE9cGZXUzRWZ0R2
VThJc1IyNjM4TURyN2ZZV0UwbmVmYTNiNlh4eVBDQ3NPVSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+
Cj4+Pgo+Pj4gVGhlIHNjcmlwdCBzaG91bGQgaGF2ZSB0b2xkIHlvdSB0aGF0IGFscmVhZHksIHNv
IG1heWJlIHJlaW52ZW50IHRoYXQKPj4+IGluIHdoYXRldmVyIHRoaW5nIHlvdSdyZSB1c2luZyA6
LSkgSmFuaSBoYXMgcmVwb3J0ZWQgdGhpcyBvbgo+Pj4gI2RyaS1kZXZlbCwgdGhpcyBhbHNvIGhv
bGRzIHVwIENJIHRlc3Rpbmcgc2luY2Ugd2UncmUgcnVubmluZyBvbiB0b3AKPj4+IG9mIGRybS10
aXAuCj4+Cj4+IFdlbGwgSSB1c2VkIGRpbSBwdXNoLWJyYW5jaC4gSSBldmVuIGhhZCB0byByZWJh
c2Ugb25jZSBtb3JlIGJlY2F1c2UgSSAKPj4gZm9yZ290IGEgc2lnbmVkLW9mIG9uIG9uZSBvZiB0
aGUgcGF0Y2hlcywgc28gSSdtIHByZXR0eSBzdXJlIG9mIHRoYXQuCj4+Cj4+IEhhdmVuJ3Qgc2Vl
biBhbnl0aGluZyBwcm9ibGVtYXRpYyBleGNlcHQgZm9yIHRoYXQgd2hpbGUgZG9pbmcgc28uCj4K
PiBPaywgYW55d2F5IHRoYXQgb25lIHdhcyB0cml2aWFsIHRvIGZpeC4KClJhbiBpbnRvIHRoZSBu
ZXh0IG1lcmdlIGNvbmZsaWN0LiBCdXQgbm8gc3VycHJpc2UgdGhhdCBJIG1pc3NlZCB0aGUgCndh
cm5pbmcsIHRoYXQgbmVlZHMgdG8gYmUgaW4gcmVkIG9yIHNvLgoKUmVnYXJkcywKQ2hyaXN0aWFu
LgoKPgo+IFRoYW5rcywKPiBDaHJpc3RpYW4uCj4KPj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFu
Lgo+Pgo+Pj4gLURhbmllbAo+Pj4KPj4+Cj4+Pgo+Pj4+IE9ubHkgVk1HRlggYW5kIE5vdXZlYXUg
YXJlIG1pc3NpbmcgYW5kIEknbSBwcmV0dHkgY2xvc2UgdG8ganVzdCBwdXNoCj4+Pj4gdGhlbSB3
aXRoIG15IEFja2VkLWJ5IHNpbmNlIHRoZXkgc2hvdWxkIG5vdCBjb250YWluIGFueSBmdW5jdGlv
bmFsIAo+Pj4+IGNoYW5nZS4KPj4+Pgo+Pj4+IEFueSBvYmplY3Rpb25zPwo+Pj4+Cj4+Pj4gVGhh
bmtzLAo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+IEFtIDI0LjA2LjIwIHVtIDIwOjI2IHNjaHJp
ZWIgTmlybW95IERhczoKPj4+Pj4gV2l0aCB0aGlzIHBhdGNoIHNlcmllcyBJIGFtIHRyeWluZyB0
byByZW1vdmUgR1BVIGFkZHJlc3MgCj4+Pj4+IGRlcGVuZGVuY3kgaW4KPj4+Pj4gVFRNIGFuZCBt
b3ZpbmcgR1BVIGFkZHJlc3MgY2FsY3VsYXRpb24gdG8gaW5kaXZpZHVhbCBkcm0gZHJpdmVycy4g
Cj4+Pj4+IFRoaXMKPj4+Pj4gY2xlYW51cCB3aWxsIHNpbXBsaWZ5IGludHJvZHVjdGlvbiBvZiBk
cm1fbWVtX3JlZ2lvbi9kb21haW4gd29yayAKPj4+Pj4gc3RhcnRlZAo+Pj4+PiBieSBCcmlhbiBX
ZWx0eVsxXS4KPj4+Pj4KPj4+Pj4KPj4+Pj4gSXQgd291bGQgYmUgbmljZSBpZiBzb21lb25lIHRl
c3QgdGhpcyBmb3Igbm91dmVhdS4gUmVzdCBvZiB0aGUgCj4+Pj4+IGRyaXZlcnMKPj4+Pj4gYXJl
IGFscmVhZHkgdGVzdGVkLgo+Pj4+Pgo+Pj4+PiB2MjoKPj4+Pj4gKiBzZXQgYm8tPm9mZnNldCA9
IDAgZm9yIGRybS9ub3V2ZWF1IGlmIGJvLT5tZW0ubW1fbm9kZSA9PSBOVUxMCj4+Pj4+Cj4+Pj4+
IHYzOgo+Pj4+PiAqIGNhdGNoIHJldHVybiB2YWx1ZSBvZiBkcm1fZ2VtX3ZyYW1fb2Zmc2V0KCkg
aW4gZHJtL2JvY2hzCj4+Pj4+ICogaW50cm9kdWNlIGRybV9nZW1fdnJhbV9wZ19vZmZzZXQoKSBp
biB2cmFtIGhlbHBlcgo+Pj4+PiAqIGltcHJvdmUgbmJvLT5vZmZzZXQgY2FsY3VsYXRpb24gZm9y
IG5vdXZlYXUKPj4+Pj4KPj4+Pj4gdjQ6Cj4+Pj4+ICogbWlub3IgY29kaW5nIHN0eWxlIGZpeGVz
IGluIGFtZGdwdSBhbmQgcmFkZW9uCj4+Pj4+ICogcmVtb3ZlIHVubmVjZXNzYXJ5IGtlcm5lbGRv
YyBmb3IgaW50ZXJuYWwgZnVuY3Rpb24KPj4+Pj4KPj4+Pj4gdjU6Cj4+Pj4+ICogcmViYXNlIG9u
IHRvcCBvZiBkcm0tbWlzYy1uZXh0Cj4+Pj4+ICogZml4IHJldHVybiB2YWx1ZSBvZiBkcm1fZ2Vt
X3ZyYW1fcGdfb2Zmc2V0KCkKPj4+Pj4gKiBhZGQgYSBjb21tZW50IGluIGRybV9nZW1fdnJhbV9w
Z19vZmZzZXQoKSB0byBjbGVhcmlmeSB3aHkgd2UgCj4+Pj4+IHJldHVybiAwLgo+Pj4+Pgo+Pj4+
PiB2NjoKPj4+Pj4gKiByZWJhc2UgdG8gZHJtLW1pc2MtbmV4dAo+Pj4+PiAqIHJlbW92ZWQgYWNr
ZWQgZm9yIHZtd2dmeCBhcyB0aGVyZSB3YXMgYSBzbWFsbCBjb25mbGljdAo+Pj4+Pgo+Pj4+PiBO
aXJtb3kgRGFzICg4KToKPj4+Pj4gwqDCoMKgIGRybS9hbWRncHU6IG1vdmUgdHRtIGJvLT5vZmZz
ZXQgdG8gYW1kZ3B1X2JvCj4+Pj4+IMKgwqDCoCBkcm0vcmFkZW9uOiBkb24ndCB1c2UgdHRtIGJv
LT5vZmZzZXQKPj4+Pj4gwqDCoMKgIGRybS92bXdnZng6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNl
dAo+Pj4+PiDCoMKgwqAgZHJtL25vdXZlYXU6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldCB2Mwo+
Pj4+PiDCoMKgwqAgZHJtL3F4bDogZG9uJ3QgdXNlIHR0bSBiby0+b2Zmc2V0Cj4+Pj4+IMKgwqDC
oCBkcm0vdnJhbS1oZWxwZXI6IGRvbid0IHVzZSB0dG0gYm8tPm9mZnNldCB2NAo+Pj4+PiDCoMKg
wqAgZHJtL2JvY2hzOiB1c2UgZHJtX2dlbV92cmFtX29mZnNldCB0byBnZXQgYm8gb2Zmc2V0IHYy
Cj4+Pj4+IMKgwqDCoCBkcm0vdHRtOiBkbyBub3Qga2VlcCBHUFUgZGVwZW5kZW50IGFkZHJlc3Nl
cwo+Pj4+Pgo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuY8KgIHwgMjMgKysrKysrKysrKysrKystLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaMKgIHzCoCAxICsKPj4+Pj4gwqDCoCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmPCoMKgwqDCoCB8IDMwIAo+Pj4+PiArKysrKysr
KysrKysrKysrLS0tLS0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmjCoMKgwqDCoCB8wqAgMSArCj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZtX3NkbWEuYyB8wqAgNCArLS0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9k
cm0vYm9jaHMvYm9jaHNfa21zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNyArKysrLQo+Pj4+
PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmPCoMKgwqDCoMKgwqAg
fCAxMSArKysrKysrLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0
L2NydGMuY8KgwqDCoMKgIHzCoCA2ICsrLS0tCj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52MDQvZGlzcC5jwqDCoMKgwqAgfMKgIDMgKystCj4+Pj4+IMKgwqAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52MDQvb3ZlcmxheS5jwqAgfMKgIDYgKystLS0KPj4+Pj4g
wqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9iYXNlNTA3Yy5jIHzCoCAyICst
Cj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZTUwN2QuYyB8
wqAgMiArLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL292bHk1
MDdlLmMgfMKgIDIgKy0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC93bmR3LmPCoMKgwqDCoCB8wqAgMiArLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L2Rpc3BudjUwL3duZHdjMzdlLmMgfMKgIDIgKy0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2FiaTE2LmPCoMKgwqDCoCB8wqAgOCArKystLS0KPj4+Pj4gwqDC
oCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmPCoMKgwqDCoMKgwqDCoCB8wqAg
OCArKysrKysKPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmjC
oMKgwqDCoMKgwqDCoCB8wqAgMyArKysKPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2NoYW4uY8KgwqDCoMKgwqAgfMKgIDIgKy0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uY8KgwqDCoMKgwqAgfMKgIDIgKy0KPj4+Pj4gwqDC
oCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2ZiY29uLmPCoMKgwqDCoCB8wqAgMiAr
LQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZ2VtLmPCoMKgwqDC
oMKgwqAgfCAxMCArKystLS0tCj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2ICsrLS0tCj4+Pj4+IMKgwqAgZHJp
dmVycy9ncHUvZHJtL3F4bC9xeGxfa21zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCA1ICsrLS0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDUgLS0tLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX3R0bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSAtLS0tLS0tCj4+
Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMSArCj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmjCoMKgwqDCoMKgIHwgMTYgKysrKysrKysrKy0KPj4+Pj4gwqDCoCBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uY8KgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0tCj4+Pj4+
IMKgwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNyAtLS0tLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2JvLmPCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKy0tCj4+Pj4+IMKgwqAgZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZXhlY2J1Zi5jwqDCoMKgwqAgfMKgIDIgKy0KPj4+Pj4gwqDC
oCBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9maWZvLmPCoMKgwqDCoMKgwqDCoCB8wqAg
MiArLQo+Pj4+PiDCoMKgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIu
Y8KgIHzCoCAyIC0tCj4+Pj4+IMKgwqAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtLQo+Pj4+PiDCoMKgIGluY2x1ZGUvZHJt
L3R0bS90dG1fYm9fZHJpdmVyLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+Pj4+
PiDCoMKgIDM2IGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspLCA3OCBkZWxldGlvbnMo
LSkKPj4+Pj4KPj4+Pj4gLS0gCj4+Pj4+IDIuMjcuMAo+Pj4+Pgo+Pj4KPj4KPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
