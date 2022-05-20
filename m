Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B8052E4D5
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 08:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5945D11B495;
	Fri, 20 May 2022 06:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 390 seconds by postgrey-1.36 at gabe;
 Fri, 20 May 2022 06:12:05 UTC
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130A711B497
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1653027123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eftByQOw/98Iyqlou20TtEqZPQMdkwpudL9Nhw9SVt0=;
 b=gA/8B8Vf2oZoRm1OBiJqkEt7ZMVtrwC3yh4Csrz5pGD3VGdrcSfhoioK3iLtUfSFTuGXZy
 P6XTBwf0OzMwid2C0HAIkAxLMGtVNDr/YOHYkWjfWJa3gXG/ofKoTj6r/LIzJCmjE6M7Ev
 GeuTf6msrHL3GAwlYcISP1rV0L0D66k=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-koBqpQerPPO8nhPALlYEgg-2; Fri, 20 May 2022 08:05:28 +0200
X-MC-Unique: koBqpQerPPO8nhPALlYEgg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3KQjM4qp5R7ecaDbrCUMnEGf/qo7T8n2dPXyLhaZ2JcWt0deiPB1OYaR23Hw0D2TTdP4N2S1qxeZNPKuObgTA82J2UIGuXtnsA0yFT584ppU4Z/Z7qOvk6xUKLXxzoknCF3Cxq8gsmToXXC3G+2bwoczRJGRqk0Vw54lVpA0NUw5aIc5IuSh4R3yv2XgPAr5WCi1LVvu6pdLWaovYXXmKuT0Pi3RkekrTjeAh47XDHRvrf63yroKFInrLus7Q0fdXBX33h1emOl8Ufu1226zHktCq1LC9fScLr8VCU+Dj05DkFyO3YBNtKKZthdT6AvrsD6K8ua2UCDvb7wDZtMBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P21rAljciaAKLSv3QWyYdNHHhSpmhmRlZkvtfIBJeeM=;
 b=SqNu0ZKu0wo4kJQjyDpMXwYMaWOX9a8D8FQdIvPMvAsulj+WUnD041W3kmZjc9h68u08V3XENCYt8NwQlOvK+lEPLrmztBQ2oR0QewJOh6McLvbASDWwOCo4wTGmR6cSkBIptGySzQpJ9dLVpVHCAryX7INYjIganE8aeLUtsaBMalzoPTrsG4slQ2pcBPf6/VJnQLohuR/mNapIFtI9IezJ09HVS58MG2X+HOX2FHqe2CV3go6LRL0G3OI/nWXxa03MWqzkKZNG1ISD4H4WbkSK8xPBLDZmXqnrmW1zoELVuzAn09jm9Jqp2P5ZFE9l2YmN7KGgFfeL1C5ARnubvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9066.eurprd04.prod.outlook.com (2603:10a6:10:2f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Fri, 20 May
 2022 06:05:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 06:05:24 +0000
Message-ID: <a2e95587-418b-879f-2468-8699a6df4a6a@suse.com>
Date: Fri, 20 May 2022 08:05:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] x86/pat: add functions to query specific cache mode
 availability
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
References: <20220503132207.17234-1-jgross@suse.com>
 <20220503132207.17234-3-jgross@suse.com>
 <1d86d8ff-6878-5488-e8c4-cbe8a5e8f624@suse.com>
 <0dcb05d0-108f-6252-e768-f75b393a7f5c@suse.com>
 <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <77255e5b-12bf-5390-6910-dafbaff18e96@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P251CA0011.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:50f::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89e43463-1c92-474b-376c-08da3a26baca
