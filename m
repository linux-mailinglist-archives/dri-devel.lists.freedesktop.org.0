Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9617E5905
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EAB10E77F;
	Wed,  8 Nov 2023 14:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877E910E779;
 Wed,  8 Nov 2023 14:32:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWHQTGrWuQO6HDU5CBWQ6bdu8cbOTPL/ZD/yDZmy/Bhhi44SmTWHhHfhFEWp2SmJEfoeXnf6gXj2EXB58DHyBgSTqKaj6LEOS9b2N0A0DBUrzY+Ar4U6kILd8bOIKMUmNsFRTt88jNz/X4sIGG7RDZDU08kEebmpVAAu0UJttekb8qJYh/LyzMSCf4slHoVuIjtQqbXZik3qD9bdQDtCEOn8s98KPXeT7WXEyI7lOrOwkKrLVZE/LHH+xwixQaIeETXOg/kE9szuInO7b+5YV6h9lKKPTF1CSNM7oXOf8xAe0mMzvzaMaFSaz+sNIt4p0e9vEx2CH1Fc/Es6pL5Ybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1NXBv0rV2HQHFclQukqyjmLD/5Sxd64xjP+lurSwZM=;
 b=jT1dC1VxOekaitcK5yCgXC5slUn6+glo/N+MNjki5DhbbJOCeVKgU4gkyDsVJtoaKOSaazds9+MG+qNB+a8lAS5oH+zkcIAdylz9P3cxgqQ3vlx69xNnDTOhsbSZ2Ox5RvNAHb0IFxni38xorCkvuaFhl4a2AmhE3whnYnUOs7/sIeAikxIg+fzvbd6nA1hB7bJFnWu0iwDbwTzch+lPiHkPtUwNfwe/K/l6y26vx5YRWr2lbqnu7G+dw8HbJ1x25u/XPHtKr/d94hwm7pipRZIR6e1QhdRyh4+HW7liFw/uf+6CPWt+Utln0lIdwHF3EAj0FgbSTwQm8ISEO7Uepg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1NXBv0rV2HQHFclQukqyjmLD/5Sxd64xjP+lurSwZM=;
 b=vqfFNOd+ETL0YUfPETqSny/sWxmLpZfTNrglxwFTSChyheVnvMsPd2Krd21Ei0qjE6C1PNeKt8n9Wy4K/m2mw0hpBNiXQrHhVHO1ey9Yy7HG7P76NDZ3nckdX2EpseArg7+dwWhWGGen0JIMpNiEy6wz6bpAVO7jCoMCXxy+ReM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 14:32:05 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::5e7e:d568:2bfd:a53a%4]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 14:32:05 +0000
