Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85375162E7A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 19:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5CD6E398;
	Tue, 18 Feb 2020 18:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6CF6E398;
 Tue, 18 Feb 2020 18:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biSTm3U/AgAY23rx2mkchp/QZNJDic604WyhcN67cdrqWn3NRgxoXd2ZfHKs/Z7dY1z8pHg7O1yNCQDNlDeu7YKPiITVG3vvTBJEaByz9MugcIm36THjg5S0vTHsKwmi7NZqYIo44pOZyHhizkpipSW428cwmm9S1ILKZYiKLUcux7EoxQmowHf1nD/Wl6Jzq2RmLJ1A/027/iqIfTzEakgQ2xoNFCMgXccxpP2KbnAKhbV6v61z+Tr1aV6SDp6v6lBgPS/9LiQnjQGRfw7Rt4UeICJSmNCQNK+aCa3V8PVJU0BiewBPg9SJiMpLXiytvRD8PlI9YxcBnw6kEuAf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+sKUdOFSjjKJYK7K7CqaN7WDv3X5zUGBT7qFscHif4=;
 b=g8ixcKY86hgl6PAhKoZQWiuJ/YMu+pYB8rqvyNsIlDSzVlGHfKTvtr75aaOT6ewHABbg55NsDeKgvVxxLXLd1KDZmTecBUVI9sDLisoyYNL3Pah3rOrQqf4FnZ5iGnLNNNX026yP5YsZKKI2M9owxhB6jS2co2yDUOWqZzejUaWSgRw3qzm9RZZ8Tg8P1zFiP4IiZIIq5q3QRX31IQzXAaIiubQM49Fcpp51YLUejSmrxf95bbRTkPOGL7HElA8tXpiOk+WYWnLe8e6jX/FgExG1UvqqMQbqhQFlTG/2eLOAW7WajE9pY8f0mBZUArAE+py8izC/HldbVQ7YfcMy+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+sKUdOFSjjKJYK7K7CqaN7WDv3X5zUGBT7qFscHif4=;
 b=1G+0esusm9aezbiaBBluxTyPpVc8B3ekGK1MN0Cbfasda0TuuGIKZBK90Y1L7BLV+jKzvFf4JLe5fBPw2smCK6X765awfgYOubCpWGJZAezgEoKZeQFELSbWd+CL9COF9qUaJmCQXiwc9C75vmvmArFJI1IUgOEEXhoG8jhdxzM=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nirmoy.Das@amd.com; 
Received: from DM5PR12MB2376.namprd12.prod.outlook.com (52.132.143.139) by
 DM5PR12MB1193.namprd12.prod.outlook.com (10.168.235.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Tue, 18 Feb 2020 18:28:13 +0000
Received: from DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904]) by DM5PR12MB2376.namprd12.prod.outlook.com
 ([fe80::ac12:6413:cd14:4904%4]) with mapi id 15.20.2750.016; Tue, 18 Feb 2020
 18:28:13 +0000
Subject: Re: [PATCH 8/8] drm/ttm: do not keep GPU dependent addresses
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.aiemd@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200217150427.49994-1-nirmoy.das@amd.com>
 <20200217150427.49994-9-nirmoy.das@amd.com>
 <c3a20c1b-0520-1995-7445-9e3f3ea77394@suse.de>
 <9db59846-90b4-2b9a-8200-69297112693a@amd.com>
 <edc985f1-8856-4d1a-8960-efe4d21b960d@amd.com>
 <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <3dbce6f8-b59a-3ddf-8dfd-cb702d96654b@amd.com>
Date: Tue, 18 Feb 2020 19:30:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <5b8db944-5a55-8161-6ab6-98490cfb0562@suse.de>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28)
 To DM5PR12MB2376.namprd12.prod.outlook.com
 (2603:10b6:4:b9::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2c:e900:7512:2832:6401:b174]
 (2003:c5:8f2c:e900:7512:2832:6401:b174) by
 FRYP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Tue, 18 Feb 2020 18:28:11 +0000