X-MS-TrafficTypeDiagnostic: DU2PR04MB9066:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <DU2PR04MB906685AD472BBBBBBFC1B1ADB3D39@DU2PR04MB9066.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ETEc8JRAdWVHpZKwiVrOc7nwAXI8itNVTqRz5VMcrU7SBV+qlyPzbaN12Xl07lNg7mvlW/GBydxdQyoVumdWLupXB22XNEEX7kecGC0sveRs/qrTFBoYr5Ip9gh0T5+xdg0aXg6ycJ4vaQYUHa8JCIk4UbPBfr6IVKLd0ADlMEHNboUdbHIBr1wfB+mwfhrDDs7x3Wqg8st8K6Tx2CKbp6B7JuwGyDUa/2Jjys0pAOhCfvaodOiTzNF0kQ4ScRgSFIHkA8UOSEZ8/H1Lx5vsVX0SiwZtNlqdyY/346Frq56ejR5VkWIJ6b6zk7s2CDkeJ1DO184XA/kLIJaUwJgm9pimDHvbuh8MF8lcV1re+mmbzRfm8Uz9HeV/zeQsV7lDyGQFladm364MWS/71I17pQdTjYz5A2VbIVSv5fse1KXQgrUor2YrZQx76uDub4KTQPCM2SMmpCjrlIf1/OB8vEwvVV7m624KdjLo/nTNWselz48jU+oynQt8nhjrMyfvd/cm99MXkdwQ/zwdGUbmdi7kd0afFXiTo8gQdxm6jMdEMiISYa8K13TtOg2r8h/3akKhbd4ihdE+4/eTDKqNK3Fpk2FZl9q6HJRf2kRDBXftVvoAt3KrpabJ5BjWEhY3xMuSswF1EJSN1WEjZYj8iICGc2CXZsjyeDdHorucH569Ih2cLyYV7jU5sEw0ZDuHItfU0DjQLYrCt6Br7GIHizmHy/f4k15NM3PelAA4OwA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6560.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(83380400001)(316002)(2616005)(36756003)(6916009)(31686004)(38100700002)(66556008)(66946007)(8676002)(4326008)(6486002)(508600001)(107886003)(6512007)(6666004)(2906002)(53546011)(5660300002)(86362001)(8936002)(54906003)(31696002)(6506007)(26005)(66476007)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g48/Tuk3XWFbnSqtRBTSYTbU318qy8GrOJwMMqgwMzGd3UHT/w5KtVf/bhQl?=
 =?us-ascii?Q?Roc2uIZZ0Inq+u5l9utd73cq1poi+7NU073o2JoxZuy6Wzny7r8XECMSUQC/?=
 =?us-ascii?Q?1xCBh6WBpZTP5noCw/GT2Bf2tJgn2CmohdU+lRKUKFoaHGuexHTUP/sZ8p3g?=
 =?us-ascii?Q?KqMhabJNfQ7t1AC9deo+7FY4oKby4iIccsU/MyWxgV8nGiTNAumvAFRyKV03?=
 =?us-ascii?Q?RcNPUvBhpAXWSXY22CP1T9GQC31VhDjfGdTshJwoNV2JxGSDV2jta3cFio8T?=
 =?us-ascii?Q?xW9MzERJPu4URRCUhPlVjt9Y8nqzDKh7qsdYrVRziZ3Z43aXPH9QMT21Zy3q?=
 =?us-ascii?Q?NNFAoWiYodIhD53oYZq7KT2p+5G/qXWgD93Fu66WuG0a3LkI48SXSdejrL6G?=
 =?us-ascii?Q?Ec+DcWEc46QJzuJ540YA0YFLOYG1fJPLF/g53pkhvtR2Kb1k738AtL6dEr9u?=
 =?us-ascii?Q?Eboed82wcxmyZppS9B9+757PqVrnGPDGUbgVQJ7FDi3U6fwbQJy6Ga4HFxlZ?=
 =?us-ascii?Q?W8BXnZDn0+rDP3WYzAsWwdxyiBQL2FSb6SCtPhyxB69HqDlX+ovHL9ku6o7F?=
 =?us-ascii?Q?u0ry6oXyLOwjFiZS0/Mwd3JZKo4mw3u3a/09sT1X6Zf3uLol8NoHiX76npSX?=
 =?us-ascii?Q?Jwc7qboNnYAq75pm0mXpV8NSDj7vGIr6yLXAJ5s30p4uS686tuoAWRMeYSfg?=
 =?us-ascii?Q?64+1ARwLr4Jg+azL+HnMxsl55mZuG9ehc9WAVeORabjGfXTLSRDoDyFG0v/0?=
 =?us-ascii?Q?+IXqIV5VU4ARu7mePLbgb1Oo3sv35KIehFY3Ynjmf1uqVDwqkiZ6bUtwPXnf?=
 =?us-ascii?Q?QWPmX7JKCjKeZUiJBQPysqTA5QGvFJuKvGPcg9CZb8dlrhhmILvyie/6yRRM?=
 =?us-ascii?Q?J0z0ejpLV/0J9sv7geO5adwFcOimZjF+T+SbfnXYw9b5ik1ar04xy5v5tdr0?=
 =?us-ascii?Q?juUNv1oOZ8p06auQdR8AEUGEFRmXmFbUOgczPvdJQyWIzkPhY58evLMnYSbf?=
 =?us-ascii?Q?Mhp5nXT3pxsU6kBH3nZzC71ajbaILW/JsjEwUOWIaSQ4XN1RQitUI+WmgF6j?=
 =?us-ascii?Q?nPOOH8rtk97akb2ZyTUbeiSfYtzOq52qQ27lkFKHe8TpImJ8IrQZwPuqu4Yk?=
 =?us-ascii?Q?m5DW5gQnr17VCXHh7QtkJU+b2Z7zzDbuUFEisL9PBb5GJtqjSaZ+MD0Edp9X?=
 =?us-ascii?Q?l46MsjzV603+C77Hg77qUZe430pXlTeVwQAnWiM0+JX5gBpK4Wn3DFqxNkcU?=
 =?us-ascii?Q?eBCpLxLMBAHshkT502SsmyFXs9yD9T8mCP/yXmrVNKQRieQuGC+e8GlFRxZt?=
 =?us-ascii?Q?PiEldgLAUukpXmPfT2pZGkDlV7jPxWttDPibZjxDYRS93LPmDX56IxgUhDDn?=
 =?us-ascii?Q?EPaNAelsbiL1rvpMBv3mqSys8+y91L5xJj8p5wnUo41VY3s3mizEU8qodtq7?=
 =?us-ascii?Q?IOoyURw3ifMXEHBeycXMr1qY5rzxjVahy2xjs47DIczyi8FKjK6Kc8iFeJuL?=
 =?us-ascii?Q?RMnQaqSYJCpwIyJXSrEcD2HkWq9A7Ah3GErNfrBplZ1YE6GCpEcpXHXSPhUS?=
 =?us-ascii?Q?zr20I6lVYGCLD4KULrF933NpizjBUQ19QHuiKQswA/U+2kQGt/GbZvOIdM9O?=
 =?us-ascii?Q?WdspQlp3M/F3K8JJBFV+jtOaclbWnaRfd30Rgv9Ts+sQphziPfh33WQQChpZ?=
 =?us-ascii?Q?bXlzfBkVZtUPFMmTMZ13CzOsuWJnlAveSbCysrsZkJh4AsHHJ3nMtSP45Wqj?=
 =?us-ascii?Q?dRDrbl8Dzw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89e43463-1c92-474b-376c-08da3a26baca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 06:05:24.5360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H2WUDTGiEHuZmmVuglqYS/UwXc6+bkKPBmjlCfHQOA4kSEEBTV5kD/OW7CEkFidsY/5r7LXByR3cn7+zAo/GAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9066
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
Cc: Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel@lists.freedesktop.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.05.2022 06:43, Chuck Zmudzinski wrote:
> On 5/4/22 5:14 AM, Juergen Gross wrote:
>> On 04.05.22 10:31, Jan Beulich wrote:
>>> On 03.05.2022 15:22, Juergen Gross wrote:
>>>> Some drivers are using pat_enabled() in order to test availability of
>>>> special caching modes (WC and UC-). This will lead to false negatives
>>>> in case the system was booted e.g. with the "nopat" variant and the
>>>> BIOS did setup the PAT MSR supporting the queried mode, or if the
>>>> system is running as a Xen PV guest.
>>> ...
>>>> Add test functions for those caching modes instead and use them at the
>>>> appropriate places.
>>>>
>>>> Fixes: bdd8b6c98239 ("drm/i915: replace X86_FEATURE_PAT with=20
>>>> pat_enabled()")
>>>> Fixes: ae749c7ab475 ("PCI: Add arch_can_pci_mmap_wc() macro")
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ...
>>>
>>>> --- a/arch/x86/include/asm/pci.h
>>>> +++ b/arch/x86/include/asm/pci.h
>>>> @@ -94,7 +94,7 @@ int pcibios_set_irq_routing(struct pci_dev *dev,=20
>>>> int pin, int irq);
>>>> =C2=A0 =C2=A0 =C2=A0 #define HAVE_PCI_MMAP
>>>> -#define arch_can_pci_mmap_wc()=C2=A0=C2=A0=C2=A0 pat_enabled()
>>>> +#define arch_can_pci_mmap_wc()=C2=A0=C2=A0=C2=A0 x86_has_pat_wc()
>>>
>>> Besides this and ...
>>>
>>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>>>> @@ -76,7 +76,7 @@ i915_gem_mmap_ioctl(struct drm_device *dev, void=20
>>>> *data,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->flags & ~(I915_MMAP_WC))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (args->flags & I915_MMAP_WC && !pat_enab=
led())
>>>> +=C2=A0=C2=A0=C2=A0 if (args->flags & I915_MMAP_WC && !x86_has_pat_wc(=
))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 obj =3D i915_gem_object_lookup(f=
ile, args->handle);
>>>> @@ -757,7 +757,7 @@ i915_gem_dumb_mmap_offset(struct drm_file *file,
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (HAS_LMEM(to_i915(dev)))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmap_type =3D I=
915_MMAP_TYPE_FIXED;
>>>> -=C2=A0=C2=A0=C2=A0 else if (pat_enabled())
>>>> +=C2=A0=C2=A0=C2=A0 else if (x86_has_pat_wc())
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmap_type =3D I=
915_MMAP_TYPE_WC;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (!i915_ggtt_has_aperture(to_gt(=
i915)->ggtt))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>>>> @@ -813,7 +813,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device=20
>>>> *dev, void *data,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case I915_MMAP_OFFSET_WC:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pat_enabled())
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!x86_has_pat_wc())
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -ENODEV;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type =3D I915_M=
MAP_TYPE_WC;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> @@ -823,7 +823,7 @@ i915_gem_mmap_offset_ioctl(struct drm_device=20
>>>> *dev, void *data,
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case I915_MMAP_OFFSET_UC:
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!pat_enabled())
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!x86_has_pat_uc_minus(=
))
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return -ENODEV;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type =3D I915_M=
MAP_TYPE_UC;
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>
>>> ... these uses there are several more. You say nothing on why those wan=
t
>>> leaving unaltered. When preparing my earlier patch I did inspect them
>>> and came to the conclusion that these all would also better observe the
>>> adjusted behavior (or else I couldn't have left pat_enabled() as the=20
>>> only
>>> predicate). In fact, as said in the description of my earlier patch, in
>>> my debugging I did find the use in i915_gem_object_pin_map() to be the
>>> problematic one, which you leave alone.
>>
>> Oh, I missed that one, sorry.
>=20
> That is why your patch would not fix my Haswell unless
> it also touches i915_gem_object_pin_map() in
> drivers/gpu/drm/i915/gem/i915_gem_pages.c
>=20
>>
>> I wanted to be rather defensive in my changes, but I agree at least the
>> case in arch_phys_wc_add() might want to be changed, too.
>=20
> I think your approach needs to be more aggressive so it will fix
> all the known false negatives introduced by bdd8b6c98239
> such as the one in i915_gem_object_pin_map().
>=20
> I looked at Jan's approach and I think it would fix the issue
> with my Haswell as long as I don't use the nopat option. I
> really don't have a strong opinion on that question, but I
> think the nopat option as a Linux kernel option, as opposed
> to a hypervisor option, should only affect the kernel, and
> if the hypervisor provides the pat feature, then the kernel
> should not override that,

Hmm, why would the kernel not be allowed to override that? Such
an override would affect only the single domain where the
kernel runs; other domains could take their own decisions.

Also, for the sake of completeness: "nopat" used when running on
bare metal has the same bad effect on system boot, so there
pretty clearly is an error cleanup issue in the i915 driver. But
that's orthogonal, and I expect the maintainers may not even care
(but tell us "don't do that then").

Jan

> but because of the confusion, maybe
> a warning could be printed with the nopat option when a
> hypervisor provides the feature so the user can at least have a
> knob to tweak if if does not behave the way the user intends.
> But I must admit, I don't know if the Xen hypervisor has an
> option also to disable pat. If not, then maybe Jan's more
> aggressive approach with nopat might be needed if for
> some reason pat really needs to be disabled in the Linux
> when Linux is running on Xen or another hypervisor, but I don't
> know of any cases when that would be needed.
>=20
> Chuck
>=20

