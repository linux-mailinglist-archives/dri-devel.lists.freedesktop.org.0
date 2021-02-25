Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B388C32589A
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 22:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646026E092;
	Thu, 25 Feb 2021 21:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A356E092;
 Thu, 25 Feb 2021 21:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6rPMEV8J84d1PfO8Z04SoNWYQvxA9wbU/un9XTtI6LlTUmTNlNu/EWEJRy+l6W1o31w1uMzTzyFBZ2MTDFslJDYKO14W3HBD8SWXzej2EzzdzsjIsOLJGW3Ti54y+DH8k1/R8UpDM+73Qf539bjNLFDl+sKqzhKhNV1NWoJe05j7KkoZ7SLDEcMjkZMWPIR/pmkoApklZ7fX/mLR2kkeP3OsydjBg9rmIz5h0r9+irMt9pX8DpIhMrQh0akDGteIKg5EkX9jPq3Zhgq+8UCTebMhNI/kYkOPy0+RlQn6945tMkjxYlJ365BJXyILH7xvAG+5c4R9MN2F+iTdMq+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9/c75uTQ4wUc5xk0yCprs3zOLXC6iB4ZIpIMRkFvVo=;
 b=IIxjww57XROlcuLOIp8d21o3qBtgHTCdrc0HaWa8+Jgu0xXn/0TUJ4+AeSMj3c8NlyVpTz73RI23eZmE2VzowmUuKBm8sFHWUHR2jXOIaZD/F7vR8IWowUPpqZffrW96e/aUnJsUJ2unbCVSyouSBNZ0SW4MJ72xmY6NADYh+jar6Pwwr55cl9aYaPavcCSG0RJdDDEYNOdkvlKPqNRa8vBipKh3IPemD12boNxbWMOuZlTLYiKkdT95HJrvtkVYitdn8Lvz8J1ZH/C8iBW7pYpdj0gxSUG8zhb31MAbp6VK+TV6cQLE0J6C36kpE4K8ZmKvGqpujesH1Sh53xgrig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9/c75uTQ4wUc5xk0yCprs3zOLXC6iB4ZIpIMRkFvVo=;
 b=ZtSOuKg5iVSxsHyENCVoJcaek08GETTCj7pnlHjW6ZYQBP2pWvzbb/Vuj2x46rvLJhy50SBM/ML3UM2Q8eatfEp+1DW+N4fChwNc7h6M6YqHMBI6gqjTRI0iAgTTz6Vzx6pF3NglYOVRaTNIqrmvzgmp0Kqp0MYldMYFBjb21i8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4615.namprd12.prod.outlook.com (2603:10b6:a03:96::21)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 21:27:07 +0000
Received: from BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672]) by BYAPR12MB4615.namprd12.prod.outlook.com
 ([fe80::5cbd:c5a8:779:9672%7]) with mapi id 15.20.3868.033; Thu, 25 Feb 2021
 21:27:07 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
 <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
 <e0e05866-ac73-0534-f0b0-60c3fa211eee@amd.com>
 <85d4cf33-b8b9-23f6-7ca4-abdb98f0cd5e@gmail.com>
 <c6e9ed57-fb7f-8dec-ce2a-187d5bd7b1a9@amd.com>
 <aea77d09-57f3-88ce-606a-933eacafca64@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <e4440f37-5b6a-a60f-7719-f505c9045ed7@amd.com>
Date: Thu, 25 Feb 2021 16:27:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <aea77d09-57f3-88ce-606a-933eacafca64@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:25f7:b1a0:d070:450]
X-ClientProxiedBy: YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::47) To BYAPR12MB4615.namprd12.prod.outlook.com
 (2603:10b6:a03:96::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:25f7:b1a0:d070:450]
 (2607:fea8:3edf:49b0:25f7:b1a0:d070:450) by
 YTXPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.31 via Frontend Transport; Thu, 25 Feb 2021 21:27:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d4e7053e-57f1-42ec-d932-08d8d9d41a63
