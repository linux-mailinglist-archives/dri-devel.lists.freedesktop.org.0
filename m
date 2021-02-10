Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440173172CC
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 23:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5F6ED08;
	Wed, 10 Feb 2021 22:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2257C6ED02;
 Wed, 10 Feb 2021 22:01:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgcW1sR6hFrYCIdBvQEAO2H3JlGiUCVZUUMCzmyaobUGuzjgaYeY8kUd9pmjN2ltWijqpOvY1k8Dn+c17d13eQWJvaicgKL2O7cVepN2z0LGyTMt5Qc68aR3pMWDcR/ncjwE6qQWUeqRFAT92IWTHDanssRfK+MoKO2EKHtZ5vcQMnBjTGNb1ecsf6Mt313VofvdpDedao4xiviI1awpa4mPUXamQYTkikSTDTPWyfYjASVj6IPjAc9o6MactPIAMuiRKUBw4RNC3SuHdqQuIiyI/I0Y7ImJUB1hj6UBS3zWUGu3If0Q76l2I1olNQJgSa00hcGy+m8L70DM1Own0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5wPyHnTT0+MzbHrTbenBVlfLOgdQd1AQyzsTT3bbyo=;
 b=noJlLsFZ96fsjC2VLdSDw3edr792LDgJfqnbEL65Qo5Z62ISbG6vNdhvSlJvJuF+DUxRHN5fgWGVimBT/+FPEPeoNt/xaI8a2df1z8UYlUAxi404ZvK9BiUW+E9nWxYcuuGxgXHfKz2Dclh8JcVgTsiHJUMq1Z88JRQ68em0SHKQ4gFrN36W3f4nMnw8ivsjbA+E9+41NuL7sDHlzr2WtsAmHXKVIeREp5iqLor2C0Xt9Ze883abyfOA6v5h0JMBkGi3mpfTN6q2TNZLtF1IHuHveRHQTheZc+Q7RmXNcVtnXFO4WGp9cEB3rz4n2WEHw4c3K7/K/tyGORpv+K3LvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5wPyHnTT0+MzbHrTbenBVlfLOgdQd1AQyzsTT3bbyo=;
 b=ukuZ5BFfaUcPBkfv5oWqeyBA2hUz2ZQjGAEnMzYfgDSJ1SZiDziGMFFm0yZMZ7gRS/RNZmJ3G/CG9rH/ilSh8ga4HQYxK39XFrJAogFFIZ0eN/sPM+i1twDjNamGHdD92kokl10YkvMINzaRlH24o6NaQv3hV9jMM3SiRhBda3k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 22:01:39 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Wed, 10 Feb 2021
 22:01:39 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
 <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
 <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
 <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
 <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
 <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
 <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
 <da7b71c6-5045-5a52-2ec6-504d0bfb6761@amd.com>
 <28c0f887-2f9d-2964-77ef-e56b3e0a8482@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7cbc510e-275c-5747-32d0-ce6a5f531cfe@amd.com>
