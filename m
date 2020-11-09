Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8F2AC65A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 21:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946F8894C9;
	Mon,  9 Nov 2020 20:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2042.outbound.protection.outlook.com [40.107.102.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB8A4894C9;
 Mon,  9 Nov 2020 20:53:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/4zzINDeRbWU9MRDh6zo4jyHP86Sd0epX6TsyGpRk0fxKIOAOj7vAROx+d9aX04kOuXgMyJ5Kvipyy5A4czSjJzxHXBM5+iBJFLxvgfHrXWioxVFWNSBMjJ6yjHP68b3vwC1CtyKETiA+J4lG3fcfV68V6xpB8o4DMlNRjbnY2viRopaoL5bT3qcyn8zP+j2glKypyUh+JCAvledEm43V3cXx100RIlM50L7JPFScyJ0TK9nGrsFtt4U54aGTUUDir+5A1htfxyF2VVf5a9dw3KcczM0R/49coq/460TnB/TAXfanUfgy06BsKfb8X6DUFymJ3Lrh3R7usSFGA6fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNF6mcNYeNDffgkDaFur3v2fLNrB8UkzXh5ujfbU3aM=;
 b=aVpjdWp0F5f2L2zQfjq4b9K0kZZbTRI3L1GcLMxzr84WART2+oIrBmyCkcaSpp5M7pPENtngliQs/LZ0uSXnvnPp32IviD28tKo/tKMz7WHSLrmZOd5l+uIHgli8EXpXwj2ltt5f/T1yYd2wwoS5GcrcUzzR4O2wbZjTsQoSm/AUgumPvNBXqDogdjfZXShlBXgsZH5+xR5OoWMJh742MiaFhd2LI1f5kNmOwYZcjdE05pFWsZVgm0Xq7hkpoOfU2HniqzfD8o/RICUE/svQ+0+yoAUeF4Mp+wzfSETG0kzHLfSsqIZZS5cu4ZhyDtJNBerNTTLr9wkHbA1X4pm93A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNF6mcNYeNDffgkDaFur3v2fLNrB8UkzXh5ujfbU3aM=;
 b=FQ7jXDQBb0LlQQptd/Oy3I9VH64aAHr06z+sTpeH3iczOpcc7+4sDZfvgYAHxyL7sS9df28xfvQ1+E4JRi97C9n/argAFjq8drfmBkyNA2K8F8k4zJkdnu//prUrVV7gpRbRDpTotyGLx7hUY+z/uAvrcWhFOMEFbqhzG+d8VlU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4250.namprd12.prod.outlook.com (2603:10b6:5:21a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Mon, 9 Nov 2020 20:53:02 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Mon, 9 Nov 2020
 20:53:02 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
 <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
 <78fd1669-e39b-d407-b558-f9ac76e494e2@amd.com>
 <CAKMK7uHa386Reo4q99sLQDaQR6nh6dgGm3duOq135h+kC2dLjA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <4675f173-1c29-ac41-9647-8a5594b85a1d@amd.com>
Date: Mon, 9 Nov 2020 15:53:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uHa386Reo4q99sLQDaQR6nh6dgGm3duOq135h+kC2dLjA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:757a:f239:6b01:6396]
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:757a:f239:6b01:6396]
 (2607:fea8:3edf:49b0:757a:f239:6b01:6396) by
 YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 20:53:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dba1198c-35aa-48f8-de91-08d884f172d3
