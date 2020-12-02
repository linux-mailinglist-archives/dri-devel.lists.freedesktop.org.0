Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDF2CC12E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 16:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7716EA57;
	Wed,  2 Dec 2020 15:48:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D4E6EA55;
 Wed,  2 Dec 2020 15:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZrSPvL5Ncn7tR85QPpZ7hJi22JW5Ch01i3YWvCiIkLme5BygniByEd5knXLieAdR5iRgk9ia2ne4yW8Kkz0iY1BShnXDbOJrAZswWu1lWRZ8jKthThaLnC7tNHtjYRrEg9ROweVTH/UWRDV8Kmj+LiOFJVkRnjzraPI1UVDJfrPkXqhEPKCWf/3+fNZ6FNn017nyBks/WUJedaOzDyzoUXDVcmfCX/g6ETUK6yTk7kSq3rozjV1IA9qCdOj9PWk/R03pcDfVtf7ZixHuIu+nR3eySDBNldnhZh9pqqyLuVU6QZg1mbG5TIfh8arQFaT0ww47PajxA/kZbwx35zD5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+RHAPral1p+c0LpaYYk/HpvnxlON7V/lViInFdZCAs=;
 b=XSn/5+tT4tBtv7HC5aenYqLZLHx1nyi3BL22GAOLMTGqHiIZEwAyWNsXdblHmBf2dgo/zLZxfMDtvE6r8A6Yg+OyI/JRai4O/5sknftte4NMv+wqJcuG1C6OWYPcV2BEAu7LIqdGBNdg7zzuuRlJZIfIe5+mvJRlhR1rzcEMJWRU+Os6nE+A648+gXsK9qmYiY3zq61GOYDoQqIryN9pWM07L8I1UmtU/wNKNlVGzbPmZuCb5mjRPCfyRGjAQ2LbEJRPBoT2Vrqy9F+G9EZ/Crh6eOa/rnzcUWIHuaqAS1ZFScIeCqcoQBeHLr8/wENMiwHfi756v1hWYj5y7aiKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+RHAPral1p+c0LpaYYk/HpvnxlON7V/lViInFdZCAs=;
 b=uLEj8IhkLOTC5YBjq3GzfkCMC4Vuxnk4xq4n2rOeMfVVM/2hbRgCPes+9RLjl3a86c8tBCQjWOqZ7IBmKAhbYg7VRVBfoRSlysOgeVhPOU3NUcfuO5smvdQY7axU3ZlU5sgFxuiVbS07HWFDBP+CVnegaZrubWz+IbXJ2AHxw/I=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB2940.namprd12.prod.outlook.com (2603:10b6:5:15f::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17; Wed, 2 Dec 2020 15:48:04 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3611.025; Wed, 2 Dec 2020
 15:48:04 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200622112139.GA3421602@kroah.com>
 <fdaebe5b-3930-66d6-4f62-3e59e515e3da@amd.com>
 <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com> <X6wEbtSDm69gzFbR@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <bc6cc476-4f09-1c0f-37b9-522723ecdc85@amd.com>
Date: Wed, 2 Dec 2020 10:48:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X6wEbtSDm69gzFbR@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
X-ClientProxiedBy: YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::11) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9ced:9698:f02b:99c8]
 (2607:fea8:3edf:49b0:9ced:9698:f02b:99c8) by
 YT1PR01CA0072.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 15:48:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae278fad-ad09-4b56-3d1a-08d896d9a7eb
