Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020BB3026DE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 16:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3A46E1AA;
	Mon, 25 Jan 2021 15:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770083.outbound.protection.outlook.com [40.107.77.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5E96E0F1;
 Mon, 25 Jan 2021 15:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoQq+elUMxm9qxno8hlQmx1Vb6T0P7P4kiW71XhCi8QtL2ej81oh4r1tAAWU7yU8yRa9cJ5OGHot2UrWhuo7PPB5hCeTcrG9nXo+mPh3QN9ZczP3VVRi7qYH6MccmPtgXXzQayiIeU41sQyIuKAj9cCBnKi5MS1fTnxjOhTqIGjsIJpApvAwElO+zMazKSuMqyn6JoE8gPTM5hwbcIh944hyPyvB6xYiBak2f/HT4K39hvnVdNuc4s1KD8eVGuHXtpjpwaI1ZuR9CG7bqtK5j5MIO8PychKNdYqA9yWdScVAhMnXqULKvwxpHC8agPvmfY/rDdGN9SvYhRZskAw34g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcL8cbsBM5Sx4qqz70znw/jQW82WHR82LKYPrbYntO0=;
 b=Elah22tWRqL8esdfHHL4kix5QOxESappOIdX9uEwS31ROyHPEDkap2fipW3sjIxWCQbwEpgac/MAogcrBdnS3/9GB87Ir04DkeSZKPIqspRV3tavtrGoSP8bQ6arxyXNjiixLLn+l6yDGm3tjipfSp5OT6f3jL3eeT6Fe+TH426c4hhNFBMzECTQEQ2KAJo53bYs9MX7jmzPYOqyQotBGZ0rVUoPzrgaTAYjIm5c0kN8ZoRxki7PvOhkVgmy1RPSLoIDCMttiofBRS79QQS6wNhhaYRqGadPyLZAuGy84wgJu1WP0B2ID4npZErePt2JzhO+rdTsYi1VWMGqbyv1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcL8cbsBM5Sx4qqz70znw/jQW82WHR82LKYPrbYntO0=;
 b=FHZZ6ssSNVm+vMhGXnd3BlqTtpnomSgp1E40nMD9Fv01wbtDKquAX/6Hezg7cY3q/EAjDH1VghLJTWtje+3Znvb4IGHWDtyDhlQKTECgW1Wj8SNOk7WnQa6dH5Z4lk5XP9dJqng2s0vIk5NHPnO4y50Kb1yKzNCEhVfvSK9f6Rs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2574.namprd12.prod.outlook.com (2603:10b6:802:26::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 25 Jan
 2021 15:28:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3784.017; Mon, 25 Jan 2021
 15:28:33 +0000
Subject: Re: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process
 dummy page.
To: Daniel Vetter <daniel@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
 <YAblHNmVZVlTI6ny@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <e6597fdd-5800-d6c4-95e8-7e736948e110@amd.com>
Date: Mon, 25 Jan 2021 10:28:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YAblHNmVZVlTI6ny@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:81bc:11e3:45d7:c3bc]
X-ClientProxiedBy: YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::37) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:81bc:11e3:45d7:c3bc]
 (2607:fea8:3edf:49b0:81bc:11e3:45d7:c3bc) by
 YTBPR01CA0024.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 15:28:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 67cc3026-07f3-4e8d-6fa1-08d8c145e068