Message-ID: <ebc2d941-9dc8-4d0a-8f00-f323b090c77b@amd.com>
Date: Wed, 8 Nov 2023 09:32:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 00/17] Color Pipeline API w/ VKMS
Content-Language: en-US
To: "Shankar, Uma" <uma.shankar@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <CY5PR11MB6344E6563E758E7F9AE6A601F4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CY5PR11MB6344E6563E758E7F9AE6A601F4A8A@CY5PR11MB6344.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0199.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b332a6-717a-4f3d-cd91-08dbe0677ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OaPuWRFiXjutMkp05g4jv3P7ERTpiKUPPxNiuHEs8uAfyi6wAjiWDk9be0T2Cn2P7vKJXuYMFCiUuPCTYK7KHybnolJ5dTqaA13BokmPI4WCQrXbkvJa7nr5hHikelS1V/mt0q9pL8zuZ+2hdL34dMGx46+dsIvywZTcKR8XGC25OllAhUTs7F7LNReR1X4ZjuS2O0aXAaGUpHrUNpZUxIj3WPb5/cI3/HZncmw9lRkz+Jc1bri5B88kdHwuZpXRaIu1JZRQBJXfxrTZWhvGF/3TRDFYFJjcXvU6KYQGrccW9QF6fl6I+WkAh40GzDHFFFP5w6v7TEib26mnwGI7+8m1O39x6H96+SzO1gJfjdAO1++ee+VQc541uB9D82TxcL/GXuwtuMvhV4gHHgOM/fC4tJQ2nyPZgr5STAzJcznO+GryjNo7f+PRcwb7hOTaHqSeqD9kesp+6EobNIxxYitrFVHGdaIy8iRtUexYImsSyWn7mzIIKNRfPWA9KBM0wwPbxLhVQqpFz7iFw4y8xnGYVKKXdfBJ+M1IISRh1sztKfrTCrt0Zr5hTIXdwIaFozxdNhNI6P0SZ/+BRnCdaNDc7wASl4ptkG9OK/CrKQqbvy/L7fIHh0zwUnyqgrh65UX0sP84eTAQaK14xA3St4DwhcljkOw9KImqbOSgbqzYqudbfhQOAVWkCtwfgHjqmp04sZA/jMZdsbMrtUaMQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(5660300002)(8936002)(2616005)(44832011)(6512007)(66574015)(31696002)(966005)(6486002)(478600001)(36756003)(26005)(66556008)(6506007)(66476007)(110136005)(66946007)(6666004)(54906003)(53546011)(316002)(8676002)(4326008)(2906002)(38100700002)(31686004)(83380400001)(7416002)(41300700001)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDI4dW1RTmppMUVXYnVuRG5wbWh6UnBROEpwSWNTb3dKLzZXRk1xSW1wZUpz?=
 =?utf-8?B?T093alUvS0RJRkdjWStBdTQ0THQ0Nkw3NE56TDRqc1JVTkk3ZllwMG9CbUU0?=
 =?utf-8?B?bytraFhicGwzaWw5STQ0RmFQMnNuWDJEbnV3RFlmaHd2a3RmbG5TK1ZoNFRx?=
 =?utf-8?B?cW9aK0xMVUhoVWFCZFdMakpLbHBzREErdTJzSXhRSlVrUU5GQzV4dXVBWnpR?=
 =?utf-8?B?N0tqVnhTVmxpRXdGUmRkMXZpU0M5aFJaS25HbzZteTBkQW41WkNGU0JoK2Yz?=
 =?utf-8?B?WFpmcklmN3UydTE5L2xLNmpJclhQeDN1cFp5L3ltdWtjeWcybzZobklHWnNY?=
 =?utf-8?B?bGp0SDJPWjdjYVdibEM5WUFLYVkyOWFLSzVRY2RwN3V5YVJLL0ZKT1QrUjlL?=
 =?utf-8?B?NU5kZDVKTEh3Q0JOa2o0ZHlnZjRFL21VWHVORGNqUUdyMlJUR1FKS1p6eUhr?=
 =?utf-8?B?M0hRL1FGOWpIUTNtVFZWZ0JvaWl4NUtjb3V6dnRXYktla0M2UmRRTlJRcFhH?=
 =?utf-8?B?UDRpaU9DczhNMkVYLzRLSGpCdmQrNnhvbHZScWFhd1lYWUJqRGlwb1M2S3Nj?=
 =?utf-8?B?Rk5QZ3gxcDRoU0MrOXZlbkw1UUthcVFRMnJRbmpoYzJCSFZ5Y29OSU5OeDJ6?=
 =?utf-8?B?M0xYT012MmM0ckNqMERndnhBdjhIVU5LYWNoWG1qWDhMVXdHV2tFUkxnRnNQ?=
 =?utf-8?B?YXJ5NVJ6blIvczlmVlhxZTNKUWVzK05ZTzdOL0dFbWw4U0c5TnMzZy9GNGx0?=
 =?utf-8?B?SmVidGVSTFhHQzcwcnFVTGdEbk5mZ3F3L3c0LzJUS3Nxc1FHNDVqbFNHeEI4?=
 =?utf-8?B?V1V5emhQTzdHN3NPcStqUXlVRk03WGhKN3YrNG5mdUZlRmh3cElGcmpWN2dD?=
 =?utf-8?B?bEJpckh2NGgwL3Z3emVFLzd5Z2hKbTkxR29zTDlQeUlkSm5acjFZUndBY0lT?=
 =?utf-8?B?QTk2WFowWjBDbjNpa1ljMkl3R2RjS1EvQllPc0NwOUc1UWZkSkdRMUQ0NU9u?=
 =?utf-8?B?MnRta3Y2YnlLQ0xGWSs5U1Z3RGcwZGpkSWxFTURaWHd1dVpHdk9GdXNubkJt?=
 =?utf-8?B?T00xTk1uSHV3NTNzNnBnVFdzMkpPU3pIY3ZmOHYxdk05R2pKc3lXd0QyWDdD?=
 =?utf-8?B?YXVuSnBlWFM0Z1o2RVVmdEdIcDBlc0M5RDc5cXE0cTdhc2FVNXFUeG10SlF0?=
 =?utf-8?B?L3VjdWlud1gzMHVhWnFxK3hpRmlBZURMSFk3ZVZvdnl4NUE5NWZKMUM4VTl5?=
 =?utf-8?B?cm1yOGx6Z25Ca2dDRGw5UnBGTi80UFl4ak41amRKMWZMRVcvT0NhT2xRcHNj?=
 =?utf-8?B?cHRkSWwxMWIwTGJiOWQvNHFaRmZXeFJNMGJXRWIvaXkxU2Jrb3FEVHlJM1lw?=
 =?utf-8?B?blc0eGZBN1Z1Wk5KWmFoajREM2hBZGI3ME5oMHBkbmZPNnowU3pSZ3Z0RVBP?=
 =?utf-8?B?akVrMUM5cWF0N0lXaHlvdTdMRHk4QVFnS3R5OGlrbk0zV2V4QkdUK1A3MXNq?=
 =?utf-8?B?R3hvRVFxTUdoc3NGem5QR1lWNDFTRHZZNlZ1cUJrTTUvMjhjS1JPZHpSU3lx?=
 =?utf-8?B?OFFKcHZHdHBORUF4RG5ON3VidkV6Y0FteSttNW42ZnNySERRUytEcjFQb2tZ?=
 =?utf-8?B?enl4VzJDN01peXhMQXZwRGI1c3N5OEsvMFh2YlJvZ3Jud0RpbmpZMkN6a0NU?=
 =?utf-8?B?dnQxTGJ5bXNhREpNRGpiK3lnRWRSWWgyaXpLM0w0T3A4UkJvT2R0YVM4VXVH?=
 =?utf-8?B?bjdXWDV6dmZNbmhtVEJ1VHpDT1hTK2haS2FsdkRYODJvV2d3d2VJaWtJNlZP?=
 =?utf-8?B?a00xSURIQUIzS0pzYWpCZG83NFV2dzArN2xlcU5rakt1UU9Ddi9vd0Z0V3ll?=
 =?utf-8?B?OVVncU9lYloxSytZT1dCOExEMFM4OTJrd3hQQVh2V2VITmtNUDNjclFqWVRp?=
 =?utf-8?B?TkI4VStoTnN3SXc1dmRQWXU5RmxLdVgrMytJUG9LT0hDU0F2NlpPK3JqY0xV?=
 =?utf-8?B?bnJtUG5rL0d6VHB3T2trU2hzbW0zaW8xUGJGK3d6VjlWS2FyblBCOWljc1gz?=
 =?utf-8?B?U0tLbGRIZU4rQlJSTWk4UkpTUFdxamJpSkdvYk1LR1JsRStkQm1WcVIwQ1Iw?=
 =?utf-8?Q?eKtt5g3V2ptOjs5zKqk8niPHC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b332a6-717a-4f3d-cd91-08dbe0677ac7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 14:32:05.0930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mP/SUu2gGFah7Nw9qr2suPzOJLqI15+MtrZq/Mp5LIVNTwT4zbScU6pRfcBQoIvP762rUEl/5HtGqHbSp52fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher Braga <quic_cbraga@quicinc.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-11-08 06:54, Shankar, Uma wrote:
