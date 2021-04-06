Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2F03557A4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 17:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80E76E84B;
	Tue,  6 Apr 2021 15:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7061D6E840;
 Tue,  6 Apr 2021 15:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yr1Krge+5SYy85OH71/ppimh9GuHmeJp2gw9pXPm+09SmozdQaSHpLjdDq6CPduK5CQpMrHEVOjeEa3HwKeBHdRGggfe1nhs4JnNMX4r2SGs9a/drocwzEX9pL5aWzjUmyEg3J4p1NYY2grLvIEWG8GSk5c90UvagZgoEzv7hrTfdmFZzZl0zM7A/7Yv2GHHBWeRhiowciFRFZRjfDJYKLvRsWNoY1uE9byjJErzXhHu3RAwfaszKozpaUleSiDRbMTL+iF7g2fEV0T6loYsRkBYP1EDjxwSBhgW+O6qMF65lFrEjsNexgqcMzlWBlsO/3Nmt8CJjGlnG4yhbAc3cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ah6VXy3tzC43Ylp1A26HqPkgAqDR3CVr9iugPvkI64=;
 b=n46cIIcE1ShkMhzfM8r9OBELdlfw2cucqhEAzO0PcwqzBnq1uDOkFHubVQ9PsU2EZKu7Q5qyfHoN++ZKIDU1eox4nGwJBueEN31L3PZQNTvzzn5nvukZE8NksemgWgxUKYfGn3bpOxqg+fFTM8nrCVOE9W2UM8igMe14/blThtrpahCUI6xyHVtXGh/+hjlewamxd/s0Uv+IfpA7mx2A4PTIZ798jOZ1Q5AF/HpZZUNRU9N3/P33l2SU3JPb7PSxmnVxeUWlkL+2sfVkUruhK/puKqX3L4f7KCTqeasmd2pY9SKtUSf9dkC66ZpOH8wvS5STDJKIJS8SHRAy62zozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ah6VXy3tzC43Ylp1A26HqPkgAqDR3CVr9iugPvkI64=;
 b=yamQY3BJrVCfzDc827Zs3KBVXSrXDHti1toWGo7ozEgSLjWpImFvsqSLvvF5FmE3DoMAV3re/BEgC8kiTMPkmc2dd/rleIgyHdDby5Cs7+TpVXfClg6GttuLkhVSNTQWBooEFR8mOLcLpm885SRyokBey/frM48I8zSI/pC2STo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 15:22:57 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 15:22:57 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
 <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
 <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
 <878b7bd3-ea06-679a-4553-0eb3091b02a3@suse.de>
 <4d859bdf-a0c8-34f6-2f84-c7b0f0a226b5@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <e00ad6ad-ea3e-a8d3-c888-cb9e587c510a@amd.com>