X-MS-TrafficTypeDiagnostic: DM6PR12MB4250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4250BE17BFB035048720BB3DEAEA0@DM6PR12MB4250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uY+vvJWLj9yZNTS5eOo1zvbz4GoPv4HD9wfq3FKwbnKljsx2C34GTvGFpx98u6w9i7csoyk9znqJKiPLllaPaVc7JvJMGkUADq/M+uB63nCCTZqQIWeFqtar9LfgjrAmz4bDfWps1/0Li+uNONbcFLW+sOT2zEJ0tJcVyTx3b+9jnAEyZpFUz97xfF9WJB56SBG2K3QaJZQ+d8zXuF7FskIdvZfAlICF8jAqV5jjNHRbjyus/jDAMoKFdwiEnBPgO/Z/xC2QPLQzEFvGjhfnqD73tToedNsyPj5QS5W9GGoZ8t7lz/Ss8sgzdo1x7mP/H2hN3JqM33R1lMegRA6l2U0xyR0Br/eUBTxQ9ummZ5LQzJcvHBT/M9Y5swf+nYklXjhWfL6HI4lilw3UREgYk/nHMiZ7TGKVHDGiMYITnLD7FzHLuARAdFkAjGS0qC0H0ahUXaF1fTkQZp+z8JsMzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(66556008)(66476007)(36756003)(5660300002)(66946007)(54906003)(4326008)(6486002)(83380400001)(186003)(52116002)(86362001)(8676002)(53546011)(110136005)(2906002)(8936002)(66574015)(6636002)(31686004)(2616005)(316002)(478600001)(45080400002)(31696002)(16526019)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OUpRaDJCbXYxa0NFWWRxUEVOT0czeGNHMFlzblBZUkZDVmorL2tOWFJEbktB?=
 =?utf-8?B?OTR0YXErSnR4akFGUzJka205RUhVaGlWaHNmLzNpQ2F2MnBjQ2RqNzVBcGxw?=
 =?utf-8?B?Y0V0ODlrOEpzNU1UQmx1N1pvcHFZWllQNkVORUxFbUFEcmE0cUFtaDMzSUpD?=
 =?utf-8?B?Q2FoK202TVBLZ2I2cUp4WEh2dFNXZkVQSUpFTGt6ZnpmYStRVC9mR3d1QXla?=
 =?utf-8?B?V2QzYThKYUlCRGM0N3FoNEQ0QmhzTk91bUlZSnEzV2FIelJKRnpVd0NhdUpz?=
 =?utf-8?B?OUlIS3Z3NnJtN3pXSG5QWjMzdzFXWldDbnBpM0o0QkV4T1g0aDYzV21QR1Vp?=
 =?utf-8?B?a3RuVVV1aVdDQ2ZJYzZLUE93RGkvRGh0WnJ2OE5hd3NKbVFoZXBYditlejVJ?=
 =?utf-8?B?OGZEV3BrYjMwVnBuL1pISUh6WmxNNDdva29pT2hEd0h2WVh0STZxQjBEZnlJ?=
 =?utf-8?B?TllvQlRxRUgwbGZRMXNmWW9DeW1paWpqU3ZaUlFVdU5TclEzUy9OeXQyOXlK?=
 =?utf-8?B?K3VqaERVYkxVRXpuQkl1cEZpQkNRQnZNWlpMa3JhWERzN2pUSUNaY1I0Q3FT?=
 =?utf-8?B?ZEkvWFFKUVdNTERVMnRXZ2ZqdWhKcFVXdm1tS01DVFVYZDRYLzdzVHBHSG1i?=
 =?utf-8?B?bUNCanlDTzBiQXMxc040bHFUZFRvaWtkZ2N4RlNIcUFhMzRNV0UvdUliQmI4?=
 =?utf-8?B?RnBFT0NjVTQ2elErYnlnYXBxMlFNTXRuQndYYXlWckVrcHF2MkpsMERlcHRN?=
 =?utf-8?B?MDdhUzFpdURhOUpVN2s3VjJ6UHJKVy9CeXNvS3ZQU1lmUXE2QWFCeDZCMjlW?=
 =?utf-8?B?SFdpaHhWVStOMWhsZTkvS1NqOWZXMi9wME14bnpLTWs5RFBqWVVwZGpJS1ZJ?=
 =?utf-8?B?dlI1ZnFSVERSVFJrM2ZkYnEySG96TnhpcVJraDdUNW5SODgyWDZKT1RZd2ZH?=
 =?utf-8?B?ZUJxSElMb1ZGaktaVjZwSVd1OE5lZnBkWVBqWnlYQ2c5TTlXMnI0ZnlBTkRM?=
 =?utf-8?B?a0dlSWUzajE0NVZTRlR0MkNFNGNWWnVocmp5VGNzaDIxRjdYMTVsalRMeUJx?=
 =?utf-8?B?UnBOMUNSZmtZd0w1a0hSNy8ydUlZMjI2R0V1T2ZTaUltQ1ZRSU9IaW52L0dL?=
 =?utf-8?B?T0pjV2I2dUdmbThZRWxlak56RWU2dGtkQzdDSlBMK1VnaDVUM2ZCYXdaUXI1?=
 =?utf-8?B?ODd1NXo2M1l4V1hreTRhZmFmaHIydmNwak1ucjlUYUtHSTNMa2J1NDZrSm1Z?=
 =?utf-8?B?ajZQUnFLd1lSUWVHcGNTdWZFUjkwMjNSUkozZWZMTkhpR3RwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba1198c-35aa-48f8-de91-08d884f172d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 20:53:02.3100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KciX7fV68ra7eqqUbEZgMguB6tV3QQnB7lwME+I0KG+Toka/esUCcj7E2rczY55yDkLeE/CTSS+6//C6GZVFFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4250
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjIvMjAgMTo1MCBQTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEp1biAy
MiwgMjAyMCBhdCA3OjQ1IFBNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPj4gQW0gMjIuMDYuMjAgdW0gMTY6MzIgc2NocmllYiBBbmRyZXkgR3Jv
ZHpvdnNreToKPj4+IE9uIDYvMjIvMjAgOToxOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4+PiBBbSAyMS4wNi4yMCB1bSAwODowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+
PiBXaWxsIGJlIHVzZWQgdG8gcmVyb3V0ZSBDUFUgbWFwcGVkIEJPJ3MgcGFnZSBmYXVsdHMgb25j
ZQo+Pj4+PiBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+Pj4+IC0tLQo+Pj4+
PiAgICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyAgfCAgOCArKysrKysrKwo+Pj4+PiAgICBk
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMgfCAxMCArKysrKysrKysrCj4+Pj4+ICAgIGluY2x1
ZGUvZHJtL2RybV9maWxlLmggICAgICB8ICAyICsrCj4+Pj4+ICAgIGluY2x1ZGUvZHJtL2RybV9n
ZW0uaCAgICAgICB8ICAyICsrCj4+Pj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4+PiBpbmRleCBjNGM3MDRlLi42N2MwNzcw
IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+Pj4+PiBAQCAtMTg4LDYgKzE4OCwxMiBAQCBz
dHJ1Y3QgZHJtX2ZpbGUgKmRybV9maWxlX2FsbG9jKHN0cnVjdAo+Pj4+PiBkcm1fbWlub3IgKm1p
bm9yKQo+Pj4+PiAgICAgICAgICAgICAgICBnb3RvIG91dF9wcmltZV9kZXN0cm95Owo+Pj4+PiAg
ICAgICAgfQo+Pj4+PiAgICArICAgIGZpbGUtPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9L
RVJORUwgfCBfX0dGUF9aRVJPKTsKPj4+Pj4gKyAgICBpZiAoIWZpbGUtPmR1bW15X3BhZ2UpIHsK
Pj4+Pj4gKyAgICAgICAgcmV0ID0gLUVOT01FTTsKPj4+Pj4gKyAgICAgICAgZ290byBvdXRfcHJp
bWVfZGVzdHJveTsKPj4+Pj4gKyAgICB9Cj4+Pj4+ICsKPj4+Pj4gICAgICAgIHJldHVybiBmaWxl
Owo+Pj4+PiAgICAgIG91dF9wcmltZV9kZXN0cm95Ogo+Pj4+PiBAQCAtMjg0LDYgKzI5MCw4IEBA
IHZvaWQgZHJtX2ZpbGVfZnJlZShzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCj4+Pj4+ICAgICAgICBp
ZiAoZGV2LT5kcml2ZXItPnBvc3RjbG9zZSkKPj4+Pj4gICAgICAgICAgICBkZXYtPmRyaXZlci0+
cG9zdGNsb3NlKGRldiwgZmlsZSk7Cj4+Pj4+ICAgICsgICAgX19mcmVlX3BhZ2UoZmlsZS0+ZHVt
bXlfcGFnZSk7Cj4+Pj4+ICsKPj4+Pj4gICAgICAgIGRybV9wcmltZV9kZXN0cm95X2ZpbGVfcHJp
dmF0ZSgmZmlsZS0+cHJpbWUpOwo+Pj4+PiAgICAgICAgICBXQVJOX09OKCFsaXN0X2VtcHR5KCZm
aWxlLT5ldmVudF9saXN0KSk7Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+Pj4gaW5kZXggMWRlMmNk
ZS4uYzQ4MmU5YyAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5j
Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+PiBAQCAtMzM1LDYg
KzMzNSwxMyBAQCBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoc3RydWN0Cj4+Pj4+IGRy
bV9kZXZpY2UgKmRldiwKPj4+Pj4gICAgICAgICAgcmV0ID0gZHJtX3ByaW1lX2FkZF9idWZfaGFu
ZGxlKCZmaWxlX3ByaXYtPnByaW1lLAo+Pj4+PiAgICAgICAgICAgICAgICBkbWFfYnVmLCAqaGFu
ZGxlKTsKPj4+Pj4gKwo+Pj4+PiArICAgIGlmICghcmV0KSB7Cj4+Pj4+ICsgICAgICAgIG9iai0+
ZHVtbXlfcGFnZSA9IGFsbG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4+PiAr
ICAgICAgICBpZiAoIW9iai0+ZHVtbXlfcGFnZSkKPj4+Pj4gKyAgICAgICAgICAgIHJldCA9IC1F
Tk9NRU07Cj4+Pj4+ICsgICAgfQo+Pj4+PiArCj4+Pj4gV2hpbGUgdGhlIHBlciBmaWxlIGNhc2Ug
c3RpbGwgbG9va3MgYWNjZXB0YWJsZSB0aGlzIGlzIGEgY2xlYXIgTkFLCj4+Pj4gc2luY2UgaXQg
d2lsbCBtYXNzaXZlbHkgaW5jcmVhc2UgdGhlIG1lbW9yeSBuZWVkZWQgZm9yIGEgcHJpbWUKPj4+
PiBleHBvcnRlZCBvYmplY3QuCj4+Pj4KPj4+PiBJIHRoaW5rIHRoYXQgdGhpcyBpcyBxdWl0ZSBv
dmVya2lsbCBpbiB0aGUgZmlyc3QgcGxhY2UgYW5kIGZvciB0aGUKPj4+PiBob3QgdW5wbHVnIGNh
c2Ugd2UgY2FuIGp1c3QgdXNlIHRoZSBnbG9iYWwgZHVtbXkgcGFnZSBhcyB3ZWxsLgo+Pj4+Cj4+
Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+IEdsb2JhbCBkdW1teSBwYWdlIGlzIGdvb2QgZm9yIHJlYWQg
YWNjZXNzLCB3aGF0IGRvIHlvdSBkbyBvbiB3cml0ZQo+Pj4gYWNjZXNzID8gTXkgZmlyc3QgYXBw
cm9hY2ggd2FzIGluZGVlZCB0byBtYXAgYXQgZmlyc3QgZ2xvYmFsIGR1bW15Cj4+PiBwYWdlIGFz
IHJlYWQgb25seSBhbmQgbWFyayB0aGUgdm1hLT52bV9mbGFncyBhcyAhVk1fU0hBUkVEIGFzc3Vt
aW5nCj4+PiB0aGF0IHRoaXMgd291bGQgdHJpZ2dlciBDb3B5IE9uIFdyaXRlIGZsb3cgaW4gY29y
ZSBtbQo+Pj4gKGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4JTJGdjUuNy1yYzcl
MkZzb3VyY2UlMkZtbSUyRm1lbW9yeS5jJTIzTDM5NzcmYW1wO2RhdGE9MDIlN0MwMSU3Q0FuZHJl
eS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzM3NTM0NTFkMDM3NTQ0ZTc0OTU0MDhkODE2ZDRjNGVl
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI4NDQ1MDM4
NDU4NjEyMCZhbXA7c2RhdGE9WnBSYVFncUE1SzRqUmZpZE9pZWRleTBBbGVlWVE5N1dOVWtHQTI5
RVJBMCUzRCZhbXA7cmVzZXJ2ZWQ9MCkKPj4+IG9uIHRoZSBuZXh0IHBhZ2UgZmF1bHQgdG8gc2Ft
ZSBhZGRyZXNzIHRyaWdnZXJlZCBieSBhIHdyaXRlIGFjY2VzcyBidXQKPj4+IHRoZW4gaSByZWFs
aXplZCBhIG5ldyBDT1cgcGFnZSB3aWxsIGJlIGFsbG9jYXRlZCBmb3IgZWFjaCBzdWNoIG1hcHBp
bmcKPj4+IGFuZCB0aGlzIGlzIG11Y2ggbW9yZSB3YXN0ZWZ1bCB0aGVuIGhhdmluZyBhIGRlZGlj
YXRlZCBwYWdlIHBlciBHRU0KPj4+IG9iamVjdC4KPj4gWWVhaCwgYnV0IHRoaXMgaXMgb25seSBm
b3IgYSB2ZXJ5IHZlcnkgc21hbGwgY29ybmVyIGNhc2VzLiBXaGF0IHdlIG5lZWQKPj4gdG8gcHJl
dmVudCBpcyBpbmNyZWFzaW5nIHRoZSBtZW1vcnkgdXNhZ2UgZHVyaW5nIG5vcm1hbCBvcGVyYXRp
b24gdG8gbXVjaC4KPj4KPj4gVXNpbmcgbWVtb3J5IGR1cmluZyB0aGUgdW5wbHVnIGlzIGNvbXBs
ZXRlbHkgdW5wcm9ibGVtYXRpYyBiZWNhdXNlIHdlCj4+IGp1c3QgcmVsZWFzZWQgcXVpdGUgYSBi
dW5jaCBvZiBpdCBieSByZWxlYXNpbmcgYWxsIHRob3NlIHN5c3RlbSBtZW1vcnkKPj4gYnVmZmVy
cy4KPj4KPj4gQW5kIEknbSBwcmV0dHkgc3VyZSB0aGF0IENPV2VkIHBhZ2VzIGFyZSBjb3JyZWN0
bHkgYWNjb3VudGVkIHRvd2FyZHMgdGhlCj4+IHVzZWQgbWVtb3J5IG9mIGEgcHJvY2Vzcy4KPj4K
Pj4gU28gSSB0aGluayBpZiB0aGF0IGFwcHJvYWNoIHdvcmtzIGFzIGludGVuZGVkIGFuZCB0aGUg
Q09XIHBhZ2VzIGFyZQo+PiByZWxlYXNlZCBhZ2FpbiBvbiB1bm1hcHBpbmcgaXQgd291bGQgYmUg
dGhlIHBlcmZlY3Qgc29sdXRpb24gdG8gdGhlIHByb2JsZW0uCj4+Cj4+IERhbmllbCB3aGF0IGRv
IHlvdSB0aGluaz8KPiBJZiBDT1cgd29ya3MsIHN1cmUgc291bmRzIHJlYXNvbmFibGUuIEFuZCBp
ZiB3ZSBjYW4gbWFrZSBzdXJlIHdlCj4gbWFuYWdlZCB0byBkcm9wIGFsbCB0aGUgc3lzdGVtIGFs
bG9jYXRpb25zIChvdGhlcndpc2Ugc3VkZGVubHkgMngKPiBtZW1vcnkgdXNhZ2UsIHdvcnN0IGNh
c2UpLiBCdXQgSSBoYXZlIG5vIGlkZWEgd2hldGhlciB3ZSBjYW4KPiByZXRyb3Nob2Vob3JuIHRo
YXQgaW50byBhbiBlc3RhYmxpc2hlZCB2bWEsIHlvdSBtaWdodCBoYXZlIGZ1biBzdHVmZgo+IGxp
a2UgYSBta3dyaXRlIGhhbmRsZXIgdGhlcmUgKHdoaWNoIEkgdGhvdWdodCBpcyB0aGUgQ09XIGhh
bmRsZXIKPiB0aGluZywgYnV0IHJlYWxseSBubyBpZGVhKS4KCgpDYW4geW91IGNsYXJpZnkgeW91
ciBjb25jZXJuIGhlcmUgPyBJIHNlZSBubyBEUk0gZHJpdmVyIGJlc2lkZXMgdm13Z2Z4CndobyBp
bnN0YWxscyBhIGhhbmRsZXIgZm9yIHZtX29wZXJhdGlvbnNfc3RydWN0LnBhZ2VfbWt3cml0ZSBh
bmQgaW4gYW55CmNhc2UsIHNpbmNlIEkgd2lsbCBiZSB0dXJuaW5nIG9mZiBWTV9TSEFSRUQgZmxh
ZyBmb3IgdGhlIGZhdWx0aW5nIHZtX2FyZWFfc3RydWN0Cm1ha2luZyBpdCBhIENPVywgcGFnZV9t
a3dyaXRlIHdpbGwgbm90IGJlIGNhbGxlZCBvbiBhbnkgc3Vic2VxdWVudCB2bSBmYXVsdC4KCkFu
ZHJleQoKCj4KPiBJZiB3ZSBuZWVkIHRvIG1hc3NpdmVseSBjaGFuZ2Ugc3R1ZmYgdGhlbiBJIHRo
aW5rIHJ3IGR1bW15IHBhZ2UsCj4gYWxsb2NhdGVkIG9uIGZpcnN0IGZhdWx0IGFmdGVyIGhvdHVu
cGx1ZyAobWF5YmUganVzdCBtYWtlIGl0IG9uZSBwZXIKPiBvYmplY3QsIHRoYXQncyBzaW1wbGVz
dCkgc2VlbXMgbGlrZSB0aGUgbXVjaCBzYWZlciBvcHRpb24uIE11Y2ggbGVzcwo+IGNvZGUgdGhh
dCBjYW4gZ28gd3JvbmcuCj4gLURhbmllbAo+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4K
Pj4+IFdlIGNhbiBpbmRlZWQgb3B0aW1pemUgYnkgYWxsb2NhdGluZyB0aGlzIGR1bW15IHBhZ2Ug
b24gdGhlIGZpcnN0IHBhZ2UKPj4+IGZhdWx0IGFmdGVyIGRldmljZSBkaXNjb25uZWN0IGluc3Rl
YWQgb24gR0VNIG9iamVjdCBjcmVhdGlvbi4KPj4+Cj4+PiBBbmRyZXkKPj4+Cj4+Pgo+Pj4+PiBt
dXRleF91bmxvY2soJmZpbGVfcHJpdi0+cHJpbWUubG9jayk7Cj4+Pj4+ICAgICAgICBpZiAocmV0
KQo+Pj4+PiAgICAgICAgICAgIGdvdG8gZmFpbDsKPj4+Pj4gQEAgLTEwMDYsNiArMTAxMyw5IEBA
IHZvaWQgZHJtX3ByaW1lX2dlbV9kZXN0cm95KHN0cnVjdAo+Pj4+PiBkcm1fZ2VtX29iamVjdCAq
b2JqLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQo+Pj4+PiAgICAgICAgICAgIGRtYV9idWZfdW5tYXBf
YXR0YWNobWVudChhdHRhY2gsIHNnLCBETUFfQklESVJFQ1RJT05BTCk7Cj4+Pj4+ICAgICAgICBk
bWFfYnVmID0gYXR0YWNoLT5kbWFidWY7Cj4+Pj4+ICAgICAgICBkbWFfYnVmX2RldGFjaChhdHRh
Y2gtPmRtYWJ1ZiwgYXR0YWNoKTsKPj4+Pj4gKwo+Pj4+PiArICAgIF9fZnJlZV9wYWdlKG9iai0+
ZHVtbXlfcGFnZSk7Cj4+Pj4+ICsKPj4+Pj4gICAgICAgIC8qIHJlbW92ZSB0aGUgcmVmZXJlbmNl
ICovCj4+Pj4+ICAgICAgICBkbWFfYnVmX3B1dChkbWFfYnVmKTsKPj4+Pj4gICAgfQo+Pj4+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxl
LmgKPj4+Pj4gaW5kZXggMTlkZjgwMi4uMzQ5YTY1OCAxMDA2NDQKPj4+Pj4gLS0tIGEvaW5jbHVk
ZS9kcm0vZHJtX2ZpbGUuaAo+Pj4+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+Pj4+
IEBAIC0zMzUsNiArMzM1LDggQEAgc3RydWN0IGRybV9maWxlIHsKPj4+Pj4gICAgICAgICAqLwo+
Pj4+PiAgICAgICAgc3RydWN0IGRybV9wcmltZV9maWxlX3ByaXZhdGUgcHJpbWU7Cj4+Pj4+ICAg
ICsgICAgc3RydWN0IHBhZ2UgKmR1bW15X3BhZ2U7Cj4+Pj4+ICsKPj4+Pj4gICAgICAgIC8qIHBy
aXZhdGU6ICovCj4+Pj4+ICAgICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fTEVHQUNZKQo+Pj4+
PiAgICAgICAgdW5zaWduZWQgbG9uZyBsb2NrX2NvdW50OyAvKiBEUkkxIGxlZ2FjeSBsb2NrIGNv
dW50ICovCj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmggYi9pbmNsdWRl
L2RybS9kcm1fZ2VtLmgKPj4+Pj4gaW5kZXggMGIzNzUwNi4uNDc0NjBkMSAxMDA2NDQKPj4+Pj4g
LS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9n
ZW0uaAo+Pj4+PiBAQCAtMzEwLDYgKzMxMCw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCB7Cj4+
Pj4+ICAgICAgICAgKgo+Pj4+PiAgICAgICAgICovCj4+Pj4+ICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3RfZnVuY3MgKmZ1bmNzOwo+Pj4+PiArCj4+Pj4+ICsgICAgc3RydWN0IHBh
Z2UgKmR1bW15X3BhZ2U7Cj4+Pj4+ICAgIH07Cj4+Pj4+ICAgICAgLyoqCj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