X-MS-TrafficTypeDiagnostic: SN1PR12MB2574:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB25744213850B791711FF3324EABD9@SN1PR12MB2574.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U12DLf7NAh41XGY6CweX9XST3LQtGYkpb4lm9ZJVjginVG44OubQ7V+m8OaHsd04oSvkU90kc83Z0fThnZyjHUgnAs+rWDILrh7NfuAVVbhE/iMxckgepzLRlALtkLLxIm+NEHa24QFtRdDbGxvjHwmTvIy5btTq0tMxK6Nabi6bKC2KXYN67kYElWucosucPvRIj4YuNBH1dDv/USpBBgU50nAaw8oZqQbset7NDV+UPIyNH0fZDYBodGpw7Hp3+eqk48SdVHod/Bogzu2HVai9IGfzKMIjTX+1xAwkG7kwIYAyo3db9WA/RlNxVhk/WXzzaFzSdskQJadg0wbv5gGbB7hG7gvTqjpTInQcDKPGC+ZHW7h/4fWeuf+IWfAUnHYlMvsd4eGbZHO2hnuaMmgkmGCIrjU+Yvf22Kwspf7bRm6CwTAFcuNbBo0asPY2aXCLqKjI1XnMsVGdD3QJg6kh1rv2CPx85Y34kX+poMYIeUg81m8HwLaiYQLsCtKKjFfq7kpJC8I1dqMrj+RwobjKJIe4JQu5SOD6AZfzGUJDCIg18SwIc6EsUetfmsgeyjaAfoiNjF/6yvJFeXtEEdVOMN/G6qmYT6qhCZwrG48=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(31686004)(16526019)(8676002)(2906002)(53546011)(6486002)(186003)(66946007)(83380400001)(66556008)(66476007)(7416002)(36756003)(5660300002)(6916009)(52116002)(8936002)(4326008)(478600001)(86362001)(2616005)(316002)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEE1dDBTb1M0STdZM3pBdW5ZN25HWmtHakxuam8vUDBON0wraU9odkZydlZF?=
 =?utf-8?B?Q2JpeXBnS05pUDVab2U2OGlJTk5FVkhCcVlKK3ZEMTRWMy9JREJ6WlVoY1lK?=
 =?utf-8?B?bCthRk5ZcFNZaTd4N0RhR2VZZXlzb1Z5VXNHbjluNXVDQTBXbVVoRzc2WGtM?=
 =?utf-8?B?N09LL2hRVm9CT0hVZmVLc3Fsc1FCclVOd0c4NXZUbmJKMWFkeFk5YlZRS1BC?=
 =?utf-8?B?Rlc0dW5ERUo3RmlFTk9HVlREdUYwVnBKTG03Y2lVbGJNY2QzZXd2KzBYVENj?=
 =?utf-8?B?UjdscDBoejd1ZlNHSGVmY3VDQkpYVWxQYkZEQWpQNHRINmJ1Q08wWU9SNXNv?=
 =?utf-8?B?ZFFwZmtqbzl3bm55MGJoQXdnR2Y3ei9vV0ExNXFSTGRwdlRjbmdvSGJKNy90?=
 =?utf-8?B?SGY0WHBNWUVjSWpDVGFYMC9aUGtKSTREOEhqRnBGRVg1Q1VqYy85ZEJxZnVi?=
 =?utf-8?B?ZndKalZvWTFmN3pLcFhUUGY5TkxlZ2haSWl0WEJRdDBnc0ZwWkpNd1hZNDRH?=
 =?utf-8?B?NWdGN1MybGdLeEp6OCtKWmtRT2sva2NiclBtbEpFaTJoMHN3V09ZcVVFUmNp?=
 =?utf-8?B?cW9NY0xxN3Q5ckRBYlFjbVpraytnUVpueGVUV25WL2pKM0Vnd2t2QllVK0NQ?=
 =?utf-8?B?Z1ZWNXFBYkJHclJJMTVlVkhsNnk3WUxQY1R6cGdlcGVFSUN6cjJVVWJYZGRK?=
 =?utf-8?B?M1FXRGo1R3NUb09UOWpoMDFld2tSOTVaR1I1NDE4MWc4dDNMdlVnZEZ3WXN3?=
 =?utf-8?B?MGgxVGZZUW9Mc0VqWi9tdnE1M28rQ1lkYjN2My84TytqR1BIL0RpRFJhNEkv?=
 =?utf-8?B?a3hmeGpEZVg3Y21EY2tWRXI2M3Q5T1RVUzBQbVYrUzhQbFJrN0haOEtXaG9p?=
 =?utf-8?B?ZmZNSGRQdFJtb0VKZUswam52NnJIZ2lnWkxQd3VHRnBXanJ4OTVablJTNm0r?=
 =?utf-8?B?Rys4MWN0VnVVUFJmUWJydDcwU1d2bkh2Z3NlREV3V1NOand3ZnN3VFc5Y08v?=
 =?utf-8?B?aW02UjNtQTJsOGFleTVTV29kaUdKMCtrNlhYVmRlSysxL1NpZzB3a1lwTkM0?=
 =?utf-8?B?RXlFalZ4bTduMnBRMFl3SjIwczR3Nk4rcys4TUNKaXF4cU1jYTdCcUlucTlp?=
 =?utf-8?B?YmNnazluYWpsUlpFMk5ZRE5ielJheHRWeWxYdC94bEt3ZzlreXdLOVBKYTcx?=
 =?utf-8?B?K1NuS3FkWjRNS0oxd0hscG1nZ0dOT0JwWTFmUGtMc3BOSUJOVHJ3d09ZMGpv?=
 =?utf-8?B?SksvOUV1dGJCZFo4V0JGaElycjNBbldITmx5bHJjQjFSTy9LM0Jzemx3Y3Jv?=
 =?utf-8?B?c05ucDdRQTRSa3dHTWtZS2tkQjRvaVVVd3hod2tkcUVEaXR0K2gzWU9QV0JW?=
 =?utf-8?B?S3FaUndnOHJobUtsMEpjVEZHRUNqcHJ2UzErS1IrdXBha1h4SkZOR0hoUEVn?=
 =?utf-8?B?YlhJL3BnclExdC9abVdnVG5mS09QUFVtTElYV3JoVXhCWTA5Mkx3VXVBbVpT?=
 =?utf-8?Q?fkuzx1c6hkZEEYZk7jLWbke2VO+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cc3026-07f3-4e8d-6fa1-08d8c145e068
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 15:28:33.7078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /nEqOhyTo0174qyhHl9DVK0R8eMeZToFjbz12FibYh99BKYGP9LnW9Pex1ZzTEo7xHHxhgkDYu11QTa1cMHmrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2574
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjEgODo1NiBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEphbiAx
OCwgMjAyMSBhdCAwNDowMToxMFBNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4g
T24gZGV2aWNlIHJlbW92YWwgcmVyb3V0ZSBhbGwgQ1BVIG1hcHBpbmdzIHRvIGR1bW15IHBhZ2Uu
Cj4+Cj4+IHYzOgo+PiBSZW1vdmUgbG9vcCB0byBmaW5kIERSTSBmaWxlIGFuZCBpbnN0ZWFkIGFj
Y2VzcyBpdAo+PiBieSB2bWEtPnZtX2ZpbGUtPnByaXZhdGVfZGF0YS4gTW92ZSBkdW1teSBwYWdl
IGluc3RhbGxhdGlvbgo+PiBpbnRvIGEgc2VwYXJhdGUgZnVuY3Rpb24uCj4+Cj4+IHY0Ogo+PiBN
YXAgdGhlIGVudGlyZSBCT3MgVkEgc3BhY2UgaW50byBvbiBkZW1hbmQgYWxsb2NhdGVkIGR1bW15
IHBhZ2UKPj4gb24gdGhlIGZpcnN0IGZhdWx0IGZvciB0aGF0IEJPLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4gLS0t
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDgyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaCAgICB8ICAyICsKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+IGluZGV4IDZkYzk2Y2Yu
LmVkODlkYTMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMK
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+PiBAQCAtMzQsNiArMzQs
OCBAQAo+PiAgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KPj4gICAjaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+Cj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fdm1hX21h
bmFnZXIuaD4KPj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgo+PiArI2luY2x1ZGUgPGRybS9k
cm1fbWFuYWdlZC5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+PiAgICNpbmNsdWRlIDxs
aW51eC9wZm5fdC5oPgo+PiAgICNpbmNsdWRlIDxsaW51eC9yYnRyZWUuaD4KPj4gQEAgLTM4MCwy
NSArMzgyLDEwMyBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZiwKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fdm1fZmF1bHRf
cmVzZXJ2ZWQpOwo+PiAgIAo+PiArc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVhc2VfZHVtbXlfcGFn
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpyZXMpCj4+ICt7Cj4+ICsJc3RydWN0IHBh
Z2UgKmR1bW15X3BhZ2UgPSAoc3RydWN0IHBhZ2UgKilyZXM7Cj4+ICsKPj4gKwlfX2ZyZWVfcGFn
ZShkdW1teV9wYWdlKTsKPj4gK30KPj4gKwo+PiArdm1fZmF1bHRfdCB0dG1fYm9fdm1fZHVtbXlf
cGFnZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwgcGdwcm90X3QgcHJvdCkKPj4gK3sKPj4gKwlzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+PiArCXN0cnVjdCB0dG1fYnVmZmVy
X29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4gKwlzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiA9IGJvLT5iZGV2Owo+PiArCXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8t
PmJhc2UuZGV2Owo+PiArCXZtX2ZhdWx0X3QgcmV0ID0gVk1fRkFVTFRfTk9QQUdFOwo+PiArCXVu
c2lnbmVkIGxvbmcgYWRkcmVzcyA9IHZtYS0+dm1fc3RhcnQ7Cj4+ICsJdW5zaWduZWQgbG9uZyBu
dW1fcHJlZmF1bHQgPSAodm1hLT52bV9lbmQgLSB2bWEtPnZtX3N0YXJ0KSA+PiBQQUdFX1NISUZU
Owo+PiArCXVuc2lnbmVkIGxvbmcgcGZuOwo+PiArCXN0cnVjdCBwYWdlICpwYWdlOwo+PiArCWlu
dCBpOwo+PiArCj4+ICsJLyoKPj4gKwkgKiBXYWl0IGZvciBidWZmZXIgZGF0YSBpbiB0cmFuc2l0
LCBkdWUgdG8gYSBwaXBlbGluZWQKPj4gKwkgKiBtb3ZlLgo+PiArCSAqLwo+PiArCXJldCA9IHR0
bV9ib192bV9mYXVsdF9pZGxlKGJvLCB2bWYpOwo+PiArCWlmICh1bmxpa2VseShyZXQgIT0gMCkp
Cj4+ICsJCXJldHVybiByZXQ7Cj4+ICsKPj4gKwkvKiBBbGxvY2F0ZSBuZXcgZHVtbXkgcGFnZSB0
byBtYXAgYWxsIHRoZSBWQSByYW5nZSBpbiB0aGlzIFZNQSB0byBpdCovCj4+ICsJcGFnZSA9IGFs
bG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+PiArCWlmICghcGFnZSkKPj4gKwkJ
cmV0dXJuIFZNX0ZBVUxUX09PTTsKPj4gKwo+PiArCXBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwo+
PiArCj4+ICsJLyoKPj4gKwkgKiBQcmVmYXVsdCB0aGUgZW50aXJlIFZNQSByYW5nZSByaWdodCBh
d2F5IHRvIGF2b2lkIGZ1cnRoZXIgZmF1bHRzCj4+ICsJICovCj4+ICsJZm9yIChpID0gMDsgaSA8
IG51bV9wcmVmYXVsdDsgKytpKSB7Cj4+ICsKPj4gKwkJaWYgKHVubGlrZWx5KGFkZHJlc3MgPj0g
dm1hLT52bV9lbmQpKQo+PiArCQkJYnJlYWs7Cj4+ICsKPj4gKwkJaWYgKHZtYS0+dm1fZmxhZ3Mg
JiBWTV9NSVhFRE1BUCkKPj4gKwkJCXJldCA9IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCh2bWEsIGFk
ZHJlc3MsCj4+ICsJCQkJCQkgICAgX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSwKPj4gKwkJ
CQkJCSAgICBwcm90KTsKPj4gKwkJZWxzZQo+PiArCQkJcmV0ID0gdm1mX2luc2VydF9wZm5fcHJv
dCh2bWEsIGFkZHJlc3MsIHBmbiwgcHJvdCk7Cj4+ICsKPj4gKwkJLyogTmV2ZXIgZXJyb3Igb24g
cHJlZmF1bHRlZCBQVEVzICovCj4+ICsJCWlmICh1bmxpa2VseSgocmV0ICYgVk1fRkFVTFRfRVJS
T1IpKSkgewo+PiArCQkJaWYgKGkgPT0gMCkKPj4gKwkJCQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdF
Owo+PiArCQkJZWxzZQo+PiArCQkJCWJyZWFrOwo+PiArCQl9Cj4+ICsKPj4gKwkJYWRkcmVzcyAr
PSBQQUdFX1NJWkU7Cj4+ICsJfQo+PiArCj4+ICsJLyogU2V0IHRoZSBwYWdlIHRvIGJlIGZyZWVk
IHVzaW5nIGRybW0gcmVsZWFzZSBhY3Rpb24gKi8KPj4gKwlpZiAoZHJtbV9hZGRfYWN0aW9uX29y
X3Jlc2V0KGRkZXYsIHR0bV9ib19yZWxlYXNlX2R1bW15X3BhZ2UsIHBhZ2UpKQo+PiArCQlyZXR1
cm4gVk1fRkFVTFRfT09NOwo+PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gK0VYUE9SVF9T
WU1CT0wodHRtX2JvX3ZtX2R1bW15X3BhZ2UpOwo+IEkgdGhpbmsgd2UgY2FuIGxpZnQgdGhpcyBl
bnRpcmUgdGhpbmcgKG9uY2UgdGhlIHR0bV9ib192bV9mYXVsdF9pZGxlIGlzCj4gZ29uZSkgdG8g
dGhlIGRybSBsZXZlbCwgc2luY2Ugbm90aGluZyB0dG0gc3BlY2lmaWMgaW4gaGVyZS4gUHJvYmFi
bHkgc3R1ZmYKPiBpdCBpbnRvIGRybV9nZW0uYyAoYnV0IHJlYWxseSBpdCdzIG5vdCBldmVuIGdl
bSBzcGVjaWZpYywgaXQncyBmdWxseQo+IGdlbmVyaWMgInJlcGxhY2UgdGhpcyB2bWEgd2l0aCBk
dW1teSBwYWdlcyBwbHMiIGZ1bmN0aW9uLgoKCk9uY2UgSSBzdGFydGVkIHdpdGggdGhpcyBJIG5v
dGljZWQgdGhhdCBkcm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQgZGVwZW5kcwpvbiBzdHJ1Y3QgZHJt
X2RldmljZSAqZGRldiA9IGJvLT5iYXNlLmRldsKgIGFuZCBibyBpcyB0aGUgcHJpdmF0ZSBkYXRh
CndlIGVtYmVkIGF0IHRoZSBUVE0gbGV2ZWwgd2hlbiBzZXR0aW5nIHVwIHRoZSBtYXBwaW5nIGFu
ZCBzbyB0aGlzIGZvcmNlcwp0byBtb3ZlIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCBvdXQgb2Yg
dGhpcyBmdW5jdGlvbiB0byBldmVyeSBjbGllbnQgd2hvIHVzZXMKdGhpcyBmdW5jdGlvbiwgYW5k
IHRoZW4geW91IHNlcGFyYXRlIHRoZSBsb2dpYyBvZiBwYWdlIGFsbG9jYXRpb24gZnJvbSBpdCdz
IHJlbGVhc2UuClNvIEkgc3VnZ2VzdCB3ZSBrZWVwIGl0IGFzIGlzLgoKQW5kcmV5CgoKPgo+IEFz
aWRlIGZyb20gdGhpcyBuaXQgSSB0aGluayB0aGUgb3ZlcmFsbCBhcHByb2FjaCB5b3UgaGF2ZSBo
ZXJlIGlzIHN0YXJ0aW5nCj4gdG8gbG9vayBnb29kLiBMb3RzIG9mIHdvcmsmcG9saXNoLCBidXQg
aW1vIHdlJ3JlIGdldHRpbmcgdGhlcmUgYW5kIGNhbgo+IHN0YXJ0IGxhbmRpbmcgc3R1ZmYgc29v
bi4KPiAtRGFuaWVsCj4KPj4gKwo+PiAgIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0cnVj
dCB2bV9mYXVsdCAqdm1mKQo+PiAgIHsKPj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEg
PSB2bWYtPnZtYTsKPj4gICAJcGdwcm90X3QgcHJvdDsKPj4gICAJc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOwo+PiArCXN0cnVjdCBkcm1fZGV2aWNl
ICpkZGV2ID0gYm8tPmJhc2UuZGV2Owo+PiAgIAl2bV9mYXVsdF90IHJldDsKPj4gKwlpbnQgaWR4
Owo+PiAgIAo+PiAgIAlyZXQgPSB0dG1fYm9fdm1fcmVzZXJ2ZShibywgdm1mKTsKPj4gICAJaWYg
KHJldCkKPj4gICAJCXJldHVybiByZXQ7Cj4+ICAgCj4+ICAgCXByb3QgPSB2bWEtPnZtX3BhZ2Vf
cHJvdDsKPj4gLQlyZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCBwcm90LCBUVE1f
Qk9fVk1fTlVNX1BSRUZBVUxULCAxKTsKPj4gKwlpZiAoZHJtX2Rldl9lbnRlcihkZGV2LCAmaWR4
KSkgewo+PiArCQlyZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCBwcm90LCBUVE1f
Qk9fVk1fTlVNX1BSRUZBVUxULCAxKTsKPj4gKwkJZHJtX2Rldl9leGl0KGlkeCk7Cj4+ICsJfSBl
bHNlIHsKPj4gKwkJcmV0ID0gdHRtX2JvX3ZtX2R1bW15X3BhZ2Uodm1mLCBwcm90KTsKPj4gKwl9
Cj4+ICAgCWlmIChyZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRf
RkxBR19SRVRSWV9OT1dBSVQpKQo+PiAgIAkJcmV0dXJuIHJldDsKPj4gICAKPj4gICAJZG1hX3Jl
c3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwo+PiAgIAo+PiAgIAlyZXR1cm4gcmV0Owo+PiArCj4+
ICsJcmV0dXJuIHJldDsKPj4gICB9Cj4+ICAgRVhQT1JUX1NZTUJPTCh0dG1fYm9fdm1fZmF1bHQp
Owo+PiAgIAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2lu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4gaW5kZXggZTE3YmUzMi4uMTJmYjI0MCAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaAo+PiArKysgYi9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2FwaS5oCj4+IEBAIC02NDMsNCArNjQzLDYgQEAgdm9pZCB0dG1fYm9f
dm1fY2xvc2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+PiAgIGludCB0dG1fYm9fdm1f
YWNjZXNzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+
ICAgCQkgICAgIHZvaWQgKmJ1ZiwgaW50IGxlbiwgaW50IHdyaXRlKTsKPj4gICAKPj4gK3ZtX2Zh
dWx0X3QgdHRtX2JvX3ZtX2R1bW15X3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBncHJvdF90
IHByb3QpOwo+PiArCj4+ICAgI2VuZGlmCj4+IC0tIAo+PiAyLjcuNAo+PgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
