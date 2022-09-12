Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998E65B6212
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 22:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FCD10E172;
	Mon, 12 Sep 2022 20:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00190b01.pphosted.com (mx0a-00190b01.pphosted.com
 [IPv6:2620:100:9001:583::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7219210E172;
 Mon, 12 Sep 2022 20:17:12 +0000 (UTC)
Received: from pps.filterd (m0050095.ppops.net [127.0.0.1])
 by m0050095.ppops.net-00190b01. (8.17.1.5/8.17.1.5) with ESMTP id
 28CGn0s1000316; Mon, 12 Sep 2022 21:17:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=PPtZHmCIQVuM9YXzLPNtRwdGAqaP/tT/4KH6zim4BTk=;
 b=J0a0BInST46lwTEIr0aqv3RDPnHNzZzbc/gn++frBD8awWms+RF0UxiEe2dSINuE/0Ul
 xA9klHjTwJu/NOFKI+q3hwjlk4r+pWtVammua4QSu6FgXqxvSki5PX/gtYg0laUE5tFw
 RKhQwNGCyyow5pczu6GvQEPB22usQC9T+vn0YgSKPSSRumn/GeHDmTzZ+Mg5ykATKjDs
 WPHJa4fC/c/4CyQsb8BbVntxkB/D9yqcFmH40HSv6v4g5419glK47rJrmlZeozCs8pnr
 1S9MN1H9Kj3IqyHtQLeEUkp7/4Zgi4dVE4F21z9UqOnJMy5Xu/9/DU/fyFlasyPi8Zjm Zg== 
Received: from prod-mail-ppoint7
 (a72-247-45-33.deploy.static.akamaitechnologies.com [72.247.45.33] (may be
 forged))
 by m0050095.ppops.net-00190b01. (PPS) with ESMTPS id 3jgk46s9gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 21:17:03 +0100
Received: from pps.filterd (prod-mail-ppoint7.akamai.com [127.0.0.1])
 by prod-mail-ppoint7.akamai.com (8.17.1.5/8.17.1.5) with ESMTP id
 28CIUslV017697; Mon, 12 Sep 2022 16:17:02 -0400
Received: from prod-mail-relay18.dfw02.corp.akamai.com ([172.27.165.172])
 by prod-mail-ppoint7.akamai.com (PPS) with ESMTP id 3jgnxvdfbx-1;
 Mon, 12 Sep 2022 16:17:02 -0400
Received: from [0.0.0.0] (unknown [172.27.119.138])
 by prod-mail-relay18.dfw02.corp.akamai.com (Postfix) with ESMTP id 38EF1FA;
 Mon, 12 Sep 2022 20:17:01 +0000 (GMT)
Message-ID: <0d9f644f-3d60-02c3-7ce0-01296757e181@akamai.com>
Date: Mon, 12 Sep 2022 16:17:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 17/57] dyndbg: validate class FOO by checking with
 module
Content-Language: en-US
To: jim.cromie@gmail.com
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-18-jim.cromie@gmail.com>
 <2d3846cb-ff9a-3484-61a8-973799727d8f@akamai.com>
 <CAJfuBxzM=KKPbcks-aQLAJM0QVd5sjL-CucYbyFbeG5sgoCVjg@mail.gmail.com>
From: Jason Baron <jbaron@akamai.com>
In-Reply-To: <CAJfuBxzM=KKPbcks-aQLAJM0QVd5sjL-CucYbyFbeG5sgoCVjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_14,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120067
X-Proofpoint-ORIG-GUID: NWqNNT8JvyIz1ZmPTHNe_ca5jdhHGLod
X-Proofpoint-GUID: NWqNNT8JvyIz1ZmPTHNe_ca5jdhHGLod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_14,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120068
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/9/22 16:44, jim.cromie@gmail.com wrote:
> On Wed, Sep 7, 2022 at 12:19 PM Jason Baron <jbaron@akamai.com> wrote:
>>
>>
>>
>> On 9/4/22 17:40, Jim Cromie wrote:
>>> Add module-to-class validation:
>>>
>>>   #> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
>>>
>>> If a query has "class FOO", then ddebug_find_valid_class(), called
>>> from ddebug_change(), requires that FOO is known to module X,
>>> otherwize the query is skipped entirely for X.  This protects each
>>> module's class-space, other than the default:31.
>>>
>>> The authors' choice of FOO is highly selective, giving isolation
>>> and/or coordinated sharing of FOOs.  For example, only DRM modules
>>> should know and respond to DRM_UT_KMS.
>>>
>>> So this, combined with module's opt-in declaration of known classes,
>>> effectively privatizes the .class_id space for each module (or
>>> coordinated set of modules).
>>>
>>> Notes:
>>>
>>> For all "class FOO" queries, ddebug_find_valid_class() is called, it
>>> returns the map matching the query, and sets valid_class via an
>>> *outvar).
>>>
>>> If no "class FOO" is supplied, valid_class = _CLASS_DFLT.  This
>>> insures that legacy queries do not trample on new class'd callsites,
>>> as they get added.
>>
>>
>> Hi Jim,
>>
>> I'm wondering about the case where we have a callsite which is marked
>> as 'class foo', but the query string is done by say module and file, so:
>>
>> # echo "module bar file foo.c +p" > /proc/dynamic_debug_control
>>
>> With the proposed code, I think this ends up not enabling anything right?
> 
> correct - the only way to enable :    pr_debug_cls(CL_FOO, " ...")
> is
>    echo class CL_FOO +p > control
> 
> 1st, existing dyndbg query uses, whether ad-hoc or scripted,
> were not written in anticipation of new / classified subsystems.
> 
> 2nd, new class users dont want to sit in coach. no damn legroom.
> 
> 3rd, consider DRM, which already has drm.debug
> ie:  /sys/module/drm/parameters/debug
> and prefers it, at least by inertia.
> protecting these new class'd callsites (3-5k of them)
> from casual (unintended) manipulations of the kernel-wide
> dyndbg state seems prudent, and a usability win.
> 
> Not everyone will use module bar, requiring "class foo"
> guarantees that changes are intentional.
> 

