Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F248782604
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 11:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8174010E07B;
	Mon, 21 Aug 2023 09:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1AF210E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 09:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fY1AcVSAnkT3v49vD4Px74i4xkGwOe1XMGkT7wVwudfp7pOqEOQg0/X8EyHER/VbmfgYsV7WLuH7iOOdHmgLs2Q6NNzw9Sxs0/PMib9ylI10VtnLKE8dkeUKzFtqIdJqUPk1sY4u/2lzQkR4FkT0j4MzfPOPlZjfsmHbSHduQ02wLC6cFNyU+/Tm79RmMlf8FxkiYSOnIWJXSB061owKxQTlvZOU/OdKPzTpM8p7PHvhit7zjmzokrshXmLSUN52EdRysaD92XrriHzlxKAeQT9Eoy3prA7IVILuyob+8qq3gP8oAbTJd8FcTDfEuiwwRPx2lcpaScHk0Ni323NTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xyI8hsorToWOTWGMrK4/iiXa2KDML5RIksR5cGfz3Y=;
 b=U5TZ2IZyXUxmr95ozuza8JSIwAnEDiMRRhN+y+NRJFyW3fdr7jC/dt4clrsPNZP97wEV7KR6jY5BZpRBIGlYVc9MBcnSCxuhUTIyDrsCAZkmpquFGPYhxC/tW0pvw5wUas9yB0Sd8BjU2CMxiAs0MZRAiwodhn5ySXvyFIOPNzJg0QhLPRIhymb+tKz3RSQgEj3ATBDVunJgx7QIHqnHtOds6n0uHz4JxEmiXF0swRDMwIBPyGRDi5vISy0rdmwNXuBcVIkesfKxTJXTHEEMq29V0ubW7bGIj05WNoMb8e0ECuDQDth6lUcVsFjKmHx1V0h6IkXY2yvFxfSlKYEbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xyI8hsorToWOTWGMrK4/iiXa2KDML5RIksR5cGfz3Y=;
 b=Fjs2s81IVwBc9GVLCeU2dbZVwG01JHkqtInQUlMvhWwW6iw7yz1p59XeD5uN2MedNtEvu7lZn6uHzkIeGXg3RV0aCGvGuKjzbqX0CtjXAgOfImFGBH/4cPzkOiQiZ2IVb0hkPpwLahpAcozd20buFVGXzfsNkOETQI0tIhjCu9eSlLUDYtK/YNrEjQmbUZUfLNWvPMfj1fEo+Wn1JJ/dyfo9BqEDuVR2gm4Tz9ccUXfi45K5q3B6I/20TE0KOeObqgs826R4Nnl8+aPz1LeRyUmdXRGl9zjZBSg4Ox7zkPghfAQOdZhlcXUQBOYxOUgzFsTfqWEuc3LEWgShmcChkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 09:05:36 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::3bf6:11f3:64d7:2475]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::3bf6:11f3:64d7:2475%7]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 09:05:36 +0000
References: <3427735b-2a73-2df7-ebd9-0d1066a55771@redhat.com>
 <IA0PR11MB7185CF1FDFA5D5EDE3B6AF08F80AA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMlMoRIkPoO0gG3B@nvidia.com>
 <IA0PR11MB7185304345516521FA3005C2F808A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMuaQ4vpv03GTPbF@nvidia.com>
 <2aee6681-f756-9ace-74d8-2f1e1e7b3ae6@redhat.com>
 <87cz0364kx.fsf@nvdebian.thelocal>
 <IA0PR11MB7185974FA204015EA3B74066F809A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZMzz2OKbmiD6SKPE@nvidia.com>
 <IA0PR11MB718593A011700F06BD6414E8F80DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <ZNI4KV+Z7CvffiHI@nvidia.com>
 <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
User-agent: mu4e 1.8.13; emacs 28.2
From: Alistair Popple <apopple@nvidia.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Subject: Re: [RFC v1 1/3] mm/mmu_notifier: Add a new notifier for mapping
 updates (new pages)
