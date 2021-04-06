Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1DE355419
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 14:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4E66E226;
	Tue,  6 Apr 2021 12:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D59A6E226;
 Tue,  6 Apr 2021 12:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyQLk6g2O4M7TuLTvycUbjmSKATde2ZZ01IA1O847InBTtHwrAWVcDfhYgJ2jQf1s4JKHnJvEhW+zrgktlTf5CmTxDojeSaGHGERJJFgZGDL2j61LFq4soisu8GNkMqive+ufgrl0G8A/MO17Fa1PqUBa6tIcinpSi9YR+kn6CYsFETGex5itcQPt+vxNfxkrKPQ+3q9QN1ldoYuAFLCUVGO5VFwFGboBw9oR5jc/Ndrb5h0IlOcIiD0u3W6xs1Dex6gR+4vMSHHfPvy7sl07/8WReXsRIjb2gZ/D96UUtBrHcBVha5BVsEkwNvFwmvW7zSBZdIBmgIken3cauHKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh7gn454JRUF4NSFKoTGirWxjoCNwtONsWA4BxYIVbA=;
 b=KsI7uFSrRA4XZevWBUwMojiSZaj0wCmtlymG+CpyLoQzH/ovvUEloVe3S3doVLwpbPpAafTazzvOXwtZs6bHa3TGjE3OWbkjeG0uS2r0tzO+dS8iulzhQuNQFZSG8blo7GGWntgEFE3Cvah6WLV22If85zaPmlpVi/T5XwLZRfO0fggk0maKHcHRsPXR5MPvcYgOuoyzM944JAL83vccBVxRzixJ7PfK/Rpfz3HSCggEaDJpFvzR5WfNJ8uiJmXreCdHQ6YHu/1xM39g9vtPRef6uPLp2HtTADFK7b/mwksmSsmTmqKqWBiBsrjmH0YrsHO6KRgUql7CABTika9FLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kh7gn454JRUF4NSFKoTGirWxjoCNwtONsWA4BxYIVbA=;
 b=rFMxwBrqkeNINGvUZxc2KGpjL4BJmsK2WHXydgkH35pzhu5CWig7aTy8S1y31iSF47xykqz223My39smd2EsOhF7jBmEB8ik5eTmOQ6bShAO80ZVVU/iHwnW4XTrsHFri51t+2KFPaleAqlHQfEuHMnPuc2qU2ozsKAFVD4ZPxE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 6 Apr
 2021 12:42:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 12:42:06 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
 <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