Date: Tue, 6 Apr 2021 11:22:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <4d859bdf-a0c8-34f6-2f84-c7b0f0a226b5@amd.com>
Content-Language: en-US
X-Originating-IP: [142.116.84.209]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.84.209) by
 YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 15:22:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0aa82c9-8140-4e14-f067-08d8f90fdaf2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4239B80466DB4E5B8635C5B792769@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JOM2cks2Y1n7iggquvOR1yLF1qgETgTpXjfHzZM4LnGCcjhffnxWo0ogdBI3kUKZNIHAXMZ5CLBFN2Bx8Gg+K5eBMU45K8DlsD0SYgsDJsAmz2UG6Bwqw8LZ6MrJazkYFlS6GVrHxB1yeNAOVQsXcHvp68DTPMYa9FvMqrlNBd8Q4uXEgN/iZZ4CpfcBqU+V2bgGasi3ttYGs4GLCU9Z3cf/vYrUTLzq81ZP0cu3iM2eeetBO1HQ+gUvr6PYBQPtkVHBgcUNyd+Y4X3ekprK7vD/rT/RLwJ66Dr8Wc0Un/ZwgJh0inhPAT1A8YQ57pFJ/kEpr4mQ2SEpTmnx0eBO3W3E98+POgS+nZQ6eIDg07u99ywQFf07afwvcb+bivW/1+lmsaTJvxVLMbSuhgO2WgbDT4ZTJ5GyMonYLtv+7pR1Yg1N5JVk5lAhxqRRV/qv1ukexjfZm/2lMeqZYNuwwWZSmU54e3KXwmZyhH2+ahtbEY6YY2c3FJl/QaXIWxozu3iYv4E4wFoNfLlCioPbrVqIhSdkVuricPJDrBG+5rLfVdmS5CDKQdlYwypfmJ3LdWzxQfx6rrdl+gmFSAhII47SeN5UeEWex4FUyZEsO7Weiw0yYnArd175maVo0kyxmxgLDSDZsyxHaEcVCeJbjLt58j0gCegrBa09EDbIQOxksyDRqxWYTF8uxDmXbqFEc1yHNwYOiSoJUKsU9IJM2FvOp3Tspt5/5+d9MQ340Y0Z8MJGPNLKxoMXbcC0H2K/7EU26INgsXlmCL5k5ioJNLNPQhVePI78q86JwVAVk/jMvh/kz4a4dUKPd5IkjK8q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(346002)(39860400002)(376002)(66946007)(66476007)(26005)(66556008)(7416002)(31686004)(16576012)(38100700001)(16526019)(4326008)(921005)(966005)(956004)(2616005)(31696002)(110136005)(8936002)(36756003)(8676002)(6636002)(186003)(86362001)(83380400001)(6486002)(44832011)(478600001)(2906002)(5660300002)(6666004)(316002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWJweG5UMTF6SnQ1ekFiWDlSV3JJcWoxMW4vQit2cDF0TUhJdnVZVit2Skkz?=
 =?utf-8?B?cjdBaXZtL3hVUVNHQTdBZldTWHNUUXZlU3duWlMwZUVyNHMwTzRHVkc4UU5U?=
 =?utf-8?B?dCsySnMvazdIR1ZGTU50WHJ4N1hRVi9acEd2RnZHeTJUc29DWDdiVGljZWdo?=
 =?utf-8?B?bXZCSnM3UU8xV015QVdvczZTcGFPaG0raXhVNG11N2ZCeUtSTlVsWWFVWjBy?=
 =?utf-8?B?VmZaRHpsbGQrdk45d0Jmc0ttbUI5SlpmUEIvdnFkQjI4bHNDZVBxM1pmUE1J?=
 =?utf-8?B?UzZTcCtEZExxOW5acGdGMzYzb0lLS2JNanVFR1gxb0g2b2FWTnFjMGFmUy9H?=
 =?utf-8?B?NVBtaTB3QnhqSjY5djMvWlZ1TDRRVUUraFJ2MjFZR0hhdUphS1c5a0tURW5n?=
 =?utf-8?B?QXMrOXgyY2E3b2JoU3N1UWppNEtiZDFIZFV2MVprS3d1THJhenE2anFIc0M4?=
 =?utf-8?B?MVdtRmtJZlhyY0pYNURjS1dWTjVVM21zKzJaWHBia21mZmtTYjFYMjdqbysw?=
 =?utf-8?B?S3NqMVByTU9VY0xrb0xVcVNxQzFRTEdHSGpSSGMyZCtlT1dzVVVUbDlxQkUr?=
 =?utf-8?B?amR0a0ZuUXhGL0tDalRYNmtDbDI1Z3dIYThNT28vSjNMUFUwUTlBTlFNTzZF?=
 =?utf-8?B?YmdRaHVvTW44ZjlWTkpQV09PRlJuQUI5T0FTSzdmVVFPY2cxdVQyRTRyR2Yy?=
 =?utf-8?B?QjFwWHQ2WlhYVG9WRDl0R25xVkxaUmgvaHJ2YjJGdUZoV09yWVl1MGg3cm1L?=
 =?utf-8?B?Tlh6UTNGY1RrcHJhYUVQamxxc2Z2MjVuRko3NlUwN3VzWDN6NzRoQ0VHN05J?=
 =?utf-8?B?Tk1uTUp2TDVTL2l0ZXhxdXc0emFDTjBWUFNpdWhWTFpaNXJydjN4NmUzWTBy?=
 =?utf-8?B?ZW4rVExobS9iLzY5UERuTVpKL2ZHeWU2ZFVMQWxKeHp3NGFtYWVnbjJhb0o2?=
 =?utf-8?B?U1dVN0Q0cWZBZ0VUbkhIL3l5b3JkRG1EWUt1cUI4QjUwL1RaM2JBRFhLc1lm?=
 =?utf-8?B?dmxGNmhmMEtYSFNXM2EwWmpWZnNURkRlUDMwazZQdDkzSVExamdzaXlNdDhs?=
 =?utf-8?B?MVlGUGxSMTNUSHNWWjRUbDMyRkNhdVZmcWVwZ21JcHJqV0NGL1NvaVRDUDZ4?=
 =?utf-8?B?V1cyaWZFTkwrM095UVN0M1J5ckRwdTkxelJCTCtlVXRvc3ZTRHZyOFpLRTVR?=
 =?utf-8?B?WUFTSWFVS0VWRVZBelRsTk1OV29talEwb1RIaEdGYWVCdUlqR1VDRmhtK3JL?=
 =?utf-8?B?M2hBUUVQTDBSTmY5cnRHYkNjdk4vSXkxdmFScGlNK2kzOXMvSWlUU2Y0bnZD?=
 =?utf-8?B?OElNS0xYb2xDb2Q0ZXQ4ZTNhYTZhNm1vU1l5VXU4UjJJUXAwV292QkhkZ0FU?=
 =?utf-8?B?UjVYdXNZNUtLQURJUmZySE1meS9xY1ZkQ1YxRW1WRnFlL09IM01seEd4L0Y3?=
 =?utf-8?B?bWFxdE5WZm9XRVZzRU5HeGsyL29lZGpSRjh4aFlGMjVTZy9zMW9sUkorUTZq?=
 =?utf-8?B?T2drVkZuK2pxU3ZIMFh4YzlZTmZGcFAyTEVVTjhiUUFjSlM5Q0llWFd1Mkg1?=
 =?utf-8?B?UTVhcXp5UGoxclRDYVZjckhtblhhcndZWnJvOENDbytaNjJNUFE3TkhkY2ZN?=
 =?utf-8?B?NndrYUZUU3NRa1Z0M2g5UlZnS3dxai9SbGVnT0YzMjRJRzh6ZDE1dlpMR2lR?=
 =?utf-8?B?cU9EbzNHNStybDRjOWVqVmxJa0lIUXhkZmxDU1N6ZVh5dGk3cGhtTFhpbUJZ?=
 =?utf-8?Q?17LM6f2VdKdTUeItwsOg1bpyFVYQnoqrMioYJSB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0aa82c9-8140-4e14-f067-08d8f90fdaf2
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 15:22:57.4488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62fgBXEUN8bVziKW9YO4TNHp7YJS7/rrxwi3Js8s22HVoJ5gDcVNFPWlQZy449decdub/YyTX/oW2vwGylH53A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0wNiB1bSA5OjA0IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDA2LjA0LjIxIHVtIDE0OjUyIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+IEhpCj4+Cj4+
IEFtIDA2LjA0LjIxIHVtIDE0OjQyIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IEhpIFRo
b21hcywKPj4+Cj4+PiBBbSAwNi4wNC4yMSB1bSAxMzo1NSBzY2hyaWViIFRob21hcyBaaW1tZXJt
YW5uOgo+Pj4+IEhpCj4+Pj4KPj4+PiBBbSAwNi4wNC4yMSB1bSAxMjo1NiBzY2hyaWViIENocmlz
dGlhbiBLw7ZuaWc6Cj4+Pj4+Pgo+Pj4+Pj4gSW4gdGhlIGVuZCBJIHdlbnQgd2l0aCB0aGUgc2Vt
YW50aWNzIEkgZm91bmQgaW4gYW1kZ3B1X21tYXAoKSBhbmQKPj4+Pj4+IGhhbmRsZWQgS0ZEIHNw
ZWNpYWxseS4gTGV0IG1lIGtub3cgaWYgdGhpcyByZXF1aXJlcyB0byBiZSBjaGFuZ2VkLgo+Pj4+
Pgo+Pj4+PiBXZWxsIHRoZSBxdWVzdGlvbiBpcyB3aGVyZSBpcyB0aGUgY2FsbCB0bwo+Pj4+PiBk
cm1fdm1hX25vZGVfdmVyaWZ5X2FjY2VzcygpIG5vdz8gQ2F1c2UgdGhhdCBuZWVkcyB0byBiZSBz
a2lwcGVkCj4+Pj4+IGZvciBLRkQgQk9zLgo+Pj4+Cj4+Pj4gSSBzZWUuIEl0J3Mgbm93IGRybV92
bWFfbm9kZV9pc19hbGxvd2VkKCk7IGNhbGxlZCBieQo+Pj4+IGRybV9nZW1fbW1hcCgpLiBbMV0g
U28gZHJtX2dlbV9tbWFwKCkgY2Fubm90IGJlIHVzZWQgYnkgYW1kZ3B1Lgo+Pj4+Cj4+Pj4gSWYg
SSB1bmRlcnN0YW5kIHRoZSBjb2RlIGF0IFsyXSBjb3JyZWN0bHksIEtGRCBvYmplY3RzIGRvbid0
IHVzZQo+Pj4+IHRoZSBHRU0gaW9jdGwgaW50ZXJmYWNlcywgYnV0IHRoZXkgc3RpbGwgdXNlIHRo
ZSBpbnRlcm5hbCBHRU0KPj4+PiBvYmplY3QgdGhhdCBpcyBwYXJ0IG9mIHRoZSBUVE0gQk8uIElu
IHRoaXMgY2FzZSwgYW1kZ3B1IGNvdWxkIGhhdmUKPj4+PiBpdHMgb3duIHZlcnNpb24gb2YgZHJt
X2dlbV9tbWFwKCksIHdoaWNoIGNhbGxzIGRybV9nZW1fbW1hcF9vYmooKSwKPj4+PiBbM10gd2hp
Y2ggaW4gdHVybiBoYW5kbGVzIHRoZSBtbWFwIGRldGFpbHMgdmlhIEdFTSBvYmplY3QgZnVuY3Rp
b25zLgo+Pj4KPj4+IENvcnJlY3QsIHdlbGwgd2UgY291bGQgY2xlYW51cCB0aGUgS0ZEIHRvIHVz
ZSB0aGUgR0VNIGZ1bmN0aW9ucyBhcwo+Pj4gd2VsbC4KPj4KPj4gVGhlIEtGRCBjb2RlIGFscmVh
ZHkgY2FsbHMgYW1kZ3B1X2dlbV9vYmplY3RfY3JlYXRlKCkuIEl0IHNob3VsZCBoYXZlCj4+IHRo
ZSBvYmplY3QtZnVuY3Rpb25zIHBvaW50ZXIgc2V0IGZvciB1c2Ugd2l0aCBtbWFwLiBOb3Qgc3Vy
ZSB3aGF0IHRoZQo+PiB1c2Ugb2YgZHJtX3ZtYV9ub2RlX2lzX2FsbG93ZWQoKSB3b3VsZCBpbnZv
bHZlLgo+Cj4gVGhlIEtGRCBhbGxvd3MgQk9zIHRvIGJlIG1tYXBlZCB3aXRoIGRpZmZlcmVudCBv
ZmZzZXRzIHRoYW4gd2hhdCdzCj4gdXNlZCBpbiB0aGUgRFJNIG5vZGUuCj4KPiBTbyBkcm1fdm1h
X25vZGVfaXNfYWxsb3dlZCgpIHdvdWxkIHJldHVybiBmYWxzZSBhcyBmYXIgYXMgSSBrbm93LgoK
V2UgdXNlZCB0byBtbWFwIEtGRCBCT3MgdGhyb3VnaCB0aGUgL2Rldi9rZmQgZmlsZSBkZXNjcmlw
dG9yLiBXZSBtb3ZlZAp0aGF0IHRvIHVzaW5nIHRoZSAvZGV2L2RyaS9yZW5kZXJEKiBmaWxlIGRl
c2NyaXB0b3JzIGEgbG9uZyB0aW1lIGFnby4gSWYKdGhlcmUgaXMgc29tZSBLRkQgc3BlY2lhbCBj
YXNpbmcgbGVmdCBpbiB0aGUgY29kZSBmb3IgQk8gbW1hcCwgaXQncwpwcm9iYWJseSBhbiBvdmVy
c2lnaHQgYW5kIHdlIHNob3VsZCBiZSBhYmxlIHRvIHJlbW92ZSBpdC4KCldlIHN0aWxsIGhhdmUg
YSBmZXcgc3BlY2lhbCBtbWFwcyBpbiAvZGV2L2tmZCwgYnV0IHRoZXkgYXJlIGZvciB0aGluZ3MK
dGhhdCBkb24ndCBpbnZvbHZlIEdFTSBCT3MgdGhhdCBjb3VsZCBiZSBtbWFwcGVkIHRocm91Z2gg
dGhlIHJlbmRlcgpub2RlOiBkb29yYmVsbHMsIE1NSU8gcGFnZXMgYW5kIENXU1IgdHJhcC1oYW5k
bGVyIG1hcHBpbmdzIGZvciBBUFVzLgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+Cj4gUmVnYXJkcywK
PiBDaHJpc3RpYW4uCj4KPj4KPj4gQmVzdCByZWdhcmRzCj4+IFRob21hcwo+Pgo+Pj4KPj4+IEZl
bGl4IHdoYXQgZXhhY3RseSB3YXMgeW91ciBvYmplY3Rpb25zIHRvIHVzaW5nIHRoaXM/Cj4+Pgo+
Pj4gUmVnYXJkcywKPj4+IENocmlzdGlhbi4KPj4+Cj4+Pj4KPj4+PiBkcm1fZ2VtX3ByaW1lX21t
YXAoKSBkb2Vzbid0IGRvIGFueSBhZGRpdGlvbmFsIHZlcmlmaWNhdGlvbi4KPj4+Pgo+Pj4+IEJl
c3QgcmVnYXJkcwo+Pj4+IFRob21hcwo+Pj4+Cj4+Pj4gWzFdCj4+Pj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjUuMTEuMTEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2Vt
LmMjTDExNTYKPj4+Pgo+Pj4+IFsyXQo+Pj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y1LjExLjExL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMjTDEyMjQKPj4+Pgo+Pj4+IFszXQo+Pj4+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y1LjEyLXJjNi9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyNM
MTA1Mwo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+PiBUaG9tYXMKPj4+Pj4+Cj4+
Pj4+Pj4+IC0KPj4+Pj4+Pj4gwqAgaW50IGFtZGdwdV9jb3B5X2J1ZmZlcihzdHJ1Y3QgYW1kZ3B1
X3JpbmcgKnJpbmcsIHVpbnQ2NF90Cj4+Pj4+Pj4+IHNyY19vZmZzZXQsCj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGRzdF9vZmZzZXQsIHVpbnQzMl90
IGJ5dGVfY291bnQsCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkbWFfcmVzdiAqcmVzdiwKPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uaAo+Pj4+Pj4+PiBpbmRleCBkZWMwZGI4YjBiMTMuLjZlNTFmYWFk
NzM3MSAxMDA2NDQKPj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5oCj4+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uaAo+Pj4+Pj4+PiBAQCAtMTQ2LDcgKzE0Niw2IEBAIGludCBhbWRncHVfZmlsbF9idWZm
ZXIoc3RydWN0IGFtZGdwdV9ibyAqYm8sCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlKTsKPj4+Pj4+Pj4gLWludCBhbWRncHVfbW1h
cChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+Pj4+Pj4+
PiDCoCBpbnQgYW1kZ3B1X3R0bV9hbGxvY19nYXJ0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pOwo+Pj4+Pj4+PiDCoCBpbnQgYW1kZ3B1X3R0bV9yZWNvdmVyX2dhcnQoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICp0Ym8pOwo+Pj4+Pj4+PiDCoCB1aW50NjRfdCBhbWRncHVfdHRtX2RvbWFp
bl9zdGFydChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4+Pj4+Pj4gdWludDMyX3QgdHlw
ZSk7Cj4+Pj4+Pj4KPj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+Pj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+Pj4+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPj4+Pj4+Cj4+Pj4+Cj4+Pj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IGRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKPj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo+Pj4+Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCj4+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