Date: Mon, 21 Aug 2023 19:02:28 +1000
In-reply-to: <IA0PR11MB71857FDD99CAC23C88C9F27CF815A@IA0PR11MB7185.namprd11.prod.outlook.com>
Message-ID: <87h6oswysm.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYAPR01CA0030.ausprd01.prod.outlook.com (2603:10c6:1:1::18)
 To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 070f403e-5163-47da-c73f-08dba225c822
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0R6ap5iTBQo7X5pgZzMNR3N5KZOCyNEQAMvHK3MZMFayN7vkwfnA2drlGnqokm555sMML7qs42Lj8kReXZ3CJwWD6QNDZdRHXq/adsYZuWcrrggGhqXQ26d6O4EBm+nlbkt0KJcyMtceCy859grWmZXAetlGf8N7edS/pEfmofRPZTRN91MByye981FeTPXtIJ9aANGTmzQMg1SPfxDWpQWNen+IvBD3x7Z8CHtsckvz7m0U6hwolV7RZQQRsH1G9eMwVw3uDVJ08xdJn/iMRTNEA/PG7N93yz4eqCio6SH5igJ5R25rkq4GEO/mAbsvMfu8Gb1oNFj/tV0T+vwFR0Z3EJwvDurdVYTAjbBXMsw3knpU+t8WUbu932tZKWRKNSPNEaYVtH6RyQyL5s2hCpBfio+QVZcQ7j7QRgAjKOJFTTB1w8c6DoG9aR0HJItXOx1J+L2GgD4Ao/ET0PGxSf9rgWep7RLgnUvTrOhC2UqTqGtvbepEpVMVsG1qPf/iNrhoM7zQ591J1S7lPUPXqvUXNaNKq5VfOkhcpezpy/itFHRi1rYyg+E5Lyr1iYwY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199024)(186009)(1800799009)(2906002)(83380400001)(7416002)(38100700002)(6506007)(6486002)(15650500001)(5660300002)(26005)(86362001)(8676002)(8936002)(4326008)(316002)(9686003)(6512007)(66946007)(6916009)(54906003)(66556008)(66476007)(478600001)(6666004)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pxr3Hnelp/PegbnSETZbks0D1W3smH/nyVcr/iA2leX9dsh2PaxlDm7OTAB5?=
 =?us-ascii?Q?Kelk1024mgUonJQcEL6H9+EyM0zOsYmnkw0f1UDL1VFzj0am5sFmU2oy3Acg?=
 =?us-ascii?Q?WWS/zRMN48A7IxcP0pivXdFZXjLW2SRxZ3+bJ/dLcFYcaAHztMo6SPS5+0o3?=
 =?us-ascii?Q?zv3+PicRQ3LyoPYPGtJSrDtkqUE8OvI201C9ues8gHRyvKjs8+DUkOBUrKY3?=
 =?us-ascii?Q?qmo8hbYPRor2wnPORWA2/s36wdC3vlujm55/bfGKmDuf8IrLcCaR861GsFEY?=
 =?us-ascii?Q?UFU2fymgZJEO/sg8oBMSIlxbt/Nw0UQ1RFVj+n/jPwcpFOMyi6tcjAKQAo7l?=
 =?us-ascii?Q?bzejmRKd3ocoFtAHKMNbzJTPbAlq4D9wyIN3upYMWca6B/zeyEUkmqMk9dCI?=
 =?us-ascii?Q?rMcCv60dXKPv3GRHvejedbceoQVX6yseW1LQYOFTxmRIdR6PsVuymeMc1Psc?=
 =?us-ascii?Q?5x06cUgEMTz3Fy/4pNEs0UwS7XwSOt5C1y5HXhC8s0yU4PJidWx5iWdLu+bS?=
 =?us-ascii?Q?BWb9KyeuRLNIwVx20mS0jlUATSE1vxaIbJFHAoguM5UIaOgmkit8jyiy0XTe?=
 =?us-ascii?Q?s4pNLH+jOHgMDJ9IqMfpBqqu4YOkfX8CQ1qIiH/ayeSiB33bl/fjTnkdlnpE?=
 =?us-ascii?Q?L8jVlFT4UmwoSA0T37qauGT7Ng8AGpNRwAlAA1H0mZGhfXRR+lSByh/aVSuH?=
 =?us-ascii?Q?xRlPcYRVevrtt9n3joRfbC32lf9dejMNK67NXHa9vVdwRcF2Kv3e9zNLBa59?=
 =?us-ascii?Q?g32UyotizxgUyOBEQg1Qm66hbpvJipITfThyAHCc4s4RhosSAt2bJVETB3bm?=
 =?us-ascii?Q?MWp4GMGOqdGaoUE0MPYByagkELk0qusOkmpJsghBwmHFQlHfZvrRRBanJAat?=
 =?us-ascii?Q?n9PGyZxzu9DiPONPIzDbd1KT5V6jQQJidO3VnZGOIUdwm7n5qrrluipGzWNO?=
 =?us-ascii?Q?Xg51WWjA0ggk6fxVYXG3Z69pcpjrASE7+LwOxnFlrECgGpRuF3yytjWvAvvP?=
 =?us-ascii?Q?tsmsi2/lV3B0vdelbpFdidiG0/iQuLmq0/JeW67WjHtxAAGi/LbcZmS28JU0?=
 =?us-ascii?Q?ygAaHemJ0nhF8eg204/Qm2NU41ic0PZslZrZomGB8mOx31T8vrJtRlE6aS51?=
 =?us-ascii?Q?EweyEq/RtnwShvVX70WzEzQGl/GofhwAR8V2GCkLrTwWh4TdolwxK9dZ/z1Q?=
 =?us-ascii?Q?DAkGmlZobFgsSQYpaqPspyMKQCmMl8M6iDF7uAM4UIqQm+fiBduC/Y7qseB4?=
 =?us-ascii?Q?zzPiiOsIqDkAL79jjO3Qnu2sYuEbwumQvJXU/bOc7difVbnQZ50fVoK6wp6I?=
 =?us-ascii?Q?+iDg8XFC2GPQzHLTsPMKZGsGqqFYIlWqeUCt+OPjNs2sCto+b7e9UIyYIODQ?=
 =?us-ascii?Q?XaZXJ2JMQ7hbO2gRRV7ipn8XsQK04aIz0j74pM/p1Ksct9fPHETnx93m6STB?=
 =?us-ascii?Q?EQPfhMbGmu7HgDHqiTIKCmWgtBvAvyWDdB4g59OsX4NE/zzLe8a6nOt4kInv?=
 =?us-ascii?Q?Yinx63TKuAPahYv4ZtW4YH33HZ4CjaWeSqhCvbXn5S94KGe7AdPH+QzVn6tL?=
 =?us-ascii?Q?du7ugbQ9GHVziNDRNcD9G+m5MT0h5/caFaFAl7c/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 070f403e-5163-47da-c73f-08dba225c822
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 09:05:36.0199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EopV6KN29lpJnB8TeJf+JPUGkot/haN8exjngp0klgbAELZZ5u9qf2OuZfYkJHTNe7yup2ZCZS2ru91D9YtEMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
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
Cc: "Kim, Dongwon" <dongwon.kim@intel.com>,
 David Hildenbrand <david@redhat.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>, Hugh Dickins <hughd@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Jason,