> 
> 
>> -----Original Message-----
>> From: Harry Wentland <harry.wentland@amd.com>
>> Sent: Friday, October 20, 2023 2:51 AM
>> To: dri-devel@lists.freedesktop.org
>> Cc: wayland-devel@lists.freedesktop.org; Harry Wentland
>> <harry.wentland@amd.com>; Ville Syrjala <ville.syrjala@linux.intel.com>; Pekka
>> Paalanen <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
>> Melissa Wen <mwen@igalia.com>; Jonas Ådahl <jadahl@redhat.com>; Sebastian
>> Wick <sebastian.wick@redhat.com>; Shashank Sharma
>> <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>; Joshua
>> Ashton <joshua@froggi.es>; Michel Dänzer <mdaenzer@redhat.com>; Aleix Pol
>> <aleixpol@kde.org>; Xaver Hugl <xaver.hugl@gmail.com>; Victoria Brekenfeld
>> <victoria@system76.com>; Sima <daniel@ffwll.ch>; Shankar, Uma
>> <uma.shankar@intel.com>; Naseer Ahmed <quic_naseer@quicinc.com>;
>> Christopher Braga <quic_cbraga@quicinc.com>; Abhinav Kumar
>> <quic_abhinavk@quicinc.com>; Arthur Grillo <arthurgrillo@riseup.net>; Hector
>> Martin <marcan@marcan.st>; Liviu Dudau <Liviu.Dudau@arm.com>; Sasha
>> McIntosh <sashamcintosh@google.com>
>> Subject: [RFC PATCH v2 00/17] Color Pipeline API w/ VKMS
>>
>> This is an early RFC set for a color pipeline API, along with a sample
>> implementation in VKMS. All the key API bits are here.
>> VKMS now supports two named transfer function colorops and we have an IGT
>> test that confirms that sRGB EOTF, followed by its inverse gives us expected
>> results within +/- 1 8 bpc codepoint value.
>>
>> This patchset is grouped as follows:
>>  - Patches 1-2: couple general patches/fixes
>>  - Patches 3-5: introduce kunit to VKMS
>>  - Patch 6: description of motivation and details behind the
>>             Color Pipeline API. If you're reading nothing else
>>             but are interested in the topic I highly recommend
>>             you take a look at this.
>>  - Patches 7-15: Add core DRM API bits
>>  - Patches 15-17: VKMS implementation
>>
>> There are plenty of things that I would like to see here but haven't had a chance
>> to look at. These will (hopefully) be addressed in future iterations:
>>  - Abandon IOCTLs and discover colorops as clients iterate the pipeline
>>  - Add color_pipeline client cap and deprecate existing color encoding and
>>    color range properties.
>>    See https://lists.freedesktop.org/archives/dri-devel/2023-
>> September/422643.html
>>  - Add CTM colorop to VKMS
>>  - Add custom LUT colorops to VKMS
>>  - Add pre-blending 3DLUT with tetrahedral interpolation to VKMS
>>  - How to support HW which can't bypass entire pipeline?
>>  - Add ability to create colorops that don't have BYPASS
>>  - Can we do a LOAD / COMMIT model for LUTs (and other properties)?
>>
>> IGT tests can be found at
>> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1
>>
>> IGT patches are also being sent to the igt-dev mailing list.
>>
>> libdrm changes to support the new IOCTLs are at
>> https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1
>>
>> If you prefer a gitlab MR for review you can find it at
>> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
>>
>> A slightly different approach for a Color Pipeline API was sent by Uma Shankar
>> and can be found at https://patchwork.freedesktop.org/series/123024/
>>
>> The main difference is that his approach is not introducing a new DRM core object
>> but instead exposes color pipelines via blob properties.
>> There are pros and cons to both approaches.
> 
> Thanks Harry and all others who have actively contributed to the design and
> discussions thus far.
> 
> Due to other commitments, we couldn't participate in XDC this time and also
> the delay on our part. Our apologies.
> 
> We looked at the approach and are aligned to go with property-based design,
> with some suggestions. Will follow in comments in respective patches.
> We are also in process of trying this for Intel's hardware to identify if any gaps.
> 