Date: Tue, 6 Apr 2021 14:42:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b166:1569:a6c7:85bf]
X-ClientProxiedBy: FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b166:1569:a6c7:85bf]
 (2a02:908:1252:fb60:b166:1569:a6c7:85bf) by
 FR0P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.10 via Frontend Transport; Tue, 6 Apr 2021 12:42:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a92b6da-b726-4678-40ef-08d8f8f962b9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4342381C6810DF3BEB990CDF83769@MN2PR12MB4342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffvN2wK5MeepDmtljn5YXByYEZLrxpMaCfIUjZtjpEND7vp/4MvoOE+3Sl/BmKCyrMm3+Atzrn4ZXvYIxK20eB/ozYHSLamTVeXVU412k0gnIucMcUfu/uQS8kD4KRpSG4gOVSi32VfiZaBkgBwEWIuqUN0f3DWG/XZ3g0HD5jnIfIKttYpil8kn2rjdHk/bshUF43rfkjbrqtRAl/7DW91reK0WtcoYcstQSdwz86w6wx1+WD/Lh7lLTeW26j74wtynQmh3xQIUtxkpJe2zyQu5FLfX5MG6tSWzY3vL6gICMc5Y3Ucox4+vwFHs6NzLqJIUZwj2r79poJHpjBKzu43G/pQ9L+MRwMVfdfc3eUuDqK2ztabLTpN0KKzQKqflQqd+TFv0DZC6amPOfpMNE46dJD1S2yOXaO8Vt5izlVmMYhsWMfiSKpKveJFxzV+/nCEV+uRIeKUxSUfibKYRJGoe3VMstDQcbXfh9JZ2gZMqG21PLUARiZHFR5aeGtYNf6lFqNqTF2yRC8P9yd5Za/E+b4kIly6oRY+hMoBd7F+SVAtN98t/irIMjg2f0AZCja9yPKdlAdH4nCYDJRMgzeZ5jJpON05iXm8kWjICu0XzpjPLv3uZXKNgc3gApQ2szDSywwtHfbtfYcUSBeg6py34Xv2hKZUJp6aBYA/itAN42pJw47+pk0X1d9detOeZX07vMvgdwOusAycb7uj4Btg4Xm0/RR1mTqiojGFV80bhBIswQ15hoTV9a7dBLMdkPE9O5qASio5WCYW/mG5jaNRoAqcT2xeeYGRyUsNn84qVA+RvS2KsrBN44dC/o4Y0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(366004)(396003)(316002)(186003)(478600001)(110136005)(5660300002)(31696002)(966005)(16526019)(6486002)(7416002)(31686004)(4326008)(8676002)(38100700001)(66574015)(8936002)(2616005)(83380400001)(52116002)(86362001)(2906002)(66556008)(66946007)(66476007)(36756003)(921005)(6636002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bzl3RVJvZ2JxSCtZN2Q4ZFViNHZnRndhd3RXYzBwUEpiMGwvdjRkam8yb3Ax?=
 =?utf-8?B?b2FsWEkwbklqeHgybThrM24yQnNSaXpEcTR0dUdqNDArT3g5YklWTnc0U2E4?=
 =?utf-8?B?SkF5T0lMN2U5a1hoVy9YT2ttREovOUlrM3JpVEpsQVRKc0hTTnl0Sm9HSFhL?=
 =?utf-8?B?NHVuU29yYlc3VG9IUUhrZnE1MS9VOWE5ZDJ0OHFZMXpFaWw4bFRGQTVSQ3FI?=
 =?utf-8?B?cnlMRFBvZ0svcE0vQXhDVnlic0Vuby9wZjdEb2xad0hobGxiQUZHUlk0Sk5r?=
 =?utf-8?B?eE5vRDN2bmVNREJjTURtWGpsTGpWSndIeU9tbFFEUDMxTkRwTnczSDk0RWFh?=
 =?utf-8?B?ZjhkKzdQVERLQnVNQXFpWFlyYlg1YVEwQlNLbzhoZm1zN0hpT2kyTExyWU5s?=
 =?utf-8?B?dkN4bm8zRDYxQi9hVVQ4aWk4TWk4R3YzeUt2MG9aZUdVaGZmL1hLeVZhVmV2?=
 =?utf-8?B?eU9rcjMyblg2YTZ1em04VE5hMmVtNG5PNEg2c1I2NDYrVTdvM2MyTFhZRmRT?=
 =?utf-8?B?dndhZnJySUNnOHRoZ2sydXVoSE1CS0t5aEkvU3YyK3pQT1NyZWcwbTJSSmM2?=
 =?utf-8?B?ekUrWXA3TytMZlZwQ1Q2YWVXbGJZYlRJSXN0VW1GU0R6M1g0N1dVOTlQeFFl?=
 =?utf-8?B?cHZYeXhZVkIzYnNxcXZpcCtWS3hEZGJWcGtnVm5WT0FHK3NoWTRtRS9QY1NL?=
 =?utf-8?B?RC9SekZQYkllWGtTcXg1bHdsaEgwNWtHaUVqdElWYzJzM21mZTQydFAwWFNw?=
 =?utf-8?B?Rm9RMjJLTUlzcmxwZ2VUTlZ1U0VmNDE3a3hoR09JY1B1NHVlSVp0TUk4ZGtP?=
 =?utf-8?B?R2dpSEZ5aU5jYzZyM3BwdTY3MlZvN2RLUE4rQzhDbjFqUlpIL2g5eVpDU1ZF?=
 =?utf-8?B?aCtGMHptTlNHTTR2dXgzUDhpS3RTU2ZDcmUwV2RVWHpuaTgwVWNRZndOSTBN?=
 =?utf-8?B?aVhKSllkQUdQZXFnbjZMUkY1ekxISm8wSmVKNktwbFRLQlVaNy9pRTVXUVFt?=
 =?utf-8?B?YWx3ZDJOYUZTZlptbEpQaWRaZktyUlpwZGZPbFp2UlJEV3F3N2toelp4Qmc2?=
 =?utf-8?B?VGpFcFVhbTlVLzFPZnMzTDlNSTJIem91Z1pjWWFEanRJSXJzZ0J4MmQycmo5?=
 =?utf-8?B?QjFCSmZYZHY5bUl2TnVNbnRNb1dCZlZTekZSZUJWMFpsTk90bnYrdTQ0MDgz?=
 =?utf-8?B?czZWOUJYMWRpOVpTQ1kzT3pxeEtHTW50VVVCKzB2V29xb2ZkOEFlU2lZbUV6?=
 =?utf-8?B?Z0hEWEVkd1ppUzZGcEtlYzBFdzZBVXRta2VNOURpUDlDUTNnWjV3K25NdzFJ?=
 =?utf-8?B?eFMwbUhKT25TTGsvOUJEMzRCeW5pVXMzSFF3TFpRU05yamFvZ3dxT2NkS3BD?=
 =?utf-8?B?MXp2OEtzZy80WkU1Wlc2dy9uSms0WWp3WDJZRUo1S0JGeHpDenhmS2NyeTRH?=
 =?utf-8?B?YndOUWl6dlRlUjV6ZVREV1l4R0paTUcwMEFya095VWlRQlVHZFVObmI0UWVL?=
 =?utf-8?B?alNRbmtqN2g1MVBIWWpwbW00c25mUkZKZ3g2bzdZUFJ2SGxCbkFrL0ltbkxt?=
 =?utf-8?B?Q3ZmdHpvK3pXU1BhNUE0LzRwcTM5Z1BPS29BTzVCUG80TWJxUU8rN3ZEeldI?=
 =?utf-8?B?RnFwMldOLzZweTdoa2VBTFl5alphTHhVZWlnRnRxYkJjbmhESzh2YjY1Tm9n?=
 =?utf-8?B?ZDNkVWZ5cWpDZFg4WFpoczFTYXNWbktZTFhDcUJoOGVhQXNtTUtnNWRJdjFW?=
 =?utf-8?B?RUdvV3U1bE83Zmw5VUZWTkpQa0I5SnRpdjdRTkZBYllLNXBPdzROYVAvOTYr?=
 =?utf-8?B?WTJvZzVaeVFrWXVqc0M5M09ZTk9scU5yNmJkdDFQVFM0VHBkT1FDUE5oaXZj?=
 =?utf-8?Q?0/YmzNgtn1NAW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a92b6da-b726-4678-40ef-08d8f8f962b9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 12:42:06.2296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFxq1WDfUg2LOfYzvqoKZGwQPbtfhqN2djL5773oZihD7t2w6YRCCjIBpuzua2QG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4342
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKQW0gMDYuMDQuMjEgdW0gMTM6NTUgc2NocmllYiBUaG9tYXMgWmltbWVybWFu
bjoKPiBIaQo+Cj4gQW0gMDYuMDQuMjEgdW0gMTI6NTYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmln
Ogo+Pj4KPj4+IEluIHRoZSBlbmQgSSB3ZW50IHdpdGggdGhlIHNlbWFudGljcyBJIGZvdW5kIGlu
IGFtZGdwdV9tbWFwKCkgYW5kIAo+Pj4gaGFuZGxlZCBLRkQgc3BlY2lhbGx5LiBMZXQgbWUga25v
dyBpZiB0aGlzIHJlcXVpcmVzIHRvIGJlIGNoYW5nZWQuCj4+Cj4+IFdlbGwgdGhlIHF1ZXN0aW9u
IGlzIHdoZXJlIGlzIHRoZSBjYWxsIHRvIAo+PiBkcm1fdm1hX25vZGVfdmVyaWZ5X2FjY2Vzcygp
IG5vdz8gQ2F1c2UgdGhhdCBuZWVkcyB0byBiZSBza2lwcGVkIGZvciAKPj4gS0ZEIEJPcy4KPgo+
IEkgc2VlLiBJdCdzIG5vdyBkcm1fdm1hX25vZGVfaXNfYWxsb3dlZCgpOyBjYWxsZWQgYnkgZHJt
X2dlbV9tbWFwKCkuIAo+IFsxXSBTbyBkcm1fZ2VtX21tYXAoKSBjYW5ub3QgYmUgdXNlZCBieSBh
bWRncHUuCj4KPiBJZiBJIHVuZGVyc3RhbmQgdGhlIGNvZGUgYXQgWzJdIGNvcnJlY3RseSwgS0ZE
IG9iamVjdHMgZG9uJ3QgdXNlIHRoZSAKPiBHRU0gaW9jdGwgaW50ZXJmYWNlcywgYnV0IHRoZXkg
c3RpbGwgdXNlIHRoZSBpbnRlcm5hbCBHRU0gb2JqZWN0IHRoYXQgCj4gaXMgcGFydCBvZiB0aGUg
VFRNIEJPLiBJbiB0aGlzIGNhc2UsIGFtZGdwdSBjb3VsZCBoYXZlIGl0cyBvd24gdmVyc2lvbiAK
PiBvZiBkcm1fZ2VtX21tYXAoKSwgd2hpY2ggY2FsbHMgZHJtX2dlbV9tbWFwX29iaigpLCBbM10g
d2hpY2ggaW4gdHVybiAKPiBoYW5kbGVzIHRoZSBtbWFwIGRldGFpbHMgdmlhIEdFTSBvYmplY3Qg
ZnVuY3Rpb25zLgoKQ29ycmVjdCwgd2VsbCB3ZSBjb3VsZCBjbGVhbnVwIHRoZSBLRkQgdG8gdXNl
IHRoZSBHRU0gZnVuY3Rpb25zIGFzIHdlbGwuCgpGZWxpeCB3aGF0IGV4YWN0bHkgd2FzIHlvdXIg
b2JqZWN0aW9ucyB0byB1c2luZyB0aGlzPwoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IGRybV9n
ZW1fcHJpbWVfbW1hcCgpIGRvZXNuJ3QgZG8gYW55IGFkZGl0aW9uYWwgdmVyaWZpY2F0aW9uLgo+
Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiBbMV0gCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxp
bi5jb20vbGludXgvdjUuMTEuMTEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMjTDEx
NTYKPiBbMl0gCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTEuMTEvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyNMMTIy
NAo+IFszXSAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMi1yYzYvc291
cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMjTDEwNTMKPgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+
IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMKPj4+IFRob21hcwo+Pj4KPj4+Pj4g
LQo+Pj4+PiDCoCBpbnQgYW1kZ3B1X2NvcHlfYnVmZmVyKHN0cnVjdCBhbWRncHVfcmluZyAqcmlu
ZywgdWludDY0X3QgCj4+Pj4+IHNyY19vZmZzZXQsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVpbnQ2NF90IGRzdF9vZmZzZXQsIHVpbnQzMl90IGJ5dGVfY291bnQsCj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfcmVzdiAqcmVz
diwKPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uaCAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKPj4+
Pj4gaW5kZXggZGVjMGRiOGIwYjEzLi42ZTUxZmFhZDczNzEgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmgKPj4+Pj4gQEAgLTE0Niw3ICsxNDYsNiBA
QCBpbnQgYW1kZ3B1X2ZpbGxfYnVmZmVyKHN0cnVjdCBhbWRncHVfYm8gKmJvLAo+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX3Jlc3YgKnJlc3YsCj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5jZSk7Cj4+Pj4+IC1p
bnQgYW1kZ3B1X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hKTsKPj4+Pj4gwqAgaW50IGFtZGdwdV90dG1fYWxsb2NfZ2FydChzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvKTsKPj4+Pj4gwqAgaW50IGFtZGdwdV90dG1fcmVjb3Zlcl9nYXJ0KHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKTsKPj4+Pj4gwqAgdWludDY0X3QgYW1kZ3B1X3R0bV9k
b21haW5fc3RhcnQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIAo+Pj4+PiB1aW50MzJfdCB0
eXBlKTsKPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo+Pj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