I sort of get that your trying to protect these from unintended toggling,
but I would say it's that's not really new with these statements,
prr_debug() come and go before and I'm not aware of this is an issue.
And in any case, a query can be modified.

I think what bugs me is now query stuff works differently. Previously,
all the query strings - 'module', 'file', 'line', 'format', were
used as additional selectors, but now we have this new one 'class'
that works differently as it's requited for pr_debug_cls() statements.

> 
> 
>> Because valid class is set to _DPRINTK_CLASS_DFLT and then:
>> 'dp->class_id != valid_class' is true?
>>
>> This seems confusing to me as a user as this doesn't work like the
>> other queries....so maybe we should only do the
>> 'dp->class_id != valid_class' check *if* query->class_string is set,
>> see below.
>>
> 
> Could you clarify whether you think this is a logic error
> or a frame-of-reference difference as elaborated above ?

'frame-of-reference' I'm questioning the how 'class' works as mentioned
above not the implementation.

Thanks,

-Jason

> 
> ISTM theres a place for a well-worded paragraph in doc
> about the class distinction, perhaps a whole for-authors section.
> 
> 
> 
>>
>>
>>>
>>> Also add a new column to control-file output, displaying non-default
>>> class-name (when found) or the "unknown _id:", if it has not been
>>> (correctly) declared with one of the declarator macros.
>>>
>>> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>>> ---
>>>  lib/dynamic_debug.c | 76 ++++++++++++++++++++++++++++++++++++++++-----
>>>  1 file changed, 68 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
>>> index b71efd0b491d..db96ded78c3f 100644
>>> --- a/lib/dynamic_debug.c
>>> +++ b/lib/dynamic_debug.c
>>> @@ -56,6 +56,7 @@ struct ddebug_query {
>>>       const char *module;
>>>       const char *function;
>>>       const char *format;
>>> +     const char *class_string;
>>>       unsigned int first_lineno, last_lineno;
>>>  };
>>>
>>> @@ -136,15 +137,33 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
>>>                       fmtlen--;
>>>       }
>>>
>>> -     v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u\n",
>>> -              msg,
>>> -              query->function ?: "",
>>> -              query->filename ?: "",
>>> -              query->module ?: "",
>>> -              fmtlen, query->format ?: "",
>>> -              query->first_lineno, query->last_lineno);
>>> +     v3pr_info("%s: func=\"%s\" file=\"%s\" module=\"%s\" format=\"%.*s\" lineno=%u-%u class=%s\n",
>>> +               msg,
>>> +               query->function ?: "",
>>> +               query->filename ?: "",
>>> +               query->module ?: "",
>>> +               fmtlen, query->format ?: "",
>>> +               query->first_lineno, query->last_lineno, query->class_string);
>>>  }
>>>
>>> +static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
>>> +                                                       const char *class_string, int *class_id)
>>> +{
>>> +     struct ddebug_class_map *map;
>>> +     int idx;
>>> +
>>> +     list_for_each_entry(map, &dt->maps, link) {
>>> +             idx = match_string(map->class_names, map->length, class_string);
>>> +             if (idx >= 0) {
>>> +                     *class_id = idx + map->base;
>>> +                     return map;
>>> +             }
>>> +     }
>>> +     *class_id = -ENOENT;
>>> +     return NULL;
>>> +}
>>> +
>>> +#define __outvar /* filled by callee */
>>>  /*
>>>   * Search the tables for _ddebug's which match the given `query' and
>>>   * apply the `flags' and `mask' to them.  Returns number of matching
>>> @@ -159,6 +178,8 @@ static int ddebug_change(const struct ddebug_query *query,
>>>       unsigned int newflags;
>>>       unsigned int nfound = 0;
>>>       struct flagsbuf fbuf, nbuf;
>>> +     struct ddebug_class_map *map = NULL;
>>> +     int __outvar valid_class;
>>>
>>>       /* search for matching ddebugs */
>>>       mutex_lock(&ddebug_lock);
>>> @@ -169,9 +190,22 @@ static int ddebug_change(const struct ddebug_query *query,
>>>                   !match_wildcard(query->module, dt->mod_name))
>>>                       continue;
>>>
>>> +             if (query->class_string) {
>>> +                     map = ddebug_find_valid_class(dt, query->class_string, &valid_class);
>>> +                     if (!map)
>>> +                             continue;
>>
>> So remove the else here.
>>
>>> +             } else {
>>> +                     /* constrain query, do not touch class'd callsites */
>>> +                     valid_class = _DPRINTK_CLASS_DFLT;
>>> +             }
>>> +
>>>               for (i = 0; i < dt->num_ddebugs; i++) {
>>>                       struct _ddebug *dp = &dt->ddebugs[i];
>>>
>>> +                     /* match site against query-class */
>>> +                     if (dp->class_id != valid_class)
>>
>> And then make this: if (query->class_string && (dp->class_id != valid_class))
>>
>> thoughts?
>>
>>
>>> +                             continue;
>>> +>                    /* match against the source filename */
>>>                       if (query->filename &&
>>>                           !match_wildcard(query->filename, dp->filename) &&
>>> @@ -420,6 +454,8 @@ static int ddebug_parse_query(char *words[], int nwords,
>>>               } else if (!strcmp(keyword, "line")) {
>>>                       if (parse_linerange(query, arg))
>>>                               return -EINVAL;
>>> +             } else if (!strcmp(keyword, "class")) {
>>> +                     rc = check_set(&query->class_string, arg, "class");
>>>               } else {
>>>                       pr_err("unknown keyword \"%s\"\n", keyword);
>>>                       return -EINVAL;
>>> @@ -854,6 +890,20 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
>>>       return dp;
>>>  }
>>>
>>> +#define class_in_range(class_id, map)                                        \
>>> +     (class_id >= map->base && class_id < map->base + map->length)
>>> +
>>> +static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
>>> +{
>>> +     struct ddebug_class_map *map;
>>> +
>>> +     list_for_each_entry(map, &iter->table->maps, link)
>>> +             if (class_in_range(dp->class_id, map))
>>> +                     return map->class_names[dp->class_id - map->base];
>>> +
>>> +     return NULL;
>>> +}
>>> +
>>>  /*
>>>   * Seq_ops show method.  Called several times within a read()
>>>   * call from userspace, with ddebug_lock held.  Formats the
>>> @@ -865,6 +915,7 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>>>       struct ddebug_iter *iter = m->private;
>>>       struct _ddebug *dp = p;
>>>       struct flagsbuf flags;
>>> +     char const *class;
>>>
>>>       if (p == SEQ_START_TOKEN) {
>>>               seq_puts(m,
>>> @@ -877,7 +928,16 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
>>>                  iter->table->mod_name, dp->function,
>>>                  ddebug_describe_flags(dp->flags, &flags));
>>>       seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
>>> -     seq_puts(m, "\"\n");
>>> +     seq_puts(m, "\"");
>>> +
>>> +     if (dp->class_id != _DPRINTK_CLASS_DFLT) {
>>> +             class = ddebug_class_name(iter, dp);
>>> +             if (class)
>>> +                     seq_printf(m, " class:%s", class);
>>> +             else
>>> +                     seq_printf(m, " class unknown, _id:%d", dp->class_id);
>>> +     }
>>> +     seq_puts(m, "\n");
>>>
>>>       return 0;
>>>  }