Date: Wed, 10 Feb 2021 17:01:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <28c0f887-2f9d-2964-77ef-e56b3e0a8482@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:4a16:3c68:8c12:dde]
X-ClientProxiedBy: YT2PR01CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::9) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:4a16:3c68:8c12:dde]
 (2607:fea8:3edf:49b0:4a16:3c68:8c12:dde) by
 YT2PR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.27 via Frontend Transport; Wed, 10 Feb 2021 22:01:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 64e55ea8-7a8d-47ab-37d3-08d8ce0f7158
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB457654A2A5F1E3C9DBBA9C26EA8D9@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DuwdkFu6zHfR1O5u1sDBJnfRwXPhbnxdMlAjJUqViblp2gKGe3JJyU/LF8/rUpchwhzWA9askSSurPoMcBMPExdUSCuNzB7fFkChTadD9NE2ovfriCLpQuc6VK8AEIFhrkxpfgwBOvOhezXtfCsCG7mRizRh4OPcUkPxuAtRTaDt5JRYqgu2cN8O4WX8JY5J4oCY0fN/d7mVycOgx1SOzRes4JEy6z64uwHoKP8Le361Z3djzJsvLZ7uvLaFgi0l4Vsy3mQVXVX+Xrrbhtkk3mb16fUMUvmVh/WgOL+gULW1lrBwy6TI8OR46wfoeoYMrI+/kYC1teZVOaAy1DoMfZHT/dV2GJPbOAFWqKKGMac5NJEhLRKb+QYeOTARaWAmIHbb1c9/abG8ARyUA7Eo7fv51JUC+t8MjTkvUKG2i0AgxLDRvnw/DgPTMlh1BZHhjzeygSPISA0clXoHLmGwKyQhSxy00a85f9tR1VBYd7vKJt1K/iYqxGFYRoUzye0sNnhpJWia8Mxy1Y37SXuNLfvalcQ5fO6hYVByVdf9w7/T4BH9aQWSQoYYq/O8OVjQqfGI7Go/qwSQtBE5FJHnv7lZwykWeM12RTou8F3DR/SkPebRQToWWqxtgb3rHJ2ScBU6+KD1erLQbxkyE5Pl26kf8C3Ye/bKQ5i/z0xry9jCYN56A6KZRpR1jOKwQRY8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(966005)(83380400001)(2616005)(66556008)(52116002)(54906003)(110136005)(66574015)(186003)(6486002)(66946007)(66476007)(2906002)(31686004)(86362001)(31696002)(478600001)(53546011)(316002)(4326008)(8676002)(36756003)(16526019)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHpwS1dCNjNUV1FJVisrYTY3eGIxL3lqZW5zaTkyMW8vdk0vRE1CT1ZMdFlU?=
 =?utf-8?B?M0hYck0zSWJjcm5Qa2pjWGIyUVNSSHdXbk14SlI1aVJFWDluUHF0QnVQbnRu?=
 =?utf-8?B?UUo3ZGtvVGltSTFXem8zTHhxVjljMWpVMlVQT1pHTDFDbVNPc2NNSWx1U0ZY?=
 =?utf-8?B?UFVwMXJjc1ZNb3MwbHF6TjJqL3M0NkcybWpqcXd6VW90ckNDdWFWUlpNOXls?=
 =?utf-8?B?YkZLRXNYTm9mUDhBekNnd0pZUXdUUzBmLzVwL2dTM2RoT2FnYk5hYmZCajBO?=
 =?utf-8?B?SnMxS0ZwZjkrYWh5WHhBU3pHOG1IdURaLzVzMVo1TDM1bVVUdVlnMUY4d0xj?=
 =?utf-8?B?ZGdXWUN3NWh0MW5IUmdkZ3hzUnJCbkhZQTlvZjNBNzNadzk1Tm5PSy9USm1o?=
 =?utf-8?B?WFdJM05RTm1JY2lNS0Uza3ZPZ0FTSWVRQ0NzbDh4U0ozQWpBZkFBblVJWC9n?=
 =?utf-8?B?OEk5YUVObEtzRjVXZVRXcWxLTE1reFNmNmp0MmQ3VlV5U1NrS2tmTVdTMWQx?=
 =?utf-8?B?enpxWkNVN2RDTmR1THEyR2RROVlwQUJ6NCtlYkhteEJLWmd4aEdDdWJuRWdI?=
 =?utf-8?B?WndGSTBVdlhDTWtVZW41QVgxb3B0Y3oyQ2V5UW1hQm13V1hyK294VG8zeENY?=
 =?utf-8?B?Q0xkbHR5T3ZVMmdDaVlOUzhLQWJjRXg2SER4RDFSZXYrRnMwbzNKUEJCOHM0?=
 =?utf-8?B?TzB0ZE5DYnNFUGtCNEdqTFVWcFhwLy9DRHNmOHg0ekk3SjdINHIxYnh2ZjZV?=
 =?utf-8?B?V29NanVmMjBQa0VJdWYzakpwWmVXYVROamVFait6ZjQ3UG96L1NOZnBvTm45?=
 =?utf-8?B?T1dSV2hTOTRwaGtMYjZKNFVWbU5TL01TMjhCMW9UdEV6d0xrZ3hxTjYrVW9w?=
 =?utf-8?B?RFVmNGMydVZDZ2UyU3FMb3hQZ3J6WEJVQ013YWJRZk5kNXMxLzB6ZC9DWDcr?=
 =?utf-8?B?YnVvUjZUZGN2NUlWYTI3bUdSV24yQmxJSUs5YWpUYVIvQkxlUkY0YmdsRDBv?=
 =?utf-8?B?Qi9hRUw5L1VaM01teW5DTDBQbXV5RWovSVBnS2d4UWhkaCtsMzZMYnJLc1FF?=
 =?utf-8?B?cnhJbWpwNVdxQmtjMDRSY1pCeTRkZnpYVnNhc3c0QVRDU0NFZi85cmZKNmpr?=
 =?utf-8?B?NVJsa0pwQVBQK2xDZ0VFUFQydUE1QU5GUHFHQmxmWk9MZFB3dUdLZm9RYU9W?=
 =?utf-8?B?ckRkeDFrcDNMeHNmV2R1UWlxRmZMOU9RaTIwR3dpb1NtakpITHZPQnZuc1NF?=
 =?utf-8?B?dkxsRWxPZnJqWEZRc2hoOHhiOXVpL1h2a0UzbDV6VnZnemZyUG9vRGhWWTNN?=
 =?utf-8?B?R0YzV2pqeXBzQkdYUmxIa1Y5MHpZajVtTW1aVi8wSVpFekRXb2V5SGtEQUla?=
 =?utf-8?B?clpBRkpMRTZVVGl1YzlFbStNbmpDQUU1ZmtEVllWR0FIY2l1NGVaVEZFTnpy?=
 =?utf-8?B?b1ZJTUNkM3BZYWxjRS9OZ3prNmFBSTBSSU1Ya2NqYWRPSU1FNURCRStrcG1h?=
 =?utf-8?B?aHNYOEppa1VadmhzdFczb1ZBbjlKSVJpQzVsNCtjejNzeWtJOVFHV2pDNGFs?=
 =?utf-8?B?ZVMrWm9YQUowWkhKWEJYNEtMekpsZGx4eGNLVktzZ2NwZjRiZkY1R1RCNjVG?=
 =?utf-8?B?RjNUay9ZQmpSOTkvZ05uYVlqdmhYZHZ4Y2lKYzhJS0J0ZTMrNlVUbDVGZXpp?=
 =?utf-8?B?bXJkTFIra1N1NTdyYjhMaG5oUUI4OCtGTVBEL3YxQW1TeFoxcGFmWU5jRGtN?=
 =?utf-8?B?c25OZWtmSFBLbkJCYTBxc2FudGwwbVY0L1owa1ZsdkVIaG8rVGdaWXducDJx?=
 =?utf-8?B?bnhqRGxSaXYweU9RazhtRDRnZFo4K1JmQ0JJWkg4STVQeDhLYTJES0g1SlhO?=
 =?utf-8?Q?n5yILjSxbaCFq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e55ea8-7a8d-47ab-37d3-08d8ce0f7158
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 22:01:39.7041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcMMi83aOxGkkkVN1TsM4E+2T3fE7MTRv5p/onpdhsRIkWhL0HQTfDQUs8gySpLoXEJ422FjHGFETnS6lWE9dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvOS8yMSAxMDo0MCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAwOS4wMi4y
MSB1bSAxNTozMCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBbU05JUF0KPj4+PiBRdWVz
dGlvbiAtIFdoeSBjYW4ndCB3ZSBqdXN0IHNldCB0aG9zZSBQVEVzIHRvIHBvaW50IHRvIHN5c3Rl
bSBtZW1vcnkgCj4+Pj4gKGFub3RoZXIgUk8gZHVtbXkgcGFnZSkKPj4+PiBmaWxsZWQgd2l0aCAx
cyA/Cj4+Pgo+Pj4KPj4+IFRoZW4gd3JpdGVzIGFyZSBub3QgZGlzY2FyZGVkLiBFLmcuIHRoZSAx
cyB3b3VsZCBjaGFuZ2UgdG8gc29tZXRoaW5nIGVsc2UuCj4+Pgo+Pj4gQ2hyaXN0aWFuLgo+Pgo+
Pgo+PiBJIHNlZSBidXQsIHdoYXQgYWJvdXQgbWFya2luZyB0aGUgbWFwcGluZ3MgYXMgUk8gYW5k
IGRpc2NhcmRpbmcgdGhlIHdyaXRlIAo+PiBhY2Nlc3MgcGFnZSBmYXVsdHMgY29udGludW91c2x5
IHVudGlsIHRoZSBkZXZpY2UgaXMgZmluYWxpemVkID8KPj4gUmVnYXJkaW5nIHVzaW5nIGFuIHVu
dXNlZCByYW5nZSBiZWhpbmQgdGhlIHVwcGVyIGJyaWRnZSBhcyBEYW5pZWwgc3VnZ2VzdGVkLCAK
Pj4gSSB3b25kZXIgd2lsbCB0aGlzIGludGVyZmVyZSB3aXRoCj4+IHRoZSB1cGNvbWluZyBmZWF0
dXJlIHRvIHN1cHBvcnQgQkFScyBtb3ZlbWVudMKgIGR1cmluZyBob3QgcGx1ZyAtIAo+PiBodHRw
czovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1wY2kvbXNnMTAzMTk1Lmh0bWwgPwo+Cj4g
SW4gdGhlIHBpY3R1cmUgaW4gbXkgaGVhZCB0aGUgYWRkcmVzcyB3aWxsIG5ldmVyIGJlIHVzZWQu
Cj4KPiBCdXQgaXQgZG9lc24ndCBldmVuIG5lZWRzIHRvIGJlIGFuIHVudXNlZCByYW5nZSBvZiB0
aGUgcm9vdCBicmlkZ2UuIFRoYXQgb25lIAo+IGlzIHVzdWFsbHkgc3R1ZmZlZCBmdWxsIGJ5IHRo
ZSBCSU9TLgo+Cj4gRm9yIG15IEJBUiByZXNpemUgd29yayBJIGxvb2tlZCBhdCBxdWl0ZSBhIGJ1
bmNoIG9mIE5CIGRvY3VtZW50YXRpb24uIEF0IGxlYXN0IAo+IGZvciBBTUQgQ1BVcyB3ZSBzaG91
bGQgYWx3YXlzIGhhdmUgYW4gTU1JTyBhZGRyZXNzIHdoaWNoIGlzIG5ldmVyIGV2ZXIgdXNlZC4g
Cj4gVGhhdCBtYWtlcyB0aGlzIHBsYXRmb3JtL0NQVSBkZXBlbmRlbnQsIGJ1dCB0aGUgY29kZSBp
cyBqdXN0IG1pbmltYWwuCj4KPiBUaGUgcmVhbGx5IHJlYWxseSBuaWNlIHRoaW5nIGFib3V0IHRo
aXMgYXBwcm9hY2ggaXMgdGhhdCB5b3UgY291bGQgdW5pdCB0ZXN0IAo+IGFuZCBhdWRpdCB0aGUg
Y29kZSBmb3IgcHJvYmxlbXMgZXZlbiB3aXRob3V0ICpyZWFsKiBob3RwbHVnIGhhcmR3YXJlLiBF
LmcuIHdlIAo+IGNhbiBzd2FwIHRoZSBrZXJuZWwgUFRFcyBhbmQgc2VlIGhvdyB0aGUgd2hvbGUg
cG93ZXIgYW5kIGRpc3BsYXkgY29kZSByZWFjdHMgCj4gdG8gdGhhdCBldGMuLi4uCj4KPiBDaHJp
c3RpYW4uCgoKVHJpZWQgdG8gcGxheSB3aXRoIGhhY2tpbmcgbW1pbyB0cmFjZXIgYXMgRGFuaWVs
IHN1Z2dlc3RlZCBidXQganVzdCBoYW5nZWQgdGhlIAptYWNoaW5lIHNvLi4uCgpDYW4geW91IHRl
bGwgbWUgaG93IHRvIGR5bmFtaWNhbGx5IG9idGFpbiB0aGlzIGtpbmQgb2YgdW51c2VkIE1NSU8g
YWRkcmVzcyA/IEkgCnRoaW5rIGdpdmVuIHN1Y2ggYWRkcmVzcywgd3JpdGluZwp0byB3aGljaCBp
cyBkcm9wcGVkIGFuZCByZWFkaW5nIGZyb20gcmV0dXJuIGFsbCAxcywgSSBjYW4gdGhlbiBkbyBz
b21ldGhpbmcgbGlrZSAKYmVsbG93LCBpZiB0aGF0IHdoYXQgdSBtZWFudCAtCgpmb3IgKGFkZHJl
c3MgPSBhZGV2LT5ybW1pbzsgYWRkcmVzcyA8IGFkZXYtPnJtbWlvX3NpemU7IGFkcmVzcyArPSBQ
QUdFX1NJWkUpIHsKCiDCoMKgwqAgb2xkX3B0ZSA9IGdldF9sb2NrZWRfcHRlKGluaXRfbW0sIGFk
ZHJlc3MpCiDCoMKgwqAgZHVtbXlfcHRlID0gcGZuX3B0ZShmYWtlX21taW9fYWRkcmVzcywgMCk7
CiDCoMKgwqAgc2V0X3B0ZSgmb2xkX3B0ZSwgZHVtbXlfcHRlKQoKfQoKZmx1c2hfdGxiID8/PwoK
UC5TIEkgaG9wZSB0byBvYnRhaW4gdGh1bmRlcmJvbHQgZUdQVSBhZGFwdGVyIHNvb24gc28gZXZl
biBpZiB0aGlzIHdvbid0IHdvcmsgSSAKc3RpbGwgd2lsbCBiZSBhYmxlIHRvIHRlc3QgaG93IHRo
ZSBkcml2ZXIgaGFuZGxlcyBhbGwgMXMuCgpBbmRyZXkKCj4KPj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+
Pgo+Pj4KPj4+Pgo+Pj4+IEFuZHJleQo+Pj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pj4+Cj4+Pj4+Pj4gSXQncyBhIG5pZnR5IGlkZWEgaW5kZWVkIG90aGVyd2lzZSAuLi4KPj4+
Pj4+PiAtRGFuaWVsCj4+Pj4+Pj4KPj4+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+Pj4gQ2hyaXN0aWFu
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEJ1dCB1Z2ggLi4uCj4+Pj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4+PiBPdG9oIHZhbGlkYXRpbmcgYW4gZW50aXJlIGRyaXZlciBsaWtlIGFt
ZGdwdSB3aXRob3V0IHN1Y2ggYSB0cmljawo+Pj4+Pj4+Pj4+Pj4+IGFnYWluc3QgMHhmZiByZWFk
cyBpcyBwcmFjdGljYWxseSBpbXBvc3NpYmxlLiBTbyBtYXliZSB5b3UgbmVlZCB0byAKPj4+Pj4+
Pj4+Pj4+PiBhZGQKPj4+Pj4+Pj4+Pj4+PiB0aGlzIGFzIG9uZSBvZiB0aGUgdGFza3MgaGVyZT8K
Pj4+Pj4+Pj4+Pj4+IE9yIEkgY291bGQganVzdCBmb3IgdmFsaWRhdGlvbiBwdXJwb3NlcyByZXR1
cm4gfjAgZnJvbSBhbGwgcmVnIAo+Pj4+Pj4+Pj4+Pj4gcmVhZHMgaW4gdGhlIGNvZGUKPj4+Pj4+
Pj4+Pj4+IGFuZCBpZ25vcmUgd3JpdGVzIGlmIGRybV9kZXZfdW5wbHVnZ2VkLCB0aGlzIGNvdWxk
IGFscmVhZHkgZWFzaWx5IAo+Pj4+Pj4+Pj4+Pj4gdmFsaWRhdGUgYSBiaWcKPj4+Pj4+Pj4+Pj4+
IHBvcnRpb24gb2YgdGhlIGNvZGUgZmxvdyB1bmRlciBzdWNoIHNjZW5hcmlvLgo+Pj4+Pj4+Pj4+
PiBIbSB5ZWFoIGlmIHlvdXIgcmVhbGx5IHdyYXAgdGhlbSBhbGwsIHRoYXQgc2hvdWxkIHdvcmsg
dG9vLiBTaW5jZQo+Pj4+Pj4+Pj4+PiBpb21tYXBwaW5ncyBoYXZlIF9faW9tZW0gcG9pbnRlciB0
eXBlLCBhcyBsb25nIGFzIGFtZGdwdSBpcyBzcGFyc2UKPj4+Pj4+Pj4+Pj4gd2FybmluZyBmcmVl
LCBzaG91bGQgYmUgZG9hYmxlIHRvIGd1YXJhbnRlZSB0aGlzLgo+Pj4+Pj4+Pj4+IFByb2JsZW0g
aXMgdGhhdCB+MCBpcyBub3QgYWx3YXlzIGEgdmFsaWQgcmVnaXN0ZXIgdmFsdWUuCj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+PiBZb3Ugd291bGQgbmVlZCB0byBhdWRpdCBldmVyeSByZWdpc3RlciByZWFk
IHRoYXQgaXQgZG9lc24ndCB1c2UgdGhlIAo+Pj4+Pj4+Pj4+IHJldHVybmVkCj4+Pj4+Pj4+Pj4g
dmFsdWUgYmxpbmRseSBhcyBpbmRleCBvciBzaW1pbGFyLiBUaGF0IGlzIHF1aXRlIGEgYml0IG9m
IHdvcmsuCj4+Pj4+Pj4+PiBZZWFoIHRoYXQncyB0aGUgZW50aXJlIGNydXggaGVyZSA6LS8KPj4+
Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