X-MS-TrafficTypeDiagnostic: DM6PR12MB2940:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2940D6E5AF9863DFC115BD46EAF30@DM6PR12MB2940.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYxtX7iDD1GDg4GV9zjlzR2E/0FN8ycNUWpkO/U0SeRMA3ZnPJ+h2JM7DxFXQaaUvbsVQTuzvURn60Awqcw4HJIN0u30kY/NVnnmtUqVs2ralF/LEdJj1DitTqwvVuqMq88zrEiqhhsfphbFRx48beLX+fn1NxVNb4HAalFJo5ALPnHxltgi9QMwRpfZgkTbijCHqSsW/rtQDNPZfXp4FUXX+xByyghYffZz2QuJaSF789eGW8IX9jDx9WcqNuUc8iYZ4Bgb1hf+/XdDOuDB8S0aMAvT/N3zMh7938vj+phnmK9byggW+LBeIYI26HlfoO3MdARAQNSOmH4VJCywFScu2tKENJOPOqeNaQ3uQVeimolgnUeGE+qAcEO9ertClURKv7nNiSKrzNCVX3JW2pPKQNpQf6qSVF+XYmX9+O5oySH2Yh+8TOoVWL/dA4Pw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(2906002)(86362001)(478600001)(66946007)(66476007)(2616005)(66556008)(6916009)(6486002)(31686004)(36756003)(316002)(83380400001)(53546011)(966005)(8676002)(45080400002)(31696002)(5660300002)(8936002)(16526019)(186003)(4326008)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUVwajRITmRwRS9kUldtZXRMb0hrVjV0QUhySzRuVHU0cDZydHdQeVVEQVhY?=
 =?utf-8?B?MmxYNzlTU2ptYjlKMVByYXBrL1F3UVNHVTloVjhXT1BEM0F2cE05RlM4b05s?=
 =?utf-8?B?YW9CdDdxZkVqUkdQcXIrNGhRVm8wVHNyNjRKeDlFZ013ZHEwSHhwL2Nzb20x?=
 =?utf-8?B?NklvYUNpWXJMR2taOENZdVJtazFoZ2ZHMVEwWUxjenhERlBmVWtYckZ2cUlt?=
 =?utf-8?B?QXc5YmZJM24vZHZNK1ZFZFJBbDFUTzVZS1RnMERCQzFKSGt2S2FSSjEyNlYw?=
 =?utf-8?B?OWEzVGVIdEJWOElOMnZGY2hlWUJUajVQRFpYS2ZJaFJ3MGtYL2QyYUhVZkNh?=
 =?utf-8?B?N2NlWEZDK24yZWVmLzBtbnZMWGtrWlBoNkxVY2xnWFhIYkNTMWRmeE1QeHdv?=
 =?utf-8?B?ejJnVGlPaGtLb1BRYlIwTEQ4cnhyZU5CM3dqZ1BwNHhUbllLRHJPa1lRUnBS?=
 =?utf-8?B?ZU1SVjkzOUQ1Y0lEQWZkMzF3L1JCVG9Ja1hXc1orQmdZSWRiYU9sU29PTmtx?=
 =?utf-8?B?dEtwbkZOcUZSeWw3YWZpRURyd2h4OVc1OXJUWU1hOHRmS3hzLzVlcThkU2FX?=
 =?utf-8?B?MzduVGlabm56SGpwNWtUSnlKKy93N3JDTDlRMUsxaU02ajBGMDR3eUxhUGtT?=
 =?utf-8?B?WGg0RlpyY2Z2YndBQlFSNDhZYk5mZTc1ZjVUQ08rS1BvMEp2TGZEc0svY1dX?=
 =?utf-8?B?SThhTy91bzdJdlZtT3ZTUWQ1TlZXcHJ2V2lmQVZ3N3NWZ1lya2w0UGVweHBh?=
 =?utf-8?B?WGd1OTJjM0ZpU1BJSFFwVkp4OWlDT1VNUHZFNjR2NHFtRWE2SE5mVjE5Q2RP?=
 =?utf-8?B?dlp0aHR3RmpmbmRyb0JQODBvbVlIMmxHYW90Ukd2RG42eHVxQmltUkZUYmVZ?=
 =?utf-8?B?TmVWdUtFZHhkWjFUZHlNbEJpTzZPbGxUWldITlN2L1JzOUNnMkF5VWdLK2Vm?=
 =?utf-8?B?elIvQ0FkUVl2cjNvSndkaG9uNVZpaHMxV0piTXp0MlZwaWNuaE50Wlp2OEEv?=
 =?utf-8?B?ajJCRGpEa0pXdVEydFljZVFIdHFIN3BMM0tXRGxoakZYR0UwMWdSR2sxNnJy?=
 =?utf-8?B?a3E3bkJBRlhKc3hlRE0rUkNDY2xLRUtaSGFyU1l1Qk84cGNFYUI2YjRCQlRx?=
 =?utf-8?B?S1UwYTUxcHFFSVIyRHI1YmZWbkd0MGRERStYM2pLNnhkWGE4ZzdHWkVxak1q?=
 =?utf-8?B?T3pvems1NGM5UStQK2gvOVZ0V3laa0NvN2phU3BhUkoxQmUxdk42ckFKaEhJ?=
 =?utf-8?B?RUtuUGF6MFlTTkhQUFRTVytneC9rNjdaZWNrczZ5bXoyMkVnQ3hiZ25leFdC?=
 =?utf-8?B?Zmp0NzNSMXMyUEVQSVlKR2FxRkd4RVdsM20zVDBCSWxYa1FTN29vcXVzSG1i?=
 =?utf-8?B?MUNneFdFSXRSVmxaVTNmZElpYi9aWUc5Y1ZEQ0xwdHVhNUUxa3RqVFVYSTNl?=
 =?utf-8?Q?HyWXuthq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae278fad-ad09-4b56-3d1a-08d896d9a7eb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 15:48:04.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKQ+w3gFwVSxc/9zhxyfiOpvW3QjOAwowbFNl7RsErXDphKcEbhkjpOJ6/IOgfMLvmdES8N/6XayYZ3oZT7j1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2940
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

