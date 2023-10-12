Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFEB7C64F3
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 07:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F64710E410;
	Thu, 12 Oct 2023 05:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D89610E410;
 Thu, 12 Oct 2023 05:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MS9HhsD/pHwQ3744er8MtgexZUyvmBsMdlhq3v90JNS19LMlDTjtuJ2LiqamUFlUBFwdqqN19h0t64SfseBKpi+TyskDH3iEKpCS9uGZNFM/8YYm7IGtcVBHG6u+qpTxBfwm7+q8Kkmu5ldPvV2AxzC1B7pleisS5XCWFu7qil1ZLvYYwKIRWe+sPdwOBQQcprIyPeglhYbuHwjJZyuqwjUKNvF0IMneaAnJ7xMCiAunpxZyI+7rACQay87vH38rdEqjbKBGCCiLfIgL/WiKJJwigTuSOrvQhQ5aDfsqeYoHUQjMQbkmi/0/ejx89YsLkElE4Kr+TwUKD6IkX9+wLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wizNYNAgCBSPPYSBQbNq9eBF2dnHyIkUQlQ/f+rxp98=;
 b=hPlHGHk5lhe9ZKsFCU+45BX19VU/BzagGfld0BNF9ir3Nn88bpeFyPJa7O2lwtT4F/iuLwfwUPjgDTVyq064sQCyvmne85m2Jq5xcRc9yB13LPsL9Iu4daVdYJev9jlJmPULeu2JlW0zfaaqU9cNua0IXI/B5U5JLGiOMW9E/5N4LIGlu+OX2zDIG+DZRMqF9FM3/wezEqHMGjGxgf69HjZJAThOTakeSs41WQEBApnn0q2IlHdcEHMW3Sr30H4ohApirATP9uabHCZMTsm7+53B0bh9M7E2QlP5yfOTcyvX0Bx9isRm3NmygGfT7CcCFaYaS1TUSbsvdkIluyl+dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wizNYNAgCBSPPYSBQbNq9eBF2dnHyIkUQlQ/f+rxp98=;
 b=tMFzrrwuar4s3mZf81/0SlZnrGLwegGzf0zX8Yqx8zT0mUWthPJrOSWcUn5EHovMgi7zLBOSGj6v4aE06kg+fCcLtKAdNpGd92RkYSFZMoWmIm+q4iOhfegAB64TM4uNyk1zCkeIEIFMlZp8gYClrglgkbQ3O/ZhXn4DrAEBYUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7263.namprd12.prod.outlook.com (2603:10b6:303:226::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.38; Thu, 12 Oct 2023 05:54:18 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b80b:7138:6ceb:9aef%5]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 05:54:17 +0000