X-Originating-IP: [2003:c5:8f2c:e900:7512:2832:6401:b174]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1579940-cd26-4a0f-2d40-08d7b4a05080
X-MS-TrafficTypeDiagnostic: DM5PR12MB1193:|DM5PR12MB1193:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1193CA2741895C78BA2C7A1B8B110@DM5PR12MB1193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 031763BCAF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(189003)(199004)(110136005)(966005)(4326008)(31696002)(5660300002)(7416002)(36756003)(31686004)(478600001)(8676002)(8936002)(52116002)(16526019)(186003)(81156014)(81166006)(2616005)(66574012)(316002)(6486002)(6666004)(66946007)(66476007)(66556008)(2906002)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1193;
 H:DM5PR12MB2376.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qALTJp7Gn+NzsYud4VfCUvneGgqCtgVFFw0VyNZk7YWmZbBSMiA+aQjWUipHZFrBpETSMOg9o2Mz2UFF4/OKDf+PQzYbFurAOIyfZBCFkEJP85Irz8mHmxt38wxqOGoaNDHx9vSrZCFRnSF7Y5taeiMybZB3sUWhino4GUg09DQ1bg8QyKPFlrhOlRMFCEp/DTa3+TitVGRKggo6aN4UsQmAIqttY6LpNSH78frY9iAxWDSxqfnHI5ipZldudqOByqrBo49lAwrmBlrqSu9E1x6j/JK/fGeOoCUQAACqnOL5pOedisFrHU0IP40557jCyrtV8X79mZ1NTGMnjON7AVoEwBDmAIV0yF3ohVwZD1lZRpWcOU2x7tFoft6I9J6VmZwwyB9+33HMq/B9uXGWnKM/laInc2q5m2s7J3s2xKI3/IG5Is/AHepJWnbEW0vxKKCYxR/mHJPHTKMRtUFGYFuHFLNDmSAU7e98WnlMZw1u9YM8Vr+Udx/1UVt7fw8qliNb7QrvjrIzXkN3S6RYRg==
X-MS-Exchange-AntiSpam-MessageData: H+ZtM26Wxy+0/PP8/XvZsKqk1+27ZygnMbRIIjCxGNjwR8RIkcQU6RozfM+86svUsDL7yTas7d1wUsgsPB1wbnQCbFCGBB3u2j30bBFotTpq6aTvsvOFU869yJxbJTuSEMV/HnMntaZyjGtsF57wyyy2Xybwza0FOfM4PiSIyh4KuD4TcVfYkXsdpHTTSj8XLySkK/ba/4vgg+L7n2Bv1Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1579940-cd26-4a0f-2d40-08d7b4a05080
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2020 18:28:13.6328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7VesrAIwYwOD/BPW9pBY2pXVWypVdldp2dtaBXc3iebU3XQ6N6UEcHhoFn3KdiFFu9ffAr+9DFEf8eOtxIniQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1193
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 nouveau@lists.freedesktop.org, alexander.deucher@amd.com, sean@poorly.run,
 kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMTgvMjAgNzoxNiBQTSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4gSGkKPgo+IEFt