Ck9uIDExLzExLzIwIDEwOjM0IEFNLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFdlZCwgTm92IDExLCAy
MDIwIGF0IDEwOjEzOjEzQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+PiBPbiAx
MS8xMC8yMCAxMjo1OSBQTSwgR3JlZyBLSCB3cm90ZToKPj4+IE9uIFR1ZSwgTm92IDEwLCAyMDIw
IGF0IDEyOjU0OjIxUE0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IEhpLCBi
YWNrIHRvIHRoaXMgYWZ0ZXIgYSBsb25nIGNvbnRleHQgc3dpdGNoIGZvciBzb21lIGhpZ2hlciBw
cmlvcml0eSBzdHVmZi4KPj4+Pgo+Pj4+IFNvIGhlcmUgSSB3YXMgYWJsZSBldmVudHVhbGx5IHRv
IGRyb3AgYWxsIHRoaXMgY29kZSBhbmQgdGhpcyBjaGFuZ2UgaGVyZSBodHRwczovL25hbTExLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHM6JTJGJTJGY2dpdC5mcmVl
ZGVza3RvcC5vcmclMkZ+YWdyb2R6b3YlMkZsaW51eCUyRmNvbW1pdCUyRiUzRmglM0RhbWQtc3Rh
Z2luZy1kcm0tbmV4dC1kZXZpY2UtdW5wbHVnJTI2aWQlM0Q2MTg1MmM4YTU5YjRkZDg5ZDYzNzY5
MzU1MmM3MzE3NWI5ZjJjY2Q2JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0
MGFtZC5jb20lN0M5ZmJmZWNhYzk0YTM0MGRmYjY4NDA4ZDg4NjU3MTYwOSU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MDcwNTU4OTY2NTEwNTglN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9WWU4SEpSMXZpZHBw
Y09CbmxPZ1Z1NUd3S0QyJTJCYjV6dEhiaUklMkJ1YktLVDAlM0QmYW1wO3Jlc2VydmVkPTAKPj4+
PiB3YXMgZW5vdWdoIGZvciBtZS4gU2VlbXMgbGlrZSB3aGlsZSBkZXZpY2VfcmVtb3ZlX2ZpbGUg
Y2FuIGhhbmRsZSB0aGUgdXNlCj4+Pj4gY2FzZSB3aGVyZSB0aGUgZmlsZSBhbmQgdGhlIHBhcmVu
dCBkaXJlY3RvcnkgYWxyZWFkeSBnb25lLAo+Pj4+IHN5c2ZzX3JlbW92ZV9ncm91cCBnb2VzIGRv
d24gaW4gZmxhbWVzIGluIHRoYXQgY2FzZQo+Pj4+IGR1ZSB0byBrb2JqLT5zZCBiZWluZyB1bnNl
dCBvbiBkZXZpY2UgcmVtb3ZhbC4KPj4+IEEgZHJpdmVyIHNob3VsZG4ndCBldmVyIGhhdmUgdG8g
cmVtb3ZlIGluZGl2aWR1YWwgc3lzZnMgZ3JvdXBzLCB0aGUKPj4+IGRyaXZlciBjb3JlL2J1cyBs
b2dpYyBzaG91bGQgZG8gaXQgZm9yIHRoZW0gYXV0b21hdGljYWxseS4KPj4+Cj4+PiBBbmQgd2hl
bmV2ZXIgYSBkcml2ZXIgY2FsbHMgYSBzeXNmc18qIGNhbGwsIHRoYXQncyBhIGhpbnQgdGhhdCBz
b21ldGhpbmcKPj4+IGlzIG5vdCB3b3JraW5nIHByb3Blcmx5Lgo+Pgo+Pgo+PiBEbyB5b3UgbWVh
biB0aGF0IHdoaWxlIHRoZSBkcml2ZXIgY3JlYXRlcyB0aGUgZ3JvdXBzIGFuZCBmaWxlcyBleHBs
aWNpdGx5Cj4+IGZyb20gaXQncyBkaWZmZXJlbnQgc3Vic3lzdGVtcyBpdCBzaG91bGQgbm90IGV4
cGxpY2l0bHkgcmVtb3ZlIGVhY2gKPj4gb25lIG9mIHRoZW0gYmVjYXVzZSBhbGwgb2YgdGhlbSBz
aG91bGQgYmUgcmVtb3ZlZCBhdCBvbmNlIChhbmQKPj4gcmVjdXJzaXZlbHkpIHdoZW4gdGhlIGRl
dmljZSBpcyBiZWluZyByZW1vdmVkID8KPiBJbmRpdmlkdWFsIGRyaXZlcnMgc2hvdWxkIG5ldmVy
IGFkZCBncm91cHMvZmlsZXMgaW4gc3lzZnMsIHRoZSBkcml2ZXIKPiBjb3JlIHNob3VsZCBkbyBp
dCBwcm9wZXJseSBmb3IgeW91IGlmIHlvdSBoYXZlIGV2ZXJ5dGhpbmcgc2V0IHVwCj4gcHJvcGVy
bHkuICBBbmQgeWVzLCB0aGUgZHJpdmVyIGNvcmUgd2lsbCBhdXRvbWF0aWNhbGx5IHJlbW92ZSB0
aGVtIGFzCj4gd2VsbC4KPgo+IFBsZWFzZSB1c2UgdGhlIGRlZmF1bHQgZ3JvdXBzIGF0dHJpYnV0
ZSBmb3IgeW91ciBidXMvc3Vic3lzdGVtIGFuZCB0aGlzCj4gd2lsbCBoYXBwZW4gYXV0b21hZ2lj
YWxseS4KCgpIaSBHcmVnLCBJIHRyaWVkIHlvdXIgc3VnZ2VzdGlvbiB0byBoYW5nIGFtZGdwdSdz
IHN5c2ZzCmF0dHJpYnV0ZXMgb24gZGVmYXVsdCBhdHRyaWJ1dGVzIGluIHN0cnVjdCBkZXZpY2Uu
Z3JvdXBzIGJ1dCB0dXJucyBvdXQgaXQncyBub3QgCnVzYWJsZSBzaW5jZSBieSB0aGUKdGltZSBp
IGhhdmUgYWNjZXNzIHRvIHN0cnVjdCBkZXZpY2UgZnJvbSBhbWRncHUgY29kZSBpdCBoYXMgYWxy
ZWFkeSBiZWVuIAppbml0aWFsaXplZCBieSBwY2kgY29yZQooaS5lLsKgIHBhc3QgdGhlIHBvaW50
IHdoZXJlIGRldmljZV9hZGQtPmRldmljZV9hZGRfYXR0cnMtPmRldmljZV9hZGRfZ3JvdXBzIHdp
dGggCmRldi0+Z3JvdXBzIGlzIGNhbGxlZCkKYW5kIHNvIGkgY2FuJ3QgcmVhbGx5IHVzZSBpdC4K
CldoYXQgSSBjYW4gb25seSB0aGluayBvZiB1c2luZyBpcyBjcmVhdGluZyBteSBvd24gc3RydWN0
IGF0dHJpYnV0ZV9ncm91cCAqKiAKYXJyYXkgaW4gYW1kZ3B1IHdoZXJlIEkgYWdncmVnYXRlIGFs
bAphbWRncHUgc3lzZnMgYXR0cmlidXRlcywgY2FsbCBkZXZpY2VfYWRkX2dyb3VwcyBpbiB0aGUg
ZW5kIG9mIGFtZ3B1IHBjaSBwcm9iZSAKd2l0aCB0aGF0IGFycmF5IGFuZCBvbiBkZXZpY2UgcmVt
b3ZlIGNhbGwKZGV2aWNlX3JlbW92ZV9ncm91cHMgd2l0aCB0aGUgc2FtZSBhcnJheS4KCkRvIHlv
dSBtYXliZSBoYXZlIGEgYmV0dGVyIHN1Z2dlc3Rpb24gZm9yIG1lID8KCkFuZHJleQoKCj4KPiB0
aGFua3MsCj4KPiBncmVnIGstaAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