X-MS-TrafficTypeDiagnostic: BY5PR12MB4227:
X-Microsoft-Antispam-PRVS: <BY5PR12MB42270979931CA3F1C16D427AEA9E9@BY5PR12MB4227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MTNDihNQPl1GV5Osgwh2Ehnydwd2Rgb0/K1gdH42RrEYJnmM7xmQdnNiQFVBOfv6KEk2O7LwklNBH0cPlpOhbrEXsGebz1HNfsB9W5RhvpesfKbcbL1105okisp71W6p5+Q2725flZRoq0c4y7YOtzbIs2IxmupOsAJaF8rOH8Ub616aRAwImHWnQ8HwPLpauj1iYujO9I9R5GUW8pDQbjVv2qGLwO9qJoebX5X/QmwNnwTsyifha1viVd4sz3V+kWiGX6zcDIQe1Fzk1/Ju2mqzbQuf94FdAchlDIaFGqfBX37uOwUeFucEme3S0NDN4kA2WLjUTOzRxtGa6vThLRQfWdOqe25SfiFSEeqU+OpXto4kiFIfB1PCfkgF4ja04gODUlLjHoyN+JpYcLRIMM2MjVoL42SbxsZMtwKHHiRTygnMfTskDDvnnPgFD1+Xc+M7VJAjXA8RDgH6EDIqgKPrIz1Rwjo2EKsGg3rOGoJkO03WdspDkgY3OE8xn0Z5fa31qnHOOS7vFRBsewWL6QzZaGnE5ig33HXpmelYNW7PswcHaLu7DcjBn8o4B+X6o/Ulg173NsMIVxLxzx+/tE0UEuNB312Qz03r3OmEXM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4615.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(16526019)(186003)(2616005)(6486002)(52116002)(44832011)(316002)(66574015)(31686004)(36756003)(478600001)(8936002)(8676002)(53546011)(2906002)(66476007)(66946007)(83380400001)(5660300002)(31696002)(66556008)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWtNbERCWTBpamRFOVl3S2FpeUlHdzcyTTd2Vmhwdm1iV0I4NmovZjBOK2Rp?=
 =?utf-8?B?ZjZ3K1FHM1c3WmJzUXhlZ3JGamZ6b3EyM1FMdG82L0lSdUIzZFNLNU9uYlJB?=
 =?utf-8?B?RkhLTmpnaU5xZ1k1VDRlM252Z1FBZ2srSDAzeTR1YTFCdHJYMDlQSmJLN3FI?=
 =?utf-8?B?RXgyMjFsM3F3ZVZieldkRHN0SDBDdUw2by9rZE1kNEkzckJjT21rRThQUWhw?=
 =?utf-8?B?ZXNZR2tNcWRzb0k4Uys0em9SUzUwVDEzeE9xd29xdFBCeC8vVnFpMktrQ0to?=
 =?utf-8?B?dXZXbWZKTGcrNE41a3RHQ2tGMTIxWmxBSmJPZHAxbWNqakJQclo5TzZNRHMx?=
 =?utf-8?B?NnhrWFFWa2tsRmFwR1dPbXdHZCt6dHYzdkc0K2VkQm1NK1VzTnZHbDVCaFNQ?=
 =?utf-8?B?NTJFbzdwM0ZFN2s2Ymk2dEJmcFlCQSt4YWdVRW4wS0U0YmZNaUlpTEZZNFRk?=
 =?utf-8?B?NFdtS2ZtSVdKM0ZpdXZZWWVncFMzd2dvYjk3UVNWZi9mVzVFQ0l6MkxrNkFN?=
 =?utf-8?B?bk82by95SlVrMDd0SjJKem5jVnZhVUZBaHBQMzhoalR5Vm9sMTNTMWlRNW5p?=
 =?utf-8?B?bUlBREpmVlZERXl3KzRZeEx4WTArejFQakFKdVhmQm1tNlMwcXN3aHBnTm1p?=
 =?utf-8?B?bzR6UXdhSmxTN2piNGh4YiswSFNkTm1jT250b04wRWVhTDdncmJ4T0NrVHRN?=
 =?utf-8?B?TmlGOGc5aHlVNzh0VExDdEFYaC9kaUU1WTY4ZnNEU2tvK3dibVZwakFFdTdL?=
 =?utf-8?B?NUYvQUZyZ1pMT2o0d3NNdGJ3cW1Xd254S1hXWk0wWHpaWjEzZWJXZG5UM0Vu?=
 =?utf-8?B?b01kcFBrTnA2M2JUSHk5N09HeGwxNmpldjFNMFFjK2NkeU1ZWDRUckVmd3Bj?=
 =?utf-8?B?WStSUzdkb1p2QWt0SlRYYlF4RmpCWDJYQWZ3b3EvSFhxbE5lTlVuWVY5Qm5r?=
 =?utf-8?B?TjJuNnhxTE91by9JcXlGd0JLUm9iR2R3Z2dMV1Y5ZFBwNEdsVUlyRHNYRmlr?=
 =?utf-8?B?ckxIQ3RscGNFV3hTdHMycjV5NTFmLzE2RjB2RnhhUzNmbEdQeFkxdE95a2t3?=
 =?utf-8?B?NmNOeGpzaWNPYnpZbUpBREJ0S3dlQTZCUDhLWXY2blk4bXhVRkZpWndJRmQz?=
 =?utf-8?B?Zi9VWmhXWEFzM3J3c0NGTTZwdTkzUGllQjZIMThMaFVDcHZ3YUZuQTRCVGhy?=
 =?utf-8?B?MmUrRkZsOVZ4VHJhNzNBcHVQSW5QajVDYWF4VXZPcXFRd1BIRXNBTE13Tm14?=
 =?utf-8?B?MCtEQlljT3JNa05ROVM3UW1GR3l1ZjhlRGNxUUc1bHlnYVB6aGgwdE9Oc09R?=
 =?utf-8?B?bnhyL20zbUpRMVc0QzVHM3dqVG1JK2VqRzVMZS9kbzBuV1Q1VkNLd1loZmh1?=
 =?utf-8?B?MTRpalpyQWJmdTJ2dktqR0ZjWEdHUW1WbnEzblNpSGNOWm40NG9KWnRhbVcz?=
 =?utf-8?B?MFBiY1ZnZHpMM3JHd0pKUDFyN2VJSS9ReHduYklMeVdOc29RWEMyK0ZMRU9O?=
 =?utf-8?B?WFhHdEh6YWNJNGlMa2Y5RFdvWDFialN6Wk1acXBCd1VSbzhZOXFEMy8zU2JO?=
 =?utf-8?B?TnpxZkx5R0NJQTI3L2x0bkxUYVova2NwZDhWZDQ0QWtjS0g1cXR4c0JqQ0l5?=
 =?utf-8?B?c1lnTFBuWG9TL1pkbXZJYlR6UnBpZEREQ2lFQkVvdmlGYzRmV3VQM250MFVB?=
 =?utf-8?B?MjEyeUx5NzkwVXNhNzMwcGd0NVR2Tlk2SUliNE1NU01RYkw5UEd1MGs1SHpO?=
 =?utf-8?B?MnVoTXNnbVV3LzBDV284TWJySVZ0cEVDRkRGeW9HRU5rOTlyRmVEaUk5aXFz?=
 =?utf-8?B?V20xc3VEU1BkVmtqS1A3VXgzSnRmYWduM293S3ZuSWJJWEZYd3Z3VGNTalBn?=
 =?utf-8?Q?oftD9JGaNGwJg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e7053e-57f1-42ec-d932-08d8d9d41a63
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4615.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 21:27:07.5268 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHvoIXCeXvDDzT05JSKJSZ585NAlICPQukuULoSkLF7BFuF+vVdc7aAYJ1LvpxljcHX9uqhHSD3hp6hTrDT5ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIwMjEtMDItMjUgMTo0MiBwLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Cj4KPiBB
bSAyNS4wMi4yMSB1bSAxNzowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+PiBPbiAy
MDIxLTAyLTI1IDI6NTMgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDI0LjAy
LjIxIHVtIDE2OjEzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gUGluZwo+Pj4KPj4+
IFNvcnJ5LCBJJ3ZlIGJlZW4gb24gdmFjYXRpb24gdGhpcyB3ZWVrLgo+Pj4KPj4+Pgo+Pj4+IEFu
ZHJleQo+Pj4+Cj4+Pj4gT24gMjAyMS0wMi0yMCA3OjEyIGEubS4sIEFuZHJleSBHcm9kem92c2t5
IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBPbiAyLzIwLzIxIDM6MzggQU0sIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEFtIDE4LjAyLjIxIHVtIDE3OjQxIHNjaHJpZWIg
QW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyLzE4LzIxIDEwOjE1IEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+PiBBbSAxOC4wMi4yMSB1bSAxNjowNSBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IE9uIDIvMTgvMjEgMzow
NyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+
Pj4+Pj4gQW0gMTcuMDIuMjEgdW0gMjI6NTkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+
Pj4+Pj4+Pj4gUHJvYmxlbTogSWYgc2NoZWR1bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUg
dGltZSAKPj4+Pj4+Pj4+Pj4gc2NoZWRfZW50aXR5Cj4+Pj4+Pj4+Pj4+IGlzIHJlbGVhc2VkIGFu
ZCBlbnRpdHkncyBqb2JfcXVldWUgbm90IGVtcHR5IEkgZW5jb3VudHJlZAo+Pj4+Pj4+Pj4+PiBh
IGhhbmcgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaC4gVGhpcyBpcyBiZWNhdXNlIAo+Pj4+Pj4+
Pj4+PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+Pj4+Pj4+Pj4gbmV2ZXIgYmVjb21lcyBm
YWxzZS4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRh
Y2ggYWxsIHNjaGVkX2VudGl0aWVzIGZyb20gdGhlCj4+Pj4+Pj4+Pj4+IHNjaGVkdWxlcidzIHJ1
biBxdWV1ZXMuIFRoaXMgd2lsbCBzYXRpc2Z5IAo+Pj4+Pj4+Pj4+PiBkcm1fc2NoZWRfZW50aXR5
X2lzX2lkbGUuCj4+Pj4+Pj4+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBwcm9jZXNzZXMgc3R1
Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4+Pj4+Pj4+IGFzIHRoZSBzY2hlZHVsZXIg
bWFpbiB0aHJlYWQgd2hpY2ggd2FrZXMgdGhlbSB1cCBpcyBzdG9wcGVkIAo+Pj4+Pj4+Pj4+PiBi
eSBub3cuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IHYyOgo+Pj4+Pj4+Pj4+PiBSZXZlcnNlIG9y
ZGVyIG9mIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+Pj4+Pj4+Pj4+
IHNfZW50aXR5IGFzIHN0b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sgdG8gcnEgZHVl
Cj4+Pj4+Pj4+Pj4+IHRvIHJhY2UuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJleSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+
Pj4+PiAtLS0KPj4+Pj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMgfCAzMSAKPj4+Pj4+Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4+Pj4+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMgCj4+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMKPj4+Pj4+Pj4+Pj4gaW5kZXggOTA4YjBiNS4uYzZiNzk0NyAxMDA2NDQKPj4+Pj4+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4+Pj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4+Pj4+
Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+
Pj4+Pj4+Pj4+IMKgwqAgKi8KPj4+Pj4+Pj4+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+Pj4+Pj4+Pj4+PiDCoCB7Cj4+Pj4+Pj4+Pj4+
ICvCoMKgwqAgaW50IGk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRp
dHkgKnNfZW50aXR5Owo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQlRXOiBQbGVhc2Ugb3JkZXIgdGhh
dCBzbyB0aGF0IGkgaXMgZGVjbGFyZWQgbGFzdC4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiDCoMKg
wqDCoMKgIGlmIChzY2hlZC0+dGhyZWFkKQo+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
a3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQpOwo+Pj4+Pj4+Pj4+PiDCoCArwqDCoMKgIC8qIERl
dGFjaCBhbGwgc2NoZWRfZW50aXRlcyBmcm9tIHRoaXMgc2NoZWR1bGVyIG9uY2UgCj4+Pj4+Pj4+
Pj4+IGl0J3Mgc3RvcHBlZCAqLwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hF
RF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0gCj4+Pj4+Pj4+Pj4+IERSTV9TQ0hFRF9QUklPUklU
WV9NSU47IGktLSkgewo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hl
ZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXJxKQo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb250aW51ZTsKPj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAg
LyogTG9vcCB0aGlzIHdheSBiZWNhdXNlIHJxLT5sb2NrIGlzIHRha2VuIGluIAo+Pj4+Pj4+Pj4+
PiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3aGls
ZSAoKHNfZW50aXR5ID0gCj4+Pj4+Pj4+Pj4+IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEt
PmVudGl0aWVzLAo+Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksCj4+
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsaXN0KSkpIHsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBQcmV2ZW50IHJlaW5zZXJ0aW9uIGFuZCByZW1vdmUg
Ki8KPj4+Pj4+Pj4+Pj4gKyBzcGluX2xvY2soJnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc19lbnRpdHktPnN0b3BwZWQgPSB0cnVlOwo+Pj4+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0
eShycSwgc19lbnRpdHkpOwo+Pj4+Pj4+Pj4+PiArIHNwaW5fdW5sb2NrKCZzX2VudGl0eS0+cnFf
bG9jayk7Cj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBk
YW5jZSBoZXJlIGRvZXNuJ3QgbG9vayBjb3JyZWN0IGF0IAo+Pj4+Pj4+Pj4+IGFsbCBub3cuCj4+
Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+IEluIHdoYXQgd2F5ID8gSXQncyBpbiB0aGUgc2FtZSBzYW1lIG9yZGVyIGFzIGluIG90aGVy
IGNhbGwgCj4+Pj4+Pj4+PiBzaXRlcyAoc2VlIGRybV9zY2hlZF9lbnRpdHlfcHVzaF9qb2IgYW5k
IGRybV9zY2hlZF9lbnRpdHlfZmx1c2gpLgo+Pj4+Pj4+Pj4gSWYgaSBqdXN0IGxvY2tlZCBycS0+
bG9jayBhbmQgZGlkIGxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSAKPj4+Pj4+Pj4+IHdoaWxlIG1h
bnVhbGx5IGRlbGV0aW5nIGVudGl0eS0+bGlzdCBpbnN0ZWFkIG9mIGNhbGxpbmcKPj4+Pj4+Pj4+
IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IHRoaXMgc3RpbGwgd291bGQgbm90IGJlIHBvc3Np
YmxlIGFzIAo+Pj4+Pj4+Pj4gdGhlIG9yZGVyIG9mIGxvY2sgYWNxdWlzaXRpb24gYmV0d2VlbiBz
X2VudGl0eS0+cnFfbG9jawo+Pj4+Pj4+Pj4gYW5kIHJxLT5sb2NrIHdvdWxkIGJlIHJldmVyc2Ug
Y29tcGFyZWQgdG8gdGhlIGNhbGwgc2l0ZXMgCj4+Pj4+Pj4+PiBtZW50aW9uZWQgYWJvdmUuCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IEFoLCBub3cgSSB1bmRlcnN0YW5kLiBZb3UgbmVlZCB0aGlzIGJlY2F1
c2UgCj4+Pj4+Pj4+IGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KCkgd2lsbCBncmFiIHRoZSBy
cSBsb2NrIGFnYWluIQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBQcm9ibGVtIGlzIG5vdyB3aGF0IHByZXZl
bnRzIHRoZSBlbnRpdHkgZnJvbSBiZWluZyBkZXN0cm95ZWQgCj4+Pj4+Pj4+IHdoaWxlIHlvdSBy
ZW1vdmUgaXQ/Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFJp
Z2h0LCB3ZWxsLCBzaW5jZSAodW5mb3J0dW5hdGVseSkgc2NoZWRfZW50aXR5IGlzIHBhcnQgb2Yg
Cj4+Pj4+Pj4gYW1kZ3B1X2N0eF9lbnRpdHkgYW5kIGFtZGdwdV9jdHhfZW50aXR5IGlzIHJlZmNv
dW50ZWQKPj4+Pj4+PiB0aGVyZSBpcyBhIHByb2JsZW0gaGVyZSB0aGF0IHdlIGRvbid0IGluY3Jl
bWVudCAKPj4+Pj4+PiBhbWRncHVfY3R4LnJlZmNvdW50IHdoZW4gYXNzaWduaW5nwqAgc2NoZWRf
ZW50aXR5Cj4+Pj4+Pj4gdG8gbmV3IHJxIChlLmcuIGJlZm9yZSBkcm1fc2NoZWRfcnFfYWRkX2Vu
dGl0eSkgYW5kIG5vdCAKPj4+Pj4+PiBkZWNyZW1lbnQgYmVmb3JlIHJlbW92aW5nLiBXZSBkbyBp
dCBmb3IKPj4+Pj4+PiBhbWRncHVfY3NfcGFyc2VyLmVudGl0eSBmb3IgZXhhbXBsZSAoaW4gYW1k
Z3B1X2NzX3BhcnNlcl9pbml0IAo+Pj4+Pj4+IGFuZCBhbWRncHVfY3NfcGFyc2VyX2ZpbmkgYnkK
Pj4+Pj4+PiBjYWxsaW5nIGFtZGdwdV9jdHhfZ2V0IGFuZCBhbWRncHVfY3R4X3B1dCkuIEJ1dCB0
aGlzIHNlZW1zIGEgYml0IAo+Pj4+Pj4+IHRyaWNreSBkdWUgdG8gYWxsIHRoZSBkcm1fc2NoZWRf
ZW50aXR5X3NlbGVjdF9ycQo+Pj4+Pj4+IGxvZ2ljLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5vdGhlciwg
a2luZCBvZiBhIGJhbmQgYWlkIGZpeCwgd291bGQgcHJvYmFibHkgYmUganVzdCBsb2NraW5nIAo+
Pj4+Pj4+IGFtZGdwdV9jdHhfbWdyLmxvY2sgYXJvdW5kIGRybV9zY2hlZF9maW5pCj4+Pj4+Pj4g
d2hlbiBmaW5hbGl6aW5nIHRoZSBmZW5jZSBkcml2ZXIgYW5kIGFyb3VuZCBpZHIgaXRlcmF0aW9u
IGluIAo+Pj4+Pj4+IGFtZGdwdV9jdHhfbWdyX2ZpbmkgKHdoaWNoIHNob3VsZCBiZSBsb2NrIHBy
b3RlY3RlZAo+Pj4+Pj4+IGFueXdheSBhcyBJIHNlZSBmcm9tIG90aGVyIGlkciB1c2FnZXMgaW4g
dGhlIGNvZGUpIC4uLiBUaGlzIAo+Pj4+Pj4+IHNob3VsZCBwcmV2ZW50IHRoaXMgdXNlIGFmdGVy
IGZyZWUuCj4+Pj4+Pgo+Pj4+Pj4gUHVoLCB0aGF0J3MgcmF0aGVyIGNvbXBsaWNhdGVkIGFzIHdl
bGwuIE9rIGxldCdzIGxvb2sgYXQgaXQgZnJvbSAKPj4+Pj4+IHRoZSBvdGhlciBzaWRlIGZvciBh
IG1vbWVudC4KPj4+Pj4+Cj4+Pj4+PiBXaHkgZG8gd2UgaGF2ZSB0byByZW1vdmUgdGhlIGVudGl0
aWVzIGZyb20gdGhlIHJxIGluIHRoZSBmaXJzdCAKPj4+Pj4+IHBsYWNlPwo+Pj4+Pj4KPj4+Pj4+
IFdvdWxkbid0IGl0IGJlIHN1ZmZpY2llbnQgdG8ganVzdCBzZXQgYWxsIG9mIHRoZW0gdG8gc3Rv
cHBlZD8KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEFuZCBhZGRp
bmcgaXQgYXMgYW5vdGhlcsKgIGNvbmRpdGlvbiBpbiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUg
Pwo+Pj4KPj4+IFllcywgSSB0aGluayB0aGF0IHNob3VsZCB3b3JrLgo+Pgo+Pgo+PiBJbiB0aGlz
IGNhc2UgcmV2ZXJzZSBsb2NraW5nIG9yZGVyIGlzIGNyZWF0ZWQsIEluIAo+PiBkcm1fc2NoZWRf
ZW50aXR5X3B1c2hfam9iIGFuZCBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoIGxvY2sgCj4+IGVudGl0
eS0+cnFfbG9jayBsb2NrZWQgZmlyc3QgYW5kIHJxLT5sb2NrIGxvY2tlZCBzZWNvbmQuIEluIAo+
PiBkcm1fc2NoZWRfZmluaSBvbiB0aGUgb3RoZXIgaGFuZCwgSSBuZWVkIHRvIGxvY2sgcnEtPmxv
Y2sgZmlyc3QgdG8gCj4+IGl0ZXJhdGUgcnEtPmVudGl0aWVzIGFuZCB0aGVuIGxvY2sgc19lbnRp
dHktPnJxX2xvY2sgZm9yIGVhY2ggZW50aXR5IAo+PiB0byBtb2RpZnkgc19lbnRpdHktPnN0b3Bw
ZWQuIEkgZ3Vlc3Mgd2UgY291bGQgY2hhbmdlIAo+PiBzX2VudGl0eS0+c3RvcHBlZCB0byBhdG9t
aWMgPwo+Cj4gR29vZCBwb2ludC4gQnV0IEkgdGhpbmsgdGhlIG1lbW9yeSBiYXJyaWVyIGluc2Vy
dGVkIGJ5IAo+IHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7IHNob3VsZCBiZSBz
dWZmaWNpZW50Lgo+Cj4gSWYgSSBzZWUgdGhpcyBjb3JyZWN0bHkgd2UgaGF2ZSB0aGUgZW50aXR5
LT5ycV9sb2NrIG1haW5seSB0byBwcm90ZWN0IAo+IGNvbmN1cnJlbnQgY2hhbmdlcyBvZiBlbnRp
dHktPnJxLgo+Cj4gQnV0IHdoZW4gdHdvIENQVXMgYm90aCBzZXQgZW50aXR5LT5zdG9wcGVkIHRv
IHRydWUgYXQgdGhlIHNhbWUgdGltZSB3ZSAKPiBkb24ndCByZWFsbHkgY2FyZSBhYm91dCBpdCBh
cyBsb25nIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZSgpIHNlZXMgaXQuCj4KPiBSZWdhcmRzLAo+
IENocmlzdGlhbi4KCgpJIHdhcyBtb3JlIHRoaW5raW5nIGFib3V0IGludGVncml0eSBvZiByZWFk
aW5nL3dyaXRpbmcgZW50aXR5LT5zdG9wcGVkIApmcm9tIGRpZmZlcmVudCB0aHJlYWRzLiBJIGd1
ZXNzIHNpbmNlIGl0J3MgYm9vbCBpdCdzIGd1YXJhbnRlZWQgdG8gYmUgCmF0b21pYyBmcm9tIEhX
IHBlcnNwZWN0aXZlIGFueXdheSA/CldpbGwgc2VuZCBWMyBzb29uLgoKQW5kcmV5CgoKPgo+Pgo+
PiBBbmRyZXkKPj4KPj4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4KPj4+Pj4KPj4+Pj4gQW5k
cmV5Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4KPj4+
Pj4+Pgo+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEFuZHJleQo+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+Pj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEt
PmxvY2spOwo+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Pj4+PiAr
Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hl
ZF9lbnRpdHlfZmx1c2ggZm9yIAo+Pj4+Pj4+Pj4+PiB0aGlzIHNjaGVkdWxlciAqLwo+Pj4+Pj4+
Pj4+PiArIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4+Pj4+Pj4+ICsK
Pj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoCAvKiBDb25maXJtIG5vIHdvcmsgbGVmdCBiZWhpbmQgYWNj
ZXNzaW5nIGRldmljZSAKPj4+Pj4+Pj4+Pj4gc3RydWN0dXJlcyAqLwo+Pj4+Pj4+Pj4+PiBjYW5j
ZWxfZGVsYXllZF93b3JrX3N5bmMoJnNjaGVkLT53b3JrX3Rkcik7Cj4+Pj4+Pj4+Pj4KPj4+Pj4+
Pj4KPj4+Pj4+Cj4+Pgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