>
>> > >
>> > > > No, adding HMM_PFN_REQ_WRITE still doesn't help in fixing the issue.
>> > > > Although, I do not have THP enabled (or built-in), shmem does not evict
>> > > > the pages after hole punch as noted in the comment in
>> shmem_fallocate():
>> > >
>> > > This is the source of all your problems.
>> > >
>> > > Things that are mm-centric are supposed to track the VMAs and changes
>> to
>> > > the PTEs. If you do something in userspace and it doesn't cause the
>> > > CPU page tables to change then it certainly shouldn't cause any mmu
>> > > notifiers or hmm_range_fault changes.
>> > I am not doing anything out of the blue in the userspace. I think the
>> behavior
>> > I am seeing with shmem (where an invalidation event
>> (MMU_NOTIFY_CLEAR)
>> > does occur because of a hole punch but the PTEs don't really get updated)
>> > can arguably be considered an optimization.
>> 
>> Your explanations don't make sense.
>> 
>> If MMU_NOTIFER_CLEAR was sent but the PTEs were left present then:
>> 
>> > > There should still be an invalidation notifier at some point when the
>> > > CPU tables do eventually change, whenever that is. Missing that
>> > > notification would be a bug.
>> > I clearly do not see any notification getting triggered (from both
>> shmem_fault()
>> > and hugetlb_fault()) when the PTEs do get updated as the hole is refilled
>> > due to writes. Are you saying that there needs to be an invalidation event
>> > (MMU_NOTIFY_CLEAR?) dispatched at this point?
>> 
>> You don't get to get shmem_fault in the first place.
> What I am observing is that even after MMU_NOTIFY_CLEAR (hole punch) is sent,
> hmm_range_fault() finds that the PTEs associated with the hole are still pte_present().
> I think it remains this way as long as there are reads on the hole. Once there are
> writes, it triggers shmem_fault() which results in PTEs getting updated but without
> any notification.

Oh wait, this is shmem. The read from hmm_range_fault() (assuming you
specified HMM_PFN_REQ_FAULT) will trigger shmem_fault() due to the
missing PTE. Subsequent writes will just upgrade PTE permissions
assuming the read didn't map them RW to begin with. If you want to
actually see the hole with hmm_range_fault() don't specify
HMM_PFN_REQ_FAULT (or _WRITE).

>> 
>> If they were marked non-prsent during the CLEAR then the shadow side
>> remains non-present until it gets its own fault.
>> 
>> If they were made non-present without an invalidation then that is a
>> bug.
>> 
>> > > hmm_range_fault() is the correct API to use if you are working with
>> > > notifiers. Do not hack something together using pin_user_pages.
>> 
>> > I noticed that hmm_range_fault() does not seem to be working as expected
>> > given that it gets stuck(hangs) while walking hugetlb pages.
>> 
>> You are the first to report that, it sounds like a serious bug. Please
>> try to fix it.
>> 
>> > Regardless, as I mentioned above, the lack of notification when PTEs
>> > do get updated due to writes is the crux of the issue
>> > here. Therefore, AFAIU, triggering an invalidation event or some
>> > other kind of notification would help in fixing this issue.
>> 
>> You seem to be facing some kind of bug in the mm, it sounds pretty
>> serious, and it almost certainly is a missing invalidation.
>> 
>> Basically, anything that changes a PTE must eventually trigger an
>> invalidation. It is illegal to change a PTE from one present value to
>> another present value without invalidation notification.
>> 
>> It is not surprising something would be missed here.
> As you suggest, it looks like the root-cause of this issue is the missing
> invalidation notification when the PTEs are changed from one present

I don't think there's a missing invalidation here. You say you're seeing
the MMU_NOTIFY_CLEAR when hole punching which is when the PTE is
cleared. When else do you expect a notification?

> value to another. I'd like to fix this issue eventually but I first need to
> focus on addressing udmabuf page migration (out of movable zone)
> and also look into the locking concerns Daniel mentioned about pairing
> static and dynamic dmabuf exporters and importers.
>
> Thanks,
> Vivek