That's great to hear. Thanks, Uma.

Harry

> Regards,
> Uma Shankar
> 
>> v2:
>>  - Rebased on drm-misc-next
>>  - Introduce a VKMS Kunit so we can test LUT functionality in vkms_composer
>>  - Incorporate feedback in color_pipeline.rst doc
>>  - Add support for sRGB inverse EOTF
>>  - Add 2nd enumerated TF colorop to VKMS
>>  - Fix LUTs and some issues with applying LUTs in VKMS
>>
>> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
>> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
>> Cc: Simon Ser <contact@emersion.fr>
>> Cc: Harry Wentland <harry.wentland@amd.com>
>> Cc: Melissa Wen <mwen@igalia.com>
>> Cc: Jonas Ådahl <jadahl@redhat.com>
>> Cc: Sebastian Wick <sebastian.wick@redhat.com>
>> Cc: Shashank Sharma <shashank.sharma@amd.com>
>> Cc: Alexander Goins <agoins@nvidia.com>
>> Cc: Joshua Ashton <joshua@froggi.es>
>> Cc: Michel Dänzer <mdaenzer@redhat.com>
>> Cc: Aleix Pol <aleixpol@kde.org>
>> Cc: Xaver Hugl <xaver.hugl@gmail.com>
>> Cc: Victoria Brekenfeld <victoria@system76.com>
>> Cc: Sima <daniel@ffwll.ch>
>> Cc: Uma Shankar <uma.shankar@intel.com>
>> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
>> Cc: Christopher Braga <quic_cbraga@quicinc.com>
>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Cc: Arthur Grillo <arthurgrillo@riseup.net>
>> Cc: Hector Martin <marcan@marcan.st>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Sasha McIntosh <sashamcintosh@google.com>
>>
>> Harry Wentland (17):
>>   drm/atomic: Allow get_value for immutable properties on atomic drivers
>>   drm: Don't treat 0 as -1 in drm_fixp2int_ceil
>>   drm/vkms: Create separate Kconfig file for VKMS
>>   drm/vkms: Add kunit tests for VKMS LUT handling
>>   drm/vkms: Avoid reading beyond LUT array
>>   drm/doc/rfc: Describe why prescriptive color pipeline is needed
>>   drm/colorop: Introduce new drm_colorop mode object
>>   drm/colorop: Add TYPE property
>>   drm/color: Add 1D Curve subtype
>>   drm/colorop: Add BYPASS property
>>   drm/colorop: Add NEXT property
>>   drm/colorop: Add atomic state print for drm_colorop
>>   drm/colorop: Add new IOCTLs to retrieve drm_colorop objects
>>   drm/plane: Add COLOR PIPELINE property
>>   drm/colorop: Add NEXT to colorop state print
>>   drm/vkms: Add enumerated 1D curve colorop
>>   drm/vkms: Add kunit tests for linear and sRGB LUTs
>>
>>  Documentation/gpu/rfc/color_pipeline.rst      | 347 ++++++++
>>  drivers/gpu/drm/Kconfig                       |  14 +-
>>  drivers/gpu/drm/Makefile                      |   1 +
>>  drivers/gpu/drm/drm_atomic.c                  | 155 ++++
>>  drivers/gpu/drm/drm_atomic_helper.c           |  12 +
>>  drivers/gpu/drm/drm_atomic_state_helper.c     |   5 +
>>  drivers/gpu/drm/drm_atomic_uapi.c             | 110 +++
>>  drivers/gpu/drm/drm_colorop.c                 | 384 +++++++++
>>  drivers/gpu/drm/drm_crtc_internal.h           |   4 +
>>  drivers/gpu/drm/drm_ioctl.c                   |   5 +
>>  drivers/gpu/drm/drm_mode_config.c             |   7 +
>>  drivers/gpu/drm/drm_mode_object.c             |   3 +-
>>  drivers/gpu/drm/drm_plane_helper.c            |   2 +-
>>  drivers/gpu/drm/vkms/Kconfig                  |  20 +
>>  drivers/gpu/drm/vkms/Makefile                 |   6 +-
>>  drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
>>  drivers/gpu/drm/vkms/tests/Makefile           |   4 +
>>  drivers/gpu/drm/vkms/tests/vkms_color_tests.c | 100 +++
>>  drivers/gpu/drm/vkms/vkms_colorop.c           |  85 ++
>>  drivers/gpu/drm/vkms/vkms_composer.c          |  77 +-
>>  drivers/gpu/drm/vkms/vkms_composer.h          |  25 +
>>  drivers/gpu/drm/vkms/vkms_drv.h               |   4 +
>>  drivers/gpu/drm/vkms/vkms_luts.c              | 802 ++++++++++++++++++
>>  drivers/gpu/drm/vkms/vkms_luts.h              |  12 +
>>  drivers/gpu/drm/vkms/vkms_plane.c             |   2 +
>>  include/drm/drm_atomic.h                      |  82 ++
>>  include/drm/drm_atomic_uapi.h                 |   3 +
>>  include/drm/drm_colorop.h                     | 235 +++++
>>  include/drm/drm_fixed.h                       |   2 +-
>>  include/drm/drm_mode_config.h                 |  18 +
>>  include/drm/drm_plane.h                       |  10 +
>>  include/uapi/drm/drm.h                        |   3 +
>>  include/uapi/drm/drm_mode.h                   |  22 +
>>  33 files changed, 2530 insertions(+), 35 deletions(-)  create mode 100644
>> Documentation/gpu/rfc/color_pipeline.rst
>>  create mode 100644 drivers/gpu/drm/drm_colorop.c  create mode 100644
>> drivers/gpu/drm/vkms/Kconfig  create mode 100644
>> drivers/gpu/drm/vkms/tests/.kunitconfig
>>  create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
>>  create mode 100644 drivers/gpu/drm/vkms/tests/vkms_color_tests.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_colorop.c
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_composer.h
>>  create mode 100644 drivers/gpu/drm/vkms/vkms_luts.c  create mode 100644
>> drivers/gpu/drm/vkms/vkms_luts.h  create mode 100644
>> include/drm/drm_colorop.h
>>
>> --
>> 2.42.0
> 

