Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 817D916AF9B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 19:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBFD6E850;
	Mon, 24 Feb 2020 18:47:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358786E84A;
 Mon, 24 Feb 2020 18:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUKR8m1tO5rZircRQSarpxDkv1wKLElJDJjZaC2s1xwemLEA/4yFWyqRFy2P9Y+5GE0ZlEj2Gy4fvpmt56PYbRFWDqDuewyYMDp0U5F27oOSQ0yReb46+QNJOPwIFgnbFEQuK2p6YUHXuPq2DRy9aw4Jw8H2ytKGOgW58oYxMSAQRP+tsCXA6u6js6mwVW9+/W+oIpNqRmFtFD0YubHKD2mFr8+cod8t0sZkecPv6PDxVWE6gqj0xjo6Nj3jaTkVeEfyfzGvjg9sVqaUzfejvoJtNHIWXxSWh7KmDQgHpfaEZgEKR009ILynrP/6bt/hTqqHLiQVPwZfYNf/poww7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/e1j78x8DnTHLwy7Pu175bwhakDAYhYMhsY9IbqTR8=;
 b=g1g+aBA/kkmivGXErvnTbGu0NldEt7WMB572Oh9QSBEQrQJCCJbX+6xoycxyp3Sr2p8eCXZAScTCplJn1uKIsJKQ81dAaSeI93ugPyhGlcTNxpWyA8oObzwBwkULzFPFnJAbO0Iki4EQnMIDPD9amaMIldhnyJa3w4QHYoJk616rfy4vgcAheUSaEeoIZWZbfO8Y7tcgsK9Fqr75e6L7MfpiE5oKEzDzoVTP3iFT7+0LjTySG5141frvwPDD3ojbPz8QEWXF6RaeuRqB0JTnX8RLLFccEtRramQbS30UpiM6UNUTPi13CndQzOPIUpdH/5r0qmpJ8j0+5393nqG7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/e1j78x8DnTHLwy7Pu175bwhakDAYhYMhsY9IbqTR8=;
 b=fMdAw+VDWAgnDt9cnBxzptwvxi5zgOnNvddpP/m1GrKPsMMoB1CHi8zQPJqTvodq8kDwNkOAwQS1x6XaEyL5uORVnY+0cWyPvuv8eJKF7R7PcD75ixgd53vCW5JrR7+OlC0Cn7Rze5EGLLa2dpPLwlC0Agql6u1SpQ2EGKvwfuc=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB2390.namprd12.prod.outlook.com (2603:10b6:4:b5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Mon, 24 Feb
 2020 18:47:05 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Mon, 24 Feb
 2020 18:47:05 +0000
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20200217154509.2265-6-christian.koenig@amd.com>
 <20200217175518.GL2363188@phenom.ffwll.local>
 <f8ac7cbc-7c90-7119-735c-9f55adb6fa7f@shipmail.org>
 <CAKMK7uHG3EkEPbAQ3UEHHLcfmR+0NPq0wZuBX+s2-WCFdso8ew@mail.gmail.com>
 <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
 <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
Date: Mon, 24 Feb 2020 19:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0028.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Mon, 24 Feb 2020 18:47:04 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 354434b7-738c-46c1-7712-08d7b959f1c8
X-MS-TrafficTypeDiagnostic: DM5PR12MB2390:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2390019DF35701672A67C92383EC0@DM5PR12MB2390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 032334F434
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(189003)(199004)(2906002)(36756003)(2616005)(110136005)(54906003)(8936002)(6486002)(8676002)(186003)(16526019)(6666004)(52116002)(316002)(53546011)(66574012)(66946007)(478600001)(4326008)(66476007)(66556008)(86362001)(5660300002)(81166006)(31696002)(81156014)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2390;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWSgExHftnfyZZPtp9lYL6WkfNYNi+F3S3aDXrrEFYrvMOTnRuTN/TR0QARbywa/HsoxaX/bsxZ8k5O/iY9YyrKNwiyBBcdIg3TczJUXW79ZC8XiIaB26ed4xvHJgtB7gmiNcz95yteFZ1nTji6cdsKKDfORN4jqQn3GD0ODQ4rzrK0uaPjWYo2iPvg4hVZkC/8wq+ki76nFh6wDaKb9OIpS4QGn0hTl9QJ+TBz4uIIzkTJj7Ska/FWmcU3/GfoL8V9642eK56/KGAKcW76XPyQSmlYxhC9/XUCuMz4TbWuquI8ugKT49PIhHFIs3qzbx8y2RC9I2eRexXPxfu5rQOHKV6BtH5ohzTX4NWiN1sR58WDc1ZkqpLNQ5qoV3FzGnwe7QnUYhOI9PRDtUN69LMI+EBQbReJyTpVBodXTShnf9NmG+J5E1BcNpdJUfzwQ
X-MS-Exchange-AntiSpam-MessageData: pi6RaS2yFkp+sAsZ1onCJOWiHLxEkDqIcVTkuiQZH7VFgoLJMzst1RUniNh4pmjO2T9gLWahxplOyeYE4kxr9D7h30mXAloBW+SrTvUSMOCQgAfax8R326nzX8SJIy/LnMdp1s9mtqQr64FxgqxcrGWI7SacXM0sAEEe2wFt5XYa8jGq6HUltfKCmVAOy5GhSA1+xPElRQhDO1RuviJECA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354434b7-738c-46c1-7712-08d7b959f1c8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2020 18:47:05.8238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iVEEG7FP/TFOil6QVLlsiJGm7mT15EdTe1pWERInHWsSj6ECNFOeVzNFUf/4qmxj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2390
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDIuMjAgdW0gMTc6NTQgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBPbiAyLzIzLzIwIDQ6NDUgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIxLjAy
LjIwIHVtIDE4OjEyIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IFtTTklQXQo+Pj4gWWVhaCB0
aGUgR3JlYXQgUGxhbiAodG0pIGlzIHRvIGZ1bGx5IHJlbHkgb24gd3dfbXV0ZXggc2xvd2x5IAo+
Pj4gZGVnZW5lcmF0aW5nCj4+PiBpbnRvIGVzc2VudGlhbGx5IGEgZ2xvYmFsIGxvY2suIEJ1dCBv
bmx5IHdoZW4gdGhlcmUncyBhY3R1YWwgY29udGVudGlvbgo+Pj4gYW5kIHRocmFzaGluZy4KPj4K
Pj4gWWVzIGV4YWN0bHkuIEEgcmVhbGx5IGJpZyBwcm9ibGVtIGluIFRUTSBpcyBjdXJyZW50bHkg
dGhhdCB3ZSBkcm9wIAo+PiB0aGUgbG9jayBhZnRlciBldmljdGluZyBCT3MgYmVjYXVzZSB0aGV5
IHRlbmQgdG8gbW92ZSBpbiBhZ2FpbiAKPj4gZGlyZWN0bHkgYWZ0ZXIgdGhhdC4KPj4KPj4gRnJv
bSBwcmFjdGljZSBJIGNhbiBhbHNvIGNvbmZpcm0gdGhhdCB0aGVyZSBpcyBleGFjdGx5IHplcm8g
YmVuZWZpdCAKPj4gZnJvbSBkcm9wcGluZyBsb2NrcyBlYXJseSBhbmQgcmVhY3F1aXJlIHRoZW0g
Zm9yIGV4YW1wbGUgZm9yIHRoZSBWTSAKPj4gcGFnZSB0YWJsZXMuIFRoYXQncyBqdXN0IG1ha2Vz
IGl0IG1vcmUgbGlrZWx5IHRoYXQgc29tZWJvZHkgbmVlZHMgdG8gCj4+IHJvbGwgYmFjayBhbmQg
dGhpcyBpcyB3aGF0IHdlIG5lZWQgdG8gYXZvaWQgaW4gdGhlIGZpcnN0IHBsYWNlLgo+Cj4gSWYg
eW91IGhhdmUgYSBiZW5jaG1hcmtpbmcgc2V0dXAgYXZhaWxhYmxlIGl0IHdvdWxkIGJlIHZlcnkg
Cj4gaW50ZXJlc3RpbmcgZm9yIGZ1dHVyZSByZWZlcmVuY2UgdG8gc2VlIGhvdyBjaGFuZ2luZyBm
cm9tIFdEIHRvIFdXIAo+IG11dGV4ZXMgYWZmZWN0cyB0aGUgcm9sbCBiYWNrIGZyZXF1ZW5jeS4g
V1cgaXMga25vd24gdG8gY2F1c2UgCj4gcm9sbGJhY2tzIG11Y2ggbGVzcyBmcmVxdWVudGx5IGJ1
dCB0aGVyZSBpcyBtb3JlIHdvcmsgYXNzb2NpYXRlZCB3aXRoIAo+IGVhY2ggcm9sbGJhY2suCgpO
b3Qgb2YgaGFuZC4gVG8gYmUgaG9uZXN0IEkgc3RpbGwgaGF2ZSBhIGhhcmQgdGltZSB0byBnZXQg
YSBncmlwIG9uIHRoZSAKZGlmZmVyZW5jZSBiZXR3ZWVuIFdEIGFuZCBXVyBmcm9tIHRoZSBhbGdv
cml0aG0gcG9pbnQgb2Ygdmlldy4gU28gSSAKY2FuJ3QganVkZ2UgdGhhdCBkaWZmZXJlbmNlIGF0
IGFsbC4KCj4+IENvbnRlbnRpb24gb24gQk8gbG9ja3MgZHVyaW5nIGNvbW1hbmQgc3VibWlzc2lv
biBpcyBwZXJmZWN0bHkgZmluZSBhcyAKPj4gbG9uZyBhcyB0aGlzIGlzIGFzIGxpZ2h0d2VpZ2h0
IGFzIHBvc3NpYmxlIHdoaWxlIHdlIGRvbid0IGhhdmUgCj4+IHRyYXNoaW5nLiBXaGVuIHdlIGhh
dmUgdHJhc2hpbmcgbXVsdGkgc3VibWlzc2lvbiBwZXJmb3JtYW5jZSBpcyBiZXN0IAo+PiBhcmNo
aXZlZCB0byBqdXN0IGZhdm9yIGEgc2luZ2xlIHByb2Nlc3MgdG8gZmluaXNoIGl0cyBidXNpbmVz
cyBhbmQgCj4+IGJsb2NrIGV2ZXJ5Ym9keSBlbHNlLgo+Cj4gSG1tLiBTb3VuZHMgbGlrZSB3ZSBu
ZWVkIGEgcGVyLW1hbmFnZXIgd3dfcndzZW0gcHJvdGVjdGluZyBtYW5hZ2VyIAo+IGFsbG9jYXRp
b24sIHRha2VuIGluIHdyaXRlLW1vZGUgdGhlbiB0aGVyZSdzIHRocmFzaGluZy4gSW4gcmVhZC1t
b2RlIAo+IG90aGVyd2lzZS4gVGhhdCB3b3VsZCBsaW1pdCB0aGUgYW1vdW50IG9mICJ1bm5lY2Vz
c2FyeSIgbG9ja3Mgd2UnZCAKPiBoYXZlIHRvIGtlZXAgYW5kIHJlZHVjZSB1bndhbnRlZCBzaWRl
LWVmZmVjdHMsIChzZWUgYmVsb3cpOgoKV2VsbCBwZXItbWFuYWdlciAoeW91IG1lYW4gcGVyIGRv
bWFpbiBoZXJlIGRvbid0IHlvdT8pIGRvZXNuJ3Qgc291bmQgCmxpa2UgdGhhdCB1c2VmdWwgYmVj
YXVzZSB3ZSByYXJlbHkgdXNlIG9ubHkgb25lIGRvbWFpbiwgYnV0IEknbSBhY3R1YWxseSAKcXVl
c3Rpb25pbmcgZm9yIHF1aXRlIGEgd2hpbGUgaWYgdGhlIHBlciBCTyBsb2NrIHNjaGVtZSB3YXMg
dGhlIHJpZ2h0IAphcHByb2FjaC4KClNlZSBmcm9tIHRoZSBwZXJmb3JtYW5jZSBhc3BlY3QgdGhl
IGNsb3Nlc3QgdG8gaWRlYWwgc29sdXRpb24gSSBjYW4gCnRoaW5rIG9mIHdvdWxkIGJlIGEgd3df
cndzZW0gcGVyIHVzZXIgb2YgYSByZXNvdXJjZS4KCkluIG90aGVyIHdvcmRzIHdlIGRvbid0IGxv
Y2sgQk9zLCBidXQgaW5zdGVhZCBhIGxpc3Qgb2YgYWxsIHRoZWlyIHVzZXJzIAphbmQgd2hlbiB5
b3Ugd2FudCB0byBldmljdCBhIEJPIHlvdSBuZWVkIHRvIHdhbGsgdGhhdCBsaXN0IGFuZCBpbmZv
cm0gCmFsbCB1c2VycyB0aGF0IHRoZSBCTyB3aWxsIGJlIG1vdmluZy4KCkR1cmluZyBjb21tYW5k
IHN1Ym1pc3Npb24geW91IHRoZW4gaGF2ZSB0aGUgZmFzdCBwYXRoIHdoaWNoIHJhdGhlciBqdXN0
IApncmFicyB0aGUgcmVhZCBzaWRlIG9mIHRoZSB1c2VyIGxvY2sgYW5kIGNoZWNrIGlmIGFsbCBC
T3MgYXJlIHN0aWxsIGluIAp0aGUgZXhwZWN0ZWQgcGxhY2UuCgpJZiBzb21lIEJPcyB3ZXJlIGV2
aWN0ZWQgeW91IGJhY2sgb2ZmIGFuZCBzdGFydCB0aGUgc2xvdyBwYXRoLCBlLmcuIAptYXliZSBl
dmVuIGNvcHkgYWRkaXRpb25hbCBkYXRhIGZyb20gdXNlcnNwYWNlIHRoZW4gZ3JhYiB0aGUgd3Jp
dGUgc2lkZSAKb2YgdGhlIGxvY2sgZXRjLi4gZXRjLi4uCgpUaGF0IGFwcHJvYWNoIGlzIHNpbWls
YXIgdG8gd2hhdCB3ZSB1c2UgaW4gYW1kZ3B1IHdpdGggdGhlIHBlci1WTSBCT3MsIApidXQgZ29l
cyBhIHN0ZXAgZnVydGhlci4gUHJvYmxlbSBpcyB0aGF0IHdlIGFyZSBzbyB1c2VkIHRvIHBlciBC
TyBsb2NrcyAKaW4gdGhlIGtlcm5lbCB0aGF0IHRoaXMgaXMgcHJvYmFibHkgbm90IGRvYWJsZSBh
bnkgbW9yZS4KCj4+IEJlY2F1c2Ugb2YgdGhpcyBJIHdvdWxkIGFjdHVhbGx5IHZvdGUgZm9yIGZv
cmJpZGRpbmcgdG8gcmVsZWFzZSAKPj4gaW5kaXZpZHVhbCB3d19tdXRleCgpIGxvY2tzIGluIGEg
Y29udGV4dC4KPgo+IFllcywgSSBzZWUgdGhlIHByb2JsZW0uCj4KPiBCdXQgbXkgZmlyc3QgcmVh
Y3Rpb24gaXMgdGhhdCB0aGlzIG1pZ2h0IGhhdmUgdW5kZXJzaXJhYmxlIAo+IHNpZGUtZWZmZWN0
cy4gTGV0J3Mgc2F5IHNvbWVib2R5IHdhbnRlZCB0byBzd2FwIHRoZSBldmljdGVkIEJPcyBvdXQ/
CgpQbGVhc2UgZXhwbGFpbiBmdXJ0aGVyLCBJIG9mZiBoYW5kIGRvbid0IHNlZSB0aGUgcHJvYmxl
bSBoZXJlLgoKSW4gZ2VuZXJhbCBJIGFjdHVhbGx5IHdhbnRlZCB0byByZS13b3JrIFRUTSBpbiBh
IHdheSB0aGF0IEJPcyBpbiB0aGUgClNZU1RFTS9TV0FQQUJMRSBkb21haW4gYXJlIGFsd2F5cyBi
YWNrZWQgYnkgYSBzaG1lbSBmaWxlIGluc3RlYWQgb2YgdGhlIApzdHJ1Y3QgcGFnZSBhcnJheSB3
ZSBjdXJyZW50bHkgaGF2ZS4KCj4gT3IgY3B1LXdyaXRlcyB0byB0aGVtIGNhdXNpbmcgZmF1bHRz
LCB0aGF0IG1pZ2h0IGFsc28gYmxvY2sgdGhlIAo+IG1tX3NlbSwgd2hpY2ggaW4gdHVybiBibG9j
a3MgaHVnZXBhZ2VkPwoKTWhtLCBJIGFsc28gb25seSBoYXZlIGEgaGlnaGVyIGxldmVsIHZpZXcg
aG93IGh1Z2VwYWdlZCB3b3JrcyBzbyB3aHkgCmRvZXMgaXQgZ3JhYnMgdGhlIG1tX3NlbSBvbiB0
aGUgd3JpdGUgc2lkZT8KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+IFN0aWxsIGl0J3MgYSBmYWly
bHkgc2ltcGxlIHNvbHV0aW9uIHRvIGEgcHJvYmxlbSB0aGF0IHNlZW1zIG90aGVyd2lzZSAKPiBo
YXJkIHRvIHNvbHZlIGVmZmljaWVudGx5Lgo+Cj4gVGhhbmtzLAo+IFRob21hcwo+Cj4KPj4KPj4g
UmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gLURhbmllbAo+Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