Message-ID: <78832cf8-2649-49ff-a668-fd41f1a0a75f@amd.com>
Date: Thu, 12 Oct 2023 01:54:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.2
Subject: Re: [PATCH v5 3/7] drm/sched: Move schedule policy to scheduler
Content-Language: en-CA, en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20231011235826.585624-1-matthew.brost@intel.com>
 <20231011235826.585624-4-matthew.brost@intel.com>
 <34a4a2f4-a907-4fa2-9705-878106155639@amd.com>
 <ZSd2lmMDy+ayyILC@DUT025-TGLU.fm.intel.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <ZSd2lmMDy+ayyILC@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::11)
 To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: ae3da777-d686-413c-8693-08dbcae7abd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 096vKOY0jt+aJaQFD+M67YoVv5smjx8uo9KWyTY7Ry9gyqM7lp+jKZP94b+siiylkDlVILmqDYgXHqOK838awA29aBEnFDf0qKYfsfFdHj6nyZUKERMiWxLbEcGA+bJa3A9oMKs3du18AuwwtdUw0FFXDKBS+zCPUUPdkU+ttDulZ1f14h0DXcbK6JAnHjK5XFF7KN0p2AYAm/fYJGRYkzU3oGJIwl7LCVFF6+vbkHCtDhoctS0JJpH+99Hpq7ZroUrCtYExo0GpYnmjwJH2JsYU0BN6BJBTfqyDtYs9jRAg1YJtmzAGfbhFtw3kYWhbZjk3JcctpEpywiLxGbGzvTVdLARhCsb9pOnrGnj0WZ8Tlh31OBk+/yUG5CLkmQtUbiZSjNexRd3Z+wLTNHuzuWsy2qUy/WKMcV/gdxxq1fFDrlImsyDoRGBGtRtHcbI7C0IfuWVCLhfzsxoys4oopaVWZD/s8d4Cofry8PS4VVFiLYrVF0vIpb4jSa3EAAoAxArFnbXCbB06DGN91GufrkZdKi3doYDgiPB6vBxn2p09t281qD34ShzV413Cmt0rL9T/vAxDuKyx7D7RKF5f1K1wgdXhkG3bPO7otztGLWJ4bsXcSeSNWTamJSuuYlCaWeU7fZhtFgZgs1PybV86xnciFAbz3DbUOC+JnSZlKKdYFlFKCSqIid3GjV/p8Su0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(36756003)(31696002)(6666004)(478600001)(26005)(6506007)(2616005)(86362001)(2906002)(83380400001)(4001150100001)(6512007)(53546011)(966005)(38100700002)(6486002)(41300700001)(44832011)(5660300002)(66946007)(66556008)(66476007)(6916009)(316002)(8676002)(31686004)(4326008)(8936002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0VrS2NseTVqMVNOdm1Qa2g5N2NSZ3JuMW9CSUtiTnlVWS9pdVh3ZWFMU09j?=
 =?utf-8?B?bWpycGpiUWxTNGJKT1QvcGNBY0Z3QUZNQ1R4MWVGYi82YmNzV0pybVppaXpy?=
 =?utf-8?B?WGNJMXlVOGJqcllIUU5YV0VmWEo4V2tqUUJTUXlHSitQMzlEZmh2QmplWm43?=
 =?utf-8?B?YU9oQ0RZVm8xaDFhSGpZS0JhTmFWc1dkRDQyVi9SVFBubHJJZlBFbHFGcHV5?=
 =?utf-8?B?RFJFU3dVaWNBaTJHZ3NVN2M5VHlaOXRlaUhYM25WWERtSzFVajJ3NUhtVTR6?=
 =?utf-8?B?SkxpcjNOb290dE04MERLb1NkaVlCaWVCa3dPRmlzb0lxRWtIY0dNZ0JCYU9U?=
 =?utf-8?B?dXF0aERXZjFmR3dieVM2cm84cHowOTI1c3dVSXBtVWQzT25pRDMyaWg4WFp6?=
 =?utf-8?B?V3FtdWpjN1JmZk1rL0dLZU1vNFh5dTJEcENWVytTbnl3Njhjc2dmc05PMGhE?=
 =?utf-8?B?dWJLRVFJSEx4QzJDMmtrbDRvNklqVU45T2RtdG5IVUtOaUY3RlJqWFdBc0Ji?=
 =?utf-8?B?UkpTekFTR0JhSys4MHVnbTRtUVVqVnBtNnhGei9WeDhYaEgyaWplNk5mKzJ5?=
 =?utf-8?B?VHpBeUp5QjRqYjlRcmgyUU05a1VWckk5NmVkK2NNTU5GeWdMa2ZiS3BLdXBB?=
 =?utf-8?B?enR5b3JWSHV2NjhBR1NIWTVIYzFEUDRxV3Ntc0MyZVY3ZUZ4Z2U5VmdmKzdX?=
 =?utf-8?B?d282d0EvNEtNZ29BSDYvTjBQdVlrZGExemtvbVpqT203Wk5sWjlFVFJibklO?=
 =?utf-8?B?K29EbEUyVVJaaXFiYTh5WXA0UUl0dUpUYTBld1VwVE9KMjkxMU81bkhzNTNu?=
 =?utf-8?B?S1Q4bVpBZ08xSE5XajlaTGhDdzg5NkN6N3NUYm12ajIwZVVySk1ZNDBFYURz?=
 =?utf-8?B?Ulp4TEhGTENtSG5oZXJxNEV3dWFTbVNrUXB3OTF3b0R0T1JuMEFEYXQrWUlu?=
 =?utf-8?B?TTJ2SHBibGNEcXc1SVprcXZYSk5jZW9nMmRkOGFGV0l6SlRvSkRjV2N1OER0?=
 =?utf-8?B?Y1F6SElQTURBZ3VtWTNLaTFYaC8xQ1cyKzVCVERHeUt5VG1yb3NsOWJBaEph?=
 =?utf-8?B?cVRhbDFJQTVXQTEyckhwYXFvSURjZms4elhNbFQ0d01Dbm5qSVhNeWZMNi9z?=
 =?utf-8?B?eGJqOVh6UHhlenRhWXM3dmZSdXRtM1lVQXFRUVRvcEJibFZhbmkyQVFxcjlk?=
 =?utf-8?B?UW5yQzVzU01NMXo3NjJHT1RxMlhqblVWMDJBTlNSdlRyT2ZMQ0dUTDh0U1k4?=
 =?utf-8?B?MjBoNTlRdDN0a2dtWE54djNOZW44UXVKTDRYZjh2K1N3NENoMlc4SHVCeTlB?=
 =?utf-8?B?QkMrTFVrZlpRM3Q2ZGttbjVBNE43cjJCbEY1WFNIZ2NJTmRUaWs1TUJONFQy?=
 =?utf-8?B?dEJmQzVVaUsxa0RlQWJtQ0NGc2gwdGFhUUVFK1hNZ1ZRL3IvYTRRd1QyMXJU?=
 =?utf-8?B?d2hNSlFLbUdKY05uQjdNSVROcW1UVGlDT0lZNWt4Q2FRbmRrMGxVVzY5U2xT?=
 =?utf-8?B?eC83eTliczZ6cGhXd1ludStOWXJKNnF3UFRCcVF3N1B1OGVHK0VQV2R1K3Iw?=
 =?utf-8?B?MS9HZ0Y3OEg0NTd6UzJ1Y2dkNmdFKzdVeE5uU08vRGNHR2JrNTc5d0ZUQ2VL?=
 =?utf-8?B?TUQ2ZjJ3ZndFTm1IQkR1NUNXZ3lXUTRkKzVPSHRjUzdnd1lCNG1qSkRkd0x5?=
 =?utf-8?B?eE9ibFpoYmNjQzNmYllxRXF3Qkg2QVg5N1g2VzZSU2N5VUNzNlduVTdGcDBi?=
 =?utf-8?B?RXh6c084NGtLL1RGN0krd3RnZFp4cnl3aGRubktadVZhZUNxbm1henFNRHp5?=
 =?utf-8?B?OEZKNTZrUUtjaTJIVWJzY3lyU1BURkE0dDd2bUQzRFVFT0FMZTBMUVY3YjZs?=
 =?utf-8?B?MlZCbE1qT2N3Y096S3lUaFUyVi9pQW9ncXBROCtNRTVWcGc0Vy9SUldKMlI4?=
 =?utf-8?B?NHpManRCNW9RaXMvVTBTSWlhY2Q1eE9DWFY3RmhHWW56Z1I0cDBxK2NxcUhw?=
 =?utf-8?B?NjgzajdKTUd4WmM5UVpDc1N5akFtOFRwclA4K0tyV1ZZdWpLM3V3cCttb3My?=
 =?utf-8?B?cDFTN2pDVmtSeGRrOEcwOGJ2TUx0NktqMEJCREVDUlAxVzNUUitSS3E4bDZH?=
 =?utf-8?Q?IA7c3YwhMpg7kkUCFFTIxCGCq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae3da777-d686-413c-8693-08dbcae7abd6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 05:54:17.3852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yum806IyOts1cl44k/xFQX4EMbMKw2wjVrdRopla/pFw3nUwb0QAo+aJ46XtAX52
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7263
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 boris.brezillon@collabora.com, dakr@redhat.com, donald.robson@imgtec.com,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-12 00:31, Matthew Brost wrote:
> On Wed, Oct 11, 2023 at 08:39:55PM -0400, Luben Tuikov wrote:
>> On 2023-10-11 19:58, Matthew Brost wrote:
>>> Rather than a global modparam for scheduling policy, move the scheduling
>>> policy to scheduler so user can control each scheduler policy.
>>>
>>> v2:
>>>   - s/DRM_SCHED_POLICY_MAX/DRM_SCHED_POLICY_COUNT (Luben)
>>>   - Only include policy in scheduler (Luben)
>>> v3:
>>>   - use a ternary operator as opposed to an if-control (Luben)
>>>   - s/DRM_SCHED_POLICY_DEFAULT/DRM_SCHED_POLICY_UNSET/ (Luben)
>>>   - s/default_drm_sched_policy/drm_sched_policy_default/ (Luben)
>>>   - Update commit message (Boris)
>>>   - Fix v3d build (CI)
>>>   - s/bad_policies/drm_sched_policy_mismatch/ (Luben)
>>>   - Don't update modparam doc (Luben)
>>> v4:
>>>   - Fix alignment in msm_ringbuffer_new (Luben / checkpatch)
>>>
>>> Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
>> Was the R-V added by hand? (As in editing the commit message manually?)
>>
> 
> Yes.
> 
>> I use automated tools for this which do not re-order the tags.
>> IOW, the S-O-B is first as this is how it appears in the patch,
>> then the R-V most probably added by automated tools, and then
>> any other as are tacked on by other automated tools.
>>
> 
> Ok, so always add tags in order starting with S-O-B?

Yes!

The S-O-B tag you add when you write the commit and then you post
it up to a mailing list, it's mandatory and it's always there.
It's most likely the first, top tag.

Then various other scripts and tools start adding tags in an automated way,
and those tags are just appended below any existing tags.

Generally, always follow a natural order (meaning least amount of energy
expenditure--if you have to edit to reorder, that is extra energy expenditure
and nature doesn't like that). Make it like a letter you'd get from or write to
your bank, attorney, etc.
	These are tags you add when you craft your commit:
Cc: goes first, followed by other tags whose values
Cc: are personal emails, i.e. people. These are people
Cc: you want to let know of this commit. This is followed
Cc: by other personal tags, for instance,
Co-developed-by: or
Suggested-by: Another personal tag is,
Reported-by: which must be followed by a Link tag with
Link: the link of the report. This could also be a link to anything else. You can also add a
Fixes: tag which should follow a --pretty %h (\"%s\") format.
Closes: link to the bug the patch closes
Signed-off-by: You
	Then scripts and tools (or even people) would append the tag list with:
Tested-by: someone reliable, could have more than one instance of this tag,
Acked-by: someone
Reviewed-by: someone

There are no empty lines between tags. They form a block paragraph as they would
if/when added by a script. (I never add _any_ tag manually.)

So, for instance, you may have:

Cc: Luben
Signed-off-by: Matt

And when the patch is R-V-ed this becomes (least amount of energy, append at the bottom),

Cc: Luben
Signed-off-by: Matt
Reviewed-by: Luben

Then other tags may be appended, depending on the path the patch takes to land in a tree.

Check out:
https://docs.kernel.org/process/5.Posting.html
https://docs.kernel.org/process/submitting-patches.html
https://docs.kernel.org/process/submit-checklist.html
And there's more resources to check out in the Documentation/process directory.
-- 
Regards,
Luben