IDE4LjAyLjIwIHVtIDE4OjEzIHNjaHJpZWIgTmlybW95Ogo+PiBPbiAyLzE4LzIwIDE6NDQgUE0s
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAxOC4wMi4yMCB1bSAxMzo0MCBzY2hyaWVi
IFRob21hcyBaaW1tZXJtYW5uOgo+Pj4+IEhpCj4+Pj4KPj4+PiBBbSAxNy4wMi4yMCB1bSAxNjow
NCBzY2hyaWViIE5pcm1veSBEYXM6Cj4+Pj4+IEdQVSBhZGRyZXNzIGhhbmRsaW5nIGlzIGRldmlj
ZSBzcGVjaWZpYyBhbmQgc2hvdWxkIGJlIGhhbmRsZSBieSBpdHMKPj4+Pj4gZGV2aWNlCj4+Pj4+
IGRyaXZlci4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRh
c0BhbWQuY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmPCoMKgwqAgfCA3IC0tLS0tLS0KPj4+Pj4gIMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBp
LmjCoMKgwqAgfCAyIC0tCj4+Pj4+ICDCoCBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5o
IHwgMSAtCj4+Pj4+ICDCoCAzIGZpbGVzIGNoYW5nZWQsIDEwIGRlbGV0aW9ucygtKQo+Pj4+Pgo+
Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4gaW5kZXggMTUxZWRmZDhkZTc3Li5kNTg4
NWNkNjA5YTMgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMK
Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+PiBAQCAtODUsNyAr
ODUsNiBAQCBzdGF0aWMgdm9pZCB0dG1fbWVtX3R5cGVfZGVidWcoc3RydWN0Cj4+Pj4+IHR0bV9i
b19kZXZpY2UgKmJkZXYsIHN0cnVjdCBkcm1fcHJpbnRlciAqcAo+Pj4+PiAgwqDCoMKgwqDCoCBk
cm1fcHJpbnRmKHAsICLCoMKgwqAgaGFzX3R5cGU6ICVkXG4iLCBtYW4tPmhhc190eXBlKTsKPj4+
Pj4gIMKgwqDCoMKgwqAgZHJtX3ByaW50ZihwLCAiwqDCoMKgIHVzZV90eXBlOiAlZFxuIiwgbWFu
LT51c2VfdHlwZSk7Cj4+Pj4+ICDCoMKgwqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBmbGFn
czogMHglMDhYXG4iLCBtYW4tPmZsYWdzKTsKPj4+Pj4gLcKgwqDCoCBkcm1fcHJpbnRmKHAsICLC
oMKgwqAgZ3B1X29mZnNldDogMHglMDhsbFhcbiIsIG1hbi0+Z3B1X29mZnNldCk7Cj4+Pj4+ICDC
oMKgwqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBzaXplOiAlbGx1XG4iLCBtYW4tPnNpemUp
Owo+Pj4+PiAgwqDCoMKgwqDCoCBkcm1fcHJpbnRmKHAsICLCoMKgwqAgYXZhaWxhYmxlX2NhY2hp
bmc6IDB4JTA4WFxuIiwKPj4+Pj4gbWFuLT5hdmFpbGFibGVfY2FjaGluZyk7Cj4+Pj4+ICDCoMKg
wqDCoMKgIGRybV9wcmludGYocCwgIsKgwqDCoCBkZWZhdWx0X2NhY2hpbmc6IDB4JTA4WFxuIiwK
Pj4+Pj4gbWFuLT5kZWZhdWx0X2NhY2hpbmcpOwo+Pj4+PiBAQCAtMzQ1LDEyICszNDQsNiBAQCBz
dGF0aWMgaW50IHR0bV9ib19oYW5kbGVfbW92ZV9tZW0oc3RydWN0Cj4+Pj4+IHR0bV9idWZmZXJf
b2JqZWN0ICpibywKPj4+Pj4gIMKgIG1vdmVkOgo+Pj4+PiAgwqDCoMKgwqDCoCBiby0+ZXZpY3Rl
ZCA9IGZhbHNlOwo+Pj4+PiAgwqAgLcKgwqDCoCBpZiAoYm8tPm1lbS5tbV9ub2RlKQo+Pj4+PiAt
wqDCoMKgwqDCoMKgwqAgYm8tPm9mZnNldCA9IChiby0+bWVtLnN0YXJ0IDw8IFBBR0VfU0hJRlQp
ICsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmRldi0+bWFuW2JvLT5tZW0ubWVtX3R5
cGVdLmdwdV9vZmZzZXQ7Cj4+Pj4+IC3CoMKgwqAgZWxzZQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
Ym8tPm9mZnNldCA9IDA7Cj4+Pj4+IC0KPj4+PiBBZnRlciBtb3ZpbmcgdGhpcyBpbnRvIHVzZXJz
LCB0aGUgZWxzZSBicmFuY2ggaGFzIGJlZW4gbG9zdC4gSXMKPj4+PiAnYm8tPm1lbS5tbV9ub2Rl
JyBhbHdheXMgdHJ1ZT8KPj4+IEF0IGxlYXN0IGZvciB0aGUgYW1kZ3B1IGFuZCByYWRlb24gdXNl
IGNhc2VzLCB5ZXMuCj4+Pgo+Pj4gQnV0IHRoYXQgaXMgYSByYXRoZXIgZ29vZCBxdWVzdGlvbiBJ
IG1lYW4gZm9yIGl0IGlzIGlsbGVnYWwgdG8gZ2V0IHRoZQo+Pj4gR1BVIEJPIGFkZHJlc3MgaWYg
aXQgaXMgaW5hY2Nlc3NpYmxlIChlLmcuIGluIHRoZSBzeXN0ZW0gZG9tYWluKS4KPj4+Cj4+PiBD
b3VsZCBiZSB0aGF0IHNvbWUgZHJpdmVyIHJlbGllZCBvbiB0aGUgYmVoYXZpb3IgdG8gZ2V0IDAg
Zm9yIHRoZQo+Pj4gc3lzdGVtIGRvbWFpbiBoZXJlLgo+PiBJIHdvbmRlciBob3cgdG8gdmVyaWZ5
IHRoYXQgPwo+Pgo+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5Ogo+Pgo+PiAxIHF4bCB1c2Vz
IGJvLT5vZmZzZXQgb25seSBpbiBxeGxfYm9fcGh5c2ljYWxfYWRkcmVzcygpIHdoaWNoIGlzIG5v
dCBpbgo+PiBzeXN0ZW0gZG9tYWluLgo+Pgo+PiAyIHVuZm9ydHVuYXRlbHkgSSBjYW4ndCBzYXkg
dGhlIHNhbWUgZm9yIGJvY2hzIGJ1dCBpdCB3b3JrcyB3aXRoIHRoaXMKPj4gcGF0Y2ggc2VyaWVz
IHNvIEkgdGhpbmsgYm9jaHMgaXMgZmluZSBhcyB3ZWxsLgo+Pgo+PiAzIHZtd2dmeCB1c2VzIGJv
LT5vZmZzZXQgb25seSB3aGVuIGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1ZSQU0gc28KPj4g
dm13Z2Z4IHNob3VsZCBiZSBmaW5lLgo+Pgo+PiA0IGFtZGdwdSBhbmQgcmFkZW9uIHJ1bnMgd2l0
aCAnYm8tPm1lbS5tbV9ub2RlJyBhbHdheXMgdHJ1ZQo+Pgo+PiBJIGFtIG5vdCBzdXJlIGFib3V0
wqAgbm91dmVhdSBhcyBiby0+b2Zmc2V0IGlzIGJlaW5nIHVzZWQgaW4gbWFueSBwbGFjZXMuCj4+
Cj4+IEkgY291bGQgcHJvYmFibHkgbWlycm9yIHRoZSByZW1vdmVkIGxvZ2ljIHRvIG5vdXZlYXUg
YXMKPiBJIHN1Z2dlc3QgdG8gaW50cm9kdWNlIGEgdHRtIGhlbHBlciB0aGF0IGNvbnRhaW5zIHRo
ZSBvcmlnaW5hbCBicmFuY2hpbmcKPiBhbmQgdXNlIGl0IGV2ZXJ5d2hlcmUuIFNvbWV0aGluZyBs
aWtlCj4KPiAgICBzNjQgdHRtX2JvX29mZnNldChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
KQo+ICAgIHsKPiAgICAgICBpZiAoV0FSTl9PTl9PTkNFKCFiby0+bWVtLm1tX25vZGUpKQo+ICAg
ICAgICAgICByZXR1cm4gMDsKPiAgICAgICByZXR1cm4gYm8tPm1lbS5zdGFydCA8PCBQQUdFX1NI
SUZUOwo+ICAgIH0KPgo+IENvdWxkIGJlIHN0YXRpYyBpbmxpbmUuIFRoZSB3YXJuaW5nIHNob3Vs
ZCBwb2ludCB0byBicm9rZW4gZHJpdmVycy4gVGhpcwo+IGFsc28gZ2V0cyByaWQgb2YgdGhlIHVn
bHkgc2hpZnQgaW4gdGhlIGRyaXZlcnMuCgpUaGUgaWRlYSBoZXJlIGlzIHRvIHJlbW92ZSB0aGlz
IEdQVSBtZW1vcnkgb2Zmc2V0IGNhbGN1bGF0aW9uIGFuZCAKcmVmZXJlbmNlIGNvbXBsZXRlbHkK
CmZyb20gdHRtIGFuZCBsZXQgZHJpdmVycyBkZWNpZGUgaG93IHRvIGhhbmRsZSB0aGF0LiBEcml2
ZXJzIGFyZSBmdWxsIG9mIAp1Z2x5IHNoaWZ0IGFueXdheSBpbWhvIDopCgpSZWdhcmRzLAoKTmly
bW95Cgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4+IGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9iby5jCj4+IGluZGV4IGY4MDE1ZTAzMThkNy4uNWE2YTJhZjkxMzE4IDEwMDY0
NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCj4+IEBAIC0xMzE3LDYgKzEzMTcs
MTAgQEAgbm91dmVhdV9ib19tb3ZlX250Znkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4+ICpi
bywgYm9vbCBldmljdCwKPj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zv
cl9lYWNoX2VudHJ5KHZtYSwgJm52Ym8tPnZtYV9saXN0LCBoZWFkKSB7Cj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vdXZlYXVfdm1hX21hcCh2bWEs
IG1lbSk7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYm8tPm1lbS5tbV9ub2RlKQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnZiby0+b2Zmc2V0ID0gKG5ld19yZWct
PnN0YXJ0IDw8IFBBR0VfU0hJRlQpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
bHNlCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBudmJv
LT5vZmZzZXQgPSAwOwo+PiAgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KHZtYSwgJm52Ym8tPnZtYV9s
aXN0LCBoZWFkKSB7Cj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFdBUk5fT04odHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxzZSkpOwo+Pgo+PiBSZWdh
cmRzLAo+Pgo+PiBOaXJtb3kKPj4KPj4KPj4+IFJlZ2FyZHMsCj4+PiBDaHJpc3RpYW4uCj4+Pgo+
Pj4+IEJlc3QgcmVnYXJkcwo+Pj4+IFRob21hcwo+Pj4+Cj4+Pj4+ICDCoMKgwqDCoMKgIGN0eC0+
Ynl0ZXNfbW92ZWQgKz0gYm8tPm51bV9wYWdlcyA8PCBQQUdFX1NISUZUOwo+Pj4+PiAgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPj4+Pj4gIMKgIGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS90dG0vdHRt
X2JvX2FwaS5oCj4+Pj4+IGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4+PiBpbmRl
eCBiOWJjMWIwMDE0MmUuLmQ2ZjM5ZWU1YmY1ZCAxMDA2NDQKPj4+Pj4gLS0tIGEvaW5jbHVkZS9k
cm0vdHRtL3R0bV9ib19hcGkuaAo+Pj4+PiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2Fw
aS5oCj4+Pj4+IEBAIC0yMTMsOCArMjEzLDYgQEAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IHsK
Pj4+Pj4gIMKgwqDCoMKgwqDCoCAqIGVpdGhlciBvZiB0aGVzZSBsb2NrcyBoZWxkLgo+Pj4+PiAg
wqDCoMKgwqDCoMKgICovCj4+Pj4+ICDCoCAtwqDCoMKgIHVpbnQ2NF90IG9mZnNldDsgLyogR1BV
IGFkZHJlc3Mgc3BhY2UgaXMgaW5kZXBlbmRlbnQgb2YgQ1BVCj4+Pj4+IHdvcmQgc2l6ZSAqLwo+
Pj4+PiAtCj4+Pj4+ICDCoMKgwqDCoMKgIHN0cnVjdCBzZ190YWJsZSAqc2c7Cj4+Pj4+ICDCoCB9
Owo+Pj4+PiAgwqAgZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgK
Pj4+Pj4gYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4+Pj4+IGluZGV4IGM5ZTBm
ZDA5ZjRiMi4uYzhjZTZjMTgxYWJlIDEwMDY0NAo+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2RyaXZlci5oCj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVy
LmgKPj4+Pj4gQEAgLTE3Nyw3ICsxNzcsNiBAQCBzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
ewo+Pj4+PiAgwqDCoMKgwqDCoCBib29sIGhhc190eXBlOwo+Pj4+PiAgwqDCoMKgwqDCoCBib29s
IHVzZV90eXBlOwo+Pj4+PiAgwqDCoMKgwqDCoCB1aW50MzJfdCBmbGFnczsKPj4+Pj4gLcKgwqDC
oCB1aW50NjRfdCBncHVfb2Zmc2V0OyAvKiBHUFUgYWRkcmVzcyBzcGFjZSBpcyBpbmRlcGVuZGVu
dCBvZiBDUFUKPj4+Pj4gd29yZCBzaXplICovCj4+Pj4+ICDCoMKgwqDCoMKgIHVpbnQ2NF90IHNp
emU7Cj4+Pj4+ICDCoMKgwqDCoMKgIHVpbnQzMl90IGF2YWlsYWJsZV9jYWNoaW5nOwo+Pj4+PiAg
wqDCoMKgwqDCoCB1aW50MzJfdCBkZWZhdWx0X2NhY2hpbmc7Cj4+Pj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
